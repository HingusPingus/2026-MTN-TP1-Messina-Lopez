-- =============================================
--   BASE DE DATOS: Polipalozza
--   CONTENIDO: tablas y relaciones
-- =============================================

create database Polipalozza;
use Polipalozza;

create table Persona(
    dni int primary key,
    nombre varchar(45) not null,
    apellido varchar(45) not null,
    direccion varchar(100),
    telefono bigint,
    mail varchar(100)
);

create table Cliente(
    dni int primary key,
    contrasenia varchar(45) not null,
    foreign key (dni) references Persona(dni)
);

create table Artista(
    dni int primary key,
    generoMusical varchar(45),
    nombreArtistico varchar(80),
    destacado tinyint,
    foreign key (dni) references Persona(dni)
);

create table Rol(
    id int primary key auto_increment,
    nombre varchar(45) not null
);

create table Personal(
    dni int primary key,
    idRol int not null,
    voluntario tinyint,
    contrasenia varchar(45) not null,
    foreign key (dni) references Persona(dni),
    foreign key (idRol) references Rol(id)
);

create table Dia(
    id int primary key auto_increment,
    cantDia int
);

create table Ticket(
    id int primary key auto_increment,
    idDia int not null,
    foreign key (idDia) references Dia(id)
);

create table Tarjeta(
    id int primary key auto_increment,
    numero varchar(19) unique,
    vencimiento date,
    titular varchar(120),
    cvv int check (cvv between 100 and 9999)
);

create table Compra(
    id int primary key auto_increment,
    fecha datetime default now(),
    cantCuotas int not null check (cantCuotas > 0 and cantCuotas < 25),
    dniCliente int not null,
    idTarjeta int not null,
    foreign key (dniCliente) references Cliente(dni),
    foreign key (idTarjeta) references Tarjeta(id)
);

create table Compra_Ticket(
    idCompra int not null,
    idTicket int not null,
    primary key (idCompra, idTicket),
    foreign key (idCompra) references Compra(id),
    foreign key (idTicket) references Ticket(id)
);

create table Sponsor(
    id int primary key auto_increment,
    nombre varchar(45) not null,
    rubro varchar(45)
);

create table Escenario(
    id int primary key auto_increment,
    nombre varchar(45) not null,
    ubicacion varchar(100),
    idSponsor int not null,
    foreign key (idSponsor) references Sponsor(id)
);

create table Setlist(
    id int primary key auto_increment,
    idArtista int not null,
    idEscenario int not null,
    horaInicio time,
    horaFin time,
    dia int not null,
    foreign key (dia) references Dia(id),
    foreign key (idArtista) references Artista(dni),
    foreign key (idEscenario) references Escenario(id)
);

create table Merch(
    id int primary key auto_increment,
    nombre varchar(45) not null,
    precio decimal(10,2) check (precio > 0),
    stock int,
    idArtista int not null,
    foreign key (idArtista) references Artista(dni)
);

create table Compra_Merch(
    idCompra int not null,
    idMerch int not null,
    cantidad int check (cantidad > 0),
    diaRetiro int not null check (diaRetiro between 1 and 3),
    primary key (idCompra, idMerch),
    foreign key (idCompra) references Compra(id),
    foreign key (idMerch) references Merch(id)
);

create table Personal_Escenario(
    id int primary key auto_increment,
    idPersonal int not null,
    idEscenario int not null,
    dia int not null,
    horaInicio time not null,
    horaFin time not null,
    foreign key (idPersonal) references Personal(dni),
    foreign key (idEscenario) references Escenario(id),
    foreign key (dia) references Dia(id)
);

create table Favoritos(
    id int primary key auto_increment,
    dniCliente int not null,
    idSetlist int not null,
    foreign key (dniCliente) references Cliente(dni) on delete cascade,
    foreign key (idSetlist) references Setlist(id) on delete cascade
);

create table Grilla(
    id int primary key auto_increment,
    dniCliente int not null,
    foreign key (dniCliente) references Cliente(dni)
);

create table Grilla_Favoritos(
    idGrilla int not null,
    idFavorito int not null,
    primary key (idGrilla, idFavorito),
    foreign key (idGrilla) references Grilla(id),
    foreign key (idFavorito) references Favoritos(id)
);

create table Notificacion(
    id int primary key auto_increment,
    dniCliente int not null,
    mensaje varchar(255),
    fechaEnvio datetime default now(),
    foreign key (dniCliente) references Cliente(dni)
);

create table Resumen_Evento(
    id int primary key auto_increment,
    fecha datetime default now(),
    asistentes_promedio decimal(10,2),
    artistas_destacados int,
    duracion_promedio time
);

-- ======================================================
--   Correcciones de maga
--   
--   Agregar dniArtista en merch para saber de quien es
--   Tabla n:n para artistas de escenarios (setlist)
--   Tabla n:n para compra merch
--   Corregir n:n grilla
-- ======================================================