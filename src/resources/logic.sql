-- =============================================
--   LOGICA DE NEGOCIO: Polipalozza
--   CONTENIDO: vistas, funciones, procedimientos, triggers, eventos, índices
-- =============================================

use Polipalozza;

-- =============================================
-- 1) VISTAS
-- =============================================

drop view if exists vw_artistas_destacados;
create view vw_artistas_destacados as
select 
    Artista.dni,
    Persona.nombre,
    Persona.apellido,
    Artista.generoMusical
from Artista
join Persona on Artista.dni = Persona.dni
where Artista.destacado = 1;

drop view if exists vw_escenarios_con_sponsor;
create view vw_escenarios_con_sponsor as
select 
    Escenario.id,
    Escenario.nombre as escenario,
    Sponsor.nombre as sponsor,
    Sponsor.rubro
from Escenario
join Sponsor on Escenario.idSponsor = Sponsor.id;


-- =============================================
-- 2) FUNCIONES
-- =============================================

drop function if exists fn_validar_solapamiento_personal;
delimiter $$

create function fn_validar_solapamiento_personal(
    id_personal int,
    dia         int,
    hora_inicio time,
    hora_fin    time
)
returns tinyint
deterministic
begin
    declare existe tinyint default 0;
    declare s1 int;
    declare e1 int;
    declare corte time default '04:00:00';
 
    set s1 = time_to_sec(hora_inicio) + if(hora_inicio <= corte, 86400, 0);
    set e1 = time_to_sec(hora_fin)   + if(hora_fin <= corte, 86400, 0);
    if e1 <= s1 THEN set e1 = e1 + 86400; end if;
 
    select case when count(*) > 0 then 1 else 0 end into existe
    from Personal_Escenario pe
    where pe.idPersonal = id_personal
      and pe.dia        = dia
      and (
            (time_to_sec(pe.horaInicio) + if(pe.horaInicio <= corte, 86400, 0)) < e1
        and (time_to_sec(pe.horaFin)    + if(pe.horaFin <= corte, 86400, 0)) > s1
      );
 
    return existe;
end $$

delimiter ;

drop function if exists fn_validar_solapamiento_setlist;
delimiter $$
create function fn_validar_solapamiento_setlist(
    id_escenario int,
    dia int,
    hora_inicio time,
    hora_fin time
)
returns tinyint
deterministic
begin
    declare existe tinyint default 0;
    declare s1 int;
    declare e1 int;
    declare corte time default '04:00:00';

    set s1 = time_to_sec(hora_inicio) + if(hora_inicio <= corte, 86400, 0);
    set e1 = time_to_sec(hora_fin)   + if(hora_fin <= corte, 86400, 0);
    if e1 <= s1 THEN set e1 = e1 + 86400; end if;

    select case when count(*)>0 then 1 else 0 end into existe
    from Setlist s
    where s.idEscenario = id_escenario
      and s.dia = dia
      and (
            (time_to_sec(s.horaInicio) + if(s.horaInicio <= corte, 86400, 0)) < e1
        and (time_to_sec(s.horaFin)    + if(s.horaFin    <= corte, 86400, 0)) > s1
      );
    return existe;
end $$
delimiter ;

drop function if exists fn_duracion_setlist;
delimiter $$
create function fn_duracion_setlist(setlist_id int)
returns time
deterministic
begin
    declare duracion time default '00:00:00';
    select timediff(horaFin, horaInicio) into duracion
    from Setlist
    where id = Setlist_id
    limit 1;
    return duracion;
end $$
delimiter ;

-- =============================================
-- 3) PROCEDIMIENTOS
-- =============================================

drop procedure if exists sp_agregar_artista;
delimiter $$
create procedure sp_agregar_artista(
    in dni int,
    in nombre varchar(45),
    in apellido varchar(45),
    in genero varchar(45),
    in destacado tinyint
)
begin
    insert into Persona (dni, nombre, apellido)
    values (dni, nombre, apellido);
    
    insert into Artista (dni, generoMusical, destacado)
    values (dni, genero, destacado);
end $$
delimiter ;

drop procedure if exists sp_asignar_personal_minimo;
delimiter $$
create procedure sp_asignar_personal_minimo(
    in escenario_id int,
    in rol_id int,
    in dia_id int,
    in hora_inicio time,
    in hora_fin time,
    in minimo int
)
begin
    declare asignados int default 0;
    declare persona_disponible int;

    select count(*) into asignados
    from Personal_Escenario pe
    join Personal p on pe.idPersonal = p.dni
    where pe.idEscenario = escenario_id
      and pe.dia = dia_id
      and p.idRol = rol_id;

    asignar_loop: loop
        if asignados >= minimo then
            leave asignar_loop;
        end if;

        select p.dni into persona_disponible
        from Personal p
        where p.idRol = rol_id
          and not exists (
              select 1
              from Personal_Escenario pe2
              where pe2.idPersonal = p.dni
                and pe2.dia = dia_id
                and hora_inicio < pe2.horaFin
                and hora_fin > pe2.horaInicio
          )
        limit 1;

        if persona_disponible is null then
            leave asignar_loop;
        end if;

        insert into Personal_Escenario (idPersonal, idEscenario, dia, horaInicio, horaFin)
        values (persona_disponible, escenario_id, dia_id, hora_inicio, hora_fin);

        set asignados = asignados + 1;
        set persona_disponible = null;
    end loop asignar_loop;
end $$
delimiter ;

drop procedure if exists sp_compilar_resumen_evento;
delimiter $$
create procedure coalescesp_compilar_resumen_evento()
begin
    declare fecha_evento datetime;

    select max(fecha) into fecha_evento from Compra;

    if fecha_evento is null then
        insert into Resumen_Evento (fecha, asistentes_promedio, artistas_destacados, duracion_promedio)
        values (now(), 0, (select count(*) from Artista where destacado = 1), '00:00:00');
    else
        insert into Resumen_Evento (fecha, asistentes_promedio, artistas_destacados, duracion_promedio)
        select
            fecha_evento,
            coalesce((
                select avg(cnt) from (
                    select count(distinct c.dniCliente) as cnt
                    from Setlist s
                    join Escenario e on s.idEscenario = e.id
                    join Favoritos f on f.idsetlist = s.id
                    join Compra c on c.dniCliente = f.dniCliente
                    where date(c.fecha) = date(fecha_evento)
                    group by e.id
                ) as sub
            ), 0) as asistentes_promedio,
            (select count(*) from Artista where destacado = 1) as artistas_destacados,
            (select sec_to_time(round(avg(time_to_sec(timediff(horaFin, horaInicio))))) from Setlist) as duracion_promedio;
    end if;
end $$
delimiter ;

drop procedure if exists sp_comprar_ticket;
delimiter $$
create procedure sp_comprar_ticket(
    in dni_cliente int,
    in id_dia int,
    in id_tarjeta int,
    in cuotas int
)
begin
    declare id_compra_generada int;
    declare id_ticket_disponible int;
    
    start transaction;
    
    select Ticket.id into id_ticket_disponible
    from Ticket
    where Ticket.idDia = id_dia
      and Ticket.id not in (
        select Compra_Ticket.idTicket 
        from Compra_Ticket
      )
    limit 1
    for update;

    if id_ticket_disponible is null then
        rollback;
        signal sqlstate '45000'
        set message_text = 'No hay tickets disponibles para este día';
    end if;
    
    insert into Compra (dniCliente, idTarjeta, cantCuotas)
    values (dni_cliente, id_tarjeta, cuotas);
    
    set id_compra_generada = last_insert_id();
    
    insert into Compra_Ticket (idCompra, idTicket)
    values (id_compra_generada, id_ticket_disponible);
    
    commit;
end $$
delimiter ;

-- =============================================
-- 4) TRIGGERS
-- =============================================

drop trigger if exists trg_no_personal_solapado;
delimiter $$
create trigger trg_no_personal_solapado
before insert on Personal_Escenario
for each row
begin
    if fn_validar_solapamiento_personal(new.idPersonal, new.dia, new.horaInicio, new.horaFin) = 1 then
        signal sqlstate '45000'
        set message_text = 'El personal ya está asignado a otro escenario en ese horario';
    end if;
end $$
delimiter ;

drop trigger if exists trg_no_setlist_solapado;
delimiter $$
create trigger trg_no_setlist_solapado
before insert on Setlist
for each row
begin
    if fn_validar_solapamiento_setlist(new.idEscenario, new.dia, new.horaInicio, new.horaFin) = 1 then
        signal sqlstate '45000'
        set message_text = 'Ya existe una presentación en ese escenario en ese horario';
    end if;
end $$
delimiter ;


drop trigger if exists trg_verificar_stock_merch;
delimiter $$
create trigger trg_verificar_stock_merch
before insert on Compra_Merch
for each row
begin
    declare stock_actual int default null;
    
    select stock into stock_actual
    from Merch
    where id = new.idMerch
    limit 1;
    
    if stock_actual is null then
        signal sqlstate '45000'
        set message_text = 'Merchandise inexistente';
    end if;
    
    if stock_actual < new.cantidad then
        signal sqlstate '45000'
        set message_text = 'Stock insuficiente para el merchandise solicitado';
    end if;
end $$
delimiter ;

drop trigger if exists trg_restar_stock_merch_after_insert;
delimiter $$
create trigger trg_restar_stock_merch_after_insert
after insert on Compra_Merch
for each row
begin
    update Merch set stock = stock - new.cantidad where id = new.idMerch;
end $$
delimiter ;

-- =============================================
-- 5) EVENTOS
-- =============================================

-- set GLOBAL event_scheduler = ON;

drop event if exists ev_cancelar_reservas_merch;
delimiter $$
create event ev_cancelar_reservas_merch
on schedule every 1 day
do
begin
    update Compra_Merch cm
    join Compra c on cm.idCompra = c.id
    set cm.cantidad = 0
    where cm.cantidad > 0
      and c.fecha is not null
      and date_add(date(c.fecha), interval cm.diaRetiro day) < curdate();
end $$
delimiter ;

drop event if exists ev_notificar_shows_proximos;
delimiter $$
create event ev_notificar_shows_proximos
on schedule every 20 minute
do
begin
    insert into Notificacion (dniCliente, mensaje, fechaEnvio)
    select distinct f.dniCliente,
        concat('El show de ', p.nombre, ' ', p.apellido, ' comienza en menos de 30 minutos en el escenario \"', e.nombre, '\". Hora: ', date_format(s.horaInicio, '%H:%i')) as mensaje,
        now()
    from Setlist s
    join Escenario e on s.idEscenario = e.id
    join Favoritos f on f.idSetlist = s.id
    join Artista a on s.idArtista = a.dni
    join Persona p on a.dni = p.dni
    left join Notificacion n on n.dniCliente = f.dniCliente
        and n.mensaje = concat('El show de ', p.nombre, ' ', p.apellido, ' comienza en menos de 30 minutos en el escenario \"', e.nombre, '\". Hora: ', date_format(s.horaInicio, '%H:%i'))
        and n.fechaEnvio >= date_sub(now(), interval 1 hour)
    where n.id is null
      and timestampdiff(minute, now(), concat(curdate(), ' ', s.horaInicio)) between 0 and 30;
end $$
delimiter ;

-- =============================================
-- 6) INDICES
-- =============================================

create index idx_setlist_escenario on Setlist(idEscenario);
create index idx_setlist_dia on Setlist(dia);
create index idx_compra_cliente on Compra(dniCliente);
create index idx_merch_nombre on Merch(nombre);
create index idx_personal_rol on Personal(idRol);
create index idx_ticket_dia on Ticket(idDia);
create index idx_favoritos_cliente on Favoritos(dniCliente);

-- ======================================================
--   Correcciones de maga
--   
--   Corregí sp_comprar_ticket para usar la nueva estructura con tabla Compra_Ticket y 
--   Ticket relacionado con Dia
--   Actualicé sp_compilar_resumen_evento para usar Favoritos en lugar de la antigua 
--   Grilla_Personalizada
--   Actualicé ev_notificar_shows_proximos para usar Favoritos y unir con Artista 
--   para el mensaje
--   Agregué trg_verificar_stock_merch para validar stock antes de comprar merchandise
--   Agregué índices adicionales para las nuevas relaciones
-- ======================================================