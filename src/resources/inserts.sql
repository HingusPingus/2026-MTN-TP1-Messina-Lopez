use Polipalozza;

-- =============================================
--   ABSOLUTO
-- =============================================

insert into Dia (cantDia) values
(1), (2), (3);

insert into Rol (nombre) values
('Sonido'),
('Iluminacion'),
('Escenografia'),
('Operador'),
('tecnico');

-- =============================================
--   PERSONA SOBRE CLIENTE
-- =============================================

insert into Persona (dni, nombre, apellido, direccion, telefono, mail) values
(1001, 'Juan', 'Pérez', 'Calle Ficticia 123', 123456789, 'juanperez@mail.com'),
(1002, 'Ana', 'Gómez', 'Avenida Real 456', 987654321, 'anagomez@mail.com'),
(1003, 'Carlos', 'Rodríguez', 'Calle Larga 789', 123123123, 'carlosrodriguez@mail.com'),
(1004, 'Laura', 'Martínez', 'Calle de la Paz 101', 321321321, 'lauramartinez@mail.com'),
(1005, 'Pedro', 'Hernández', 'Calle del Sol 202', 456456456, 'pedrohernandez@mail.com'),
(1006, 'María', 'Fernández', 'Calle de la Luna 303', 654654654, 'mariafernandez@mail.com'),
(1007, 'Luis', 'García', 'Calle del Río 404', 789789789, 'luisgarcia@mail.com'),
(1008, 'Elena', 'López', 'Avenida Libertad 505', 321654987, 'elenalopez@mail.com'),
(1009, 'Miguel', 'Martínez', 'Calle de los Álamos 606', 112233445, 'miguelmartinez@mail.com'),
(1010, 'Sofía', 'Sánchez', 'Calle San Juan 707', 998877665, 'sofisanchez@mail.com'),
(1011, 'Raúl', 'Díaz', 'Calle Nueva 808', 223344556, 'rauldiaz@mail.com'),
(1012, 'Jessica', 'Pérez', 'Calle Gran Vía 909', 776655443, 'jessicaperez@mail.com'),
(1013, 'Ricardo', 'Ramírez', 'Calle Principal 1010', 554433221, 'ricardoramirez@mail.com'),
(1014, 'Gabriela', 'Vargas', 'Calle del Parque 1111', 443322110, 'gabrielavargas@mail.com'),
(1015, 'Javier', 'Mendoza', 'Calle del Mar 1212', 332211998, 'javiermendoza@mail.com'),
(1016, 'Marta', 'Gutiérrez', 'Calle San Pedro 1313', 223355667, 'martagutierrez@mail.com'),
(1017, 'Antonio', 'Morales', 'Calle de la Montaña 1414', 665544332, 'antoniomorales@mail.com'),
(1018, 'Isabel', 'Torres', 'Calle Aragón 1515', 443377889, 'isabeltorres@mail.com'),
(1019, 'Alberto', 'Ramírez', 'Calle del Águila 1616', 556677889, 'albertoramirez@mail.com'),
(1020, 'Carmen', 'Vega', 'Calle Puerta Real 1717', 112233667, 'carmenvega@mail.com'),
(1021, 'Luis', 'Jiménez', 'Calle del Bosque 1818', 665577998, 'luisjimenez@mail.com'),
(1022, 'Raquel', 'Pérez', 'Calle del Sur 1919', 332211445, 'raquelperez@mail.com'),
(1023, 'Juan Carlos', 'Figueroa', 'Calle del Sol Naciente 2020', 789654123, 'juancarlosfigueroa@mail.com'),
(1024, 'Sara', 'Alonso', 'Calle del Viento 2121', 993311556, 'saraalonso@mail.com'),
(1025, 'David', 'Blanco', 'Calle de los Olivos 2222', 665522778, 'davidblanco@mail.com');

-- =============================================
--   CLIENTE
-- =============================================

insert into Cliente (dni, contrasenia) values
(1001, 'contraseña123'),
(1002, 'contraseña456'),
(1003, 'contraseña789'),
(1004, 'contraseña101'),
(1005, 'contraseña202'),
(1006, 'contraseña303'),
(1007, 'contraseña404'),
(1008, 'contraseña505'),
(1009, 'contraseña606'),
(1010, 'contraseña707'),
(1011, 'contraseña808'),
(1012, 'contraseña909'),
(1013, 'contraseña1010'),
(1014, 'contraseña1111'),
(1015, 'contraseña1212'),
(1016, 'contraseña1313'),
(1017, 'contraseña1414'),
(1018, 'contraseña1515'),
(1019, 'contraseña1616'),
(1020, 'contraseña1717'),
(1021, 'contraseña1818'),
(1022, 'contraseña1919'),
(1023, 'contraseña2020'),
(1024, 'contraseña2121'),
(1025, 'contraseña2222');

-- =============================================
--   PERSONA SOBRE PERSONAL
-- =============================================

insert into Persona (dni, nombre, apellido, direccion, telefono, mail) values
(1026, 'Pedro', 'Jiménez', 'Calle de la Estrella 303', 112233667, 'pedrojimenez@mail.com'),
(1027, 'Elena', 'Rodríguez', 'Calle del Río 404', 223344778, 'elenarodriguez@mail.com'),
(1028, 'Luis', 'Molina', 'Avenida del Mar 505', 334455889, 'luismolina@mail.com'),
(1029, 'María', 'Ruiz', 'Calle Central 606', 445566900, 'mariaruiz@mail.com'),
(1030, 'Ricardo', 'González', 'Calle del Sol 707', 556677011, 'ricardogonzalez@mail.com'),
(1031, 'Jessica', 'Jiménez', 'Calle del Norte 808', 667788122, 'jessicajimenez@mail.com'),
(1032, 'Santiago', 'Hernández', 'Avenida de la Paz 909', 778899233, 'santiagohernandez@mail.com'),
(1033, 'Lucía', 'Pérez', 'Calle San José 1010', 889900344, 'luciaperez@mail.com'),
(1034, 'Víctor', 'Vega', 'Calle San Antonio 1111', 990011455, 'victorvega@mail.com'),
(1035, 'Carlos', 'Torres', 'Avenida Real 1212', 100122466, 'carlostorres@mail.com'),
(1036, 'Raquel', 'Gómez', 'Calle El Olmo 1313', 111233577, 'raquelgomez@mail.com'),
(1037, 'José', 'Alonso', 'Calle de los Almendros 1414', 122344688, 'josealonso@mail.com'),
(1038, 'Marta', 'Castro', 'Calle del Viento 1515', 133455799, 'martacastro@mail.com'),
(1039, 'Pablo', 'Sánchez', 'Calle Alta 1616', 144566800, 'pablosanchez@mail.com'),
(1040, 'Andrea', 'Méndez', 'Calle Nueva 1717', 155677911, 'andreamendez@mail.com'),
(1041, 'David', 'García', 'Calle del Árbol 1818', 166788022, 'davidgarcia@mail.com'),
(1042, 'Cristina', 'Vázquez', 'Calle La Rosa 1919', 177899133, 'cristinavazquez@mail.com'),
(1043, 'Martín', 'Moreno', 'Calle del Río 2020', 188900244, 'martinmoreno@mail.com'),
(1044, 'Esteban', 'Serrano', 'Calle del Sol 2121', 199011355, 'estebanserrano@mail.com'),
(1045, 'Verónica', 'Díaz', 'Calle del Lago 2222', 200122466, 'veronicadiaz@mail.com'),
(1046, 'Javier', 'Soler', 'Calle Real 2323', 211233577, 'javiersoler@mail.com'),
(1047, 'Marina', 'Calleja', 'Calle de la Luna 2424', 222344688, 'marinacalleja@mail.com'),
(1048, 'Rubén', 'Ríos', 'Calle de las Flores 2525', 233455799, 'rubenrios@mail.com'),
(1049, 'Alicia', 'García', 'Calle del Parque 2626', 244566800, 'aliciagarcia@mail.com'),
(1050, 'Fernando', 'Morales', 'Calle San Martín 2727', 255677911, 'fernandomorales@mail.com');

insert into Persona (dni, nombre, apellido, direccion, telefono, mail) values
(1147, 'Natalia', 'Paz', 'Calle Ficticia 5001', 555111222, 'nataliapaz@mail.com'),     -- Rol 1 (Sonido)
(1148, 'Felipe', 'Nuñez', 'Avenida Real 5002', 555222333, 'felipenunez@mail.com'),     -- Rol 1 (Sonido)
(1149, 'Sofía', 'Castro', 'Calle Larga 5003', 555333444, 'sofiacastro@mail.com'),     -- Rol 1 (Sonido)
(1150, 'Gael', 'Herrera', 'Calle de la Paz 5004', 555444555, 'gaelherrera@mail.com'),   -- Rol 2 (Iluminacion)
(1151, 'Valeria', 'Rojas', 'Calle del Sol 5005', 555555666, 'valeriarojas@mail.com'),   -- Rol 2 (Iluminacion)
(1152, 'Damián', 'Silva', 'Calle de la Luna 5006', 555666777, 'damiansilva@mail.com'),  -- Rol 2 (Iluminacion)
(1153, 'Renata', 'Vidal', 'Calle del Río 5007', 555777888, 'renatavidal@mail.com'),    -- Rol 3 (Escenografia)
(1154, 'Hugo', 'Pinto', 'Avenida Libertad 5008', 555888999, 'hugopinto@mail.com'),     -- Rol 3 (Escenografia)
(1155, 'Abril', 'Márquez', 'Calle de los Álamos 5009', 555999000, 'abrilmarquez@mail.com'), -- Rol 3 (Escenografia)
(1156, 'Enzo', 'Arias', 'Calle San Juan 5010', 555000111, 'enzoarias@mail.com'),      -- Rol 4 (Operador)
(1157, 'Candela', 'Bravo', 'Calle Nueva 5011', 555111000, 'candelabravo@mail.com'),    -- Rol 4 (Operador)
(1158, 'Mateo', 'Cordero', 'Calle Gran Vía 5012', 555222111, 'mateocordero@mail.com'),  -- Rol 4 (Operador)
(1159, 'Agustina', 'Delgado', 'Calle Principal 5013', 555333222, 'agustinadelgado@mail.com'), -- Rol 5 (tecnico)
(1160, 'Ian', 'Espinoza', 'Calle del Parque 5014', 555444333, 'ianespinoza@mail.com'),   -- Rol 5 (tecnico)
(1161, 'Julieta', 'Flores', 'Calle del Mar 5015', 555555444, 'julietaflores@mail.com');  -- Rol 5 (tecnico)

-- =============================================
--   PERSONAL
-- =============================================

insert into Personal (dni, idRol, voluntario, contrasenia) values
(1026, 1, 0, 'sonido123'),   -- Sonido
(1027, 2, 0, 'iluminacion123'),  -- Iluminación
(1028, 3, 0, 'escenografia123'),  -- Escenografía
(1029, 4, 0, 'operador123'),  -- Operador
(1030, 5, 0, 'tecnico123'),  -- tecnico
(1031, 1, 0, 'sonido456'),   -- Sonido
(1032, 2, 0, 'iluminacion456'),  -- Iluminación
(1033, 3, 0, 'escenografia456'),  -- Escenografía
(1034, 4, 0, 'operador456'),  -- Operador
(1035, 5, 0, 'tecnico456'),  -- tecnico
(1036, 1, 0, 'sonido789'),   -- Sonido
(1037, 2, 0, 'iluminacion789'),  -- Iluminación
(1038, 3, 0, 'escenografia789'),  -- Escenografía
(1039, 4, 0, 'operador789'),  -- Operador
(1040, 5, 0, 'tecnico789'),  -- tecnico
(1041, 1, 0, 'sonido1010'),  -- Sonido
(1042, 2, 0, 'iluminacion1010'),  -- Iluminación
(1043, 3, 0, 'escenografia1010'),  -- Escenografía
(1044, 4, 0, 'operador1010'),  -- Operador
(1045, 5, 0, 'tecnico1010'),  -- tecnico
(1046, 1, 0, 'sonido1111'),  -- Sonido
(1047, 2, 0, 'iluminacion1111'),  -- Iluminación
(1048, 3, 0, 'escenografia1111'),  -- Escenografía
(1049, 4, 0, 'operador1111'),  -- Operador
(1050, 5, 0, 'tecnico1111');  -- tecnico

insert into Personal (dni, idRol, voluntario, contrasenia) values
-- Roles 1 (Sonido)
(1147, 1, 0, 'sonido1212'),
(1148, 1, 0, 'sonido1313'),
(1149, 1, 0, 'sonido1414'),

-- Roles 2 (Iluminacion)
(1150, 2, 0, 'iluminacion1212'),
(1151, 2, 0, 'iluminacion1313'),
(1152, 2, 0, 'iluminacion1414'),

-- Roles 3 (Escenografia)
(1153, 3, 0, 'escenografia1212'),
(1154, 3, 0, 'escenografia1313'),
(1155, 3, 0, 'escenografia1414'),

-- Roles 4 (Operador)
(1156, 4, 0, 'operador1212'),
(1157, 4, 0, 'operador1313'),
(1158, 4, 0, 'operador1414'),

-- Roles 5 (tecnico)
(1159, 5, 0, 'tecnico1212'),
(1160, 5, 0, 'tecnico1313'),
(1161, 5, 0, 'tecnico1414');

-- =============================================
--   SPONSOR
-- =============================================

insert into Sponsor (nombre, rubro) values
-- Streaming
('Flow', 'Streaming'),

-- E-commerce
('Mercado Libre', 'E-commerce'),

-- Bebidas
('Brahma', 'Bebidas'),
('Coca-Cola', 'Bebidas'),
('Smartwater', 'Bebidas'),
('Aquarius', 'Bebidas'),
('Red Bull', 'Bebidas'),

-- Comida Rápida (con marcas conocidas)
('Mi Gusto', 'Comida'),
('La Mía Pizza', 'Comida'),
('Burguer King', 'Comida'),
('McDonalds', 'Comida'),
('Taco Bell', 'Comida'),
('Subway', 'Comida'),
('Choripán Express', 'Comida'),

-- Equipo tecnico / Electronica
('Schneider Electric', 'Equipo tecnico'),
('Trane', 'Equipo tecnico'),
('Sony', 'Equipo tecnico'),
('Panasonic', 'Electrónica'),
('Audio-Technica', 'Equipo tecnico'),
('Shure', 'Equipo tecnico'),

-- Infantil

('Mimo & Co', 'Indumentaria Infantil'),
('Neverland', 'Entretenimiento/Arcades');

-- =============================================
--   PERSONA SOBRE ARTISTA URBANO
-- =============================================

insert into Persona (dni, nombre, apellido, mail) values
(1051, 'Taiu', 'Pishen', 'taichu@artista.com'),           -- Nombre real de Taichu
(1052, 'Lara', 'Nicoletta', 'lara91k@artista.com'),        -- Nombre real de Lara91k
(1053, 'Tomás', 'Duarte', 'tobi@artista.com'),             -- Nombre real de Tobi
(1054, 'Luciano', 'Vignolo', 'luchossj@artista.com'),      -- Nombre real de Lucho SSJ
(1055, 'Ca7riel y Paco', 'Amoroso', 'ca7rielpaco@artista.com'), -- Dúo
(1056, 'Sara Azul', 'Frojan', 'saramalacara@artista.com'),    -- Nombre artístico, ya que no se usa el real
(1057, 'Indra', 'Buchmann Tiribelli', 'bhavi@artista.com'),             -- Nombre real de Bhavi
(1058, 'Eladio', 'Carrión', 'eladiocarrion@artista.com'),  -- Nombre real/artístico
(1059, 'Alejo', 'Acosta', 'ysya@artista.com'),             -- Nombre real de YSY A
(1060, 'Jacques', 'Webster', 'travisscott@artista.com'),   -- Nombre real de Travis Scott
(1061, 'Joaquín', 'Cordovero', 'sevenkayne@artista.com'),  -- Nombre real de Seven Kayne
(1062, 'Tomás', 'Lechuga', 'eldoctor@artista.com'),        -- Nombre real de El Doctor
(1063, 'Julián', 'Reininger', 'rei@artista.com'),          -- Nombre real de Rei
(1064, 'Ivo', 'Serue', 'khea@artista.com'),                -- Nombre real de KHEA
(1065, 'Mauro', 'Monzón', 'litkillah@artista.com'),        -- Nombre real de Lit Killah
(1066, 'Julieta', 'Cazzuchelli', 'cazzu@artista.com'),     -- **Nombre real de Cazzu**
(1067, 'Tiago', 'Urbano', 'tiagopzk@artista.com'),         -- Nombre real de Tiago PZK
(1068, 'Michael', 'Torres', 'myketowers@artista.com'),     -- Nombre real de Myke Towers
(1069, 'Kendrick', 'Lamar', 'kendricklamar@artista.com'),  -- Nombre real/artístico
(1070, 'Mauro', 'Lombardo', 'duki@artista.com'),           -- **Nombre real de Duki**
(1071, 'Nicolas Exequiel', 'De Lorenzo', 'muerejoven@artista.com'),  -- Nombre artístico (solista con nombre único)
(1072, 'Joaquina', 'Lerena', 'lajoaqui@artista.com'),      -- Nombre real de La Joaqui
(1073, 'Sebastian Ezequiel', 'Chinellato', 'neopistea@artista.com'),          -- Nombre artístico (solista con nombre único)
(1074, 'María', 'Becerra', 'mariabecerra@artista.com'),    -- Nombre real/artístico
(1075, 'Nicole', 'Cucco', 'nickinicole@artista.com'),      -- Nombre real de Nicki Nicole
(1076, 'Camilo', 'Joaquin', 'miloj@artista.com'),          -- Nombre real de Milo J
(1077, 'Tomás', 'Manuel', 'cro@artista.com'),              -- Nombre real de C.R.O
(1078, 'Aubrey', 'Graham', 'drake@artista.com'),           -- Nombre real de Drake
(1079, 'Mateo', 'Palacios', 'trueno@artista.com'),         -- Nombre real de Trueno
(1080, 'Gonzalo', 'Julián Conde', 'bizarrap@artista.com');  -- **Nombre real de Bizarrap**

-- =============================================
--   ARTISTA URBANO
-- =============================================

insert into Artista (dni, generoMusical, nombreArtistico, destacado) values
(1051, 'Urbano/Trap', 'Taichu', 0),
(1052, 'Urbano/Trap', 'Lara91k', 0),
(1053, 'Urbano/Trap', 'Tobi', 0),
(1054, 'Urbano/Trap', 'Lucho SSJ', 0),
(1055, 'Urbano/Trap', 'Ca7riel y Paco Amoroso', 0),
(1056, 'Urbano/Trap', 'Sara Mala Cara', 0),
(1057, 'Urbano/Trap', 'Bhavi', 0),
(1058, 'Urbano/Trap', 'Eladio Carrión', 1),
(1059, 'Urbano/Trap', 'YSY A', 1),
(1060, 'Urbano/Trap', 'Travis Scott', 1),
(1061, 'Urbano/Trap', 'Seven Kayne', 0),
(1062, 'Urbano/Trap', 'El Doctor', 0),
(1063, 'Urbano/Trap', 'Rei', 0),
(1064, 'Urbano/Trap', 'KHEA', 0),
(1065, 'Urbano/Trap', 'Lit Killah', 0),
(1066, 'Urbano/Trap', 'Cazzu', 0),
(1067, 'Urbano/Trap', 'Tiago PZK', 0),
(1068, 'Urbano/Trap', 'Myke Towers', 1),
(1069, 'Urbano/Trap', 'Kendrick Lamar', 1),
(1070, 'Urbano/Trap', 'Duki', 1),
(1071, 'Urbano/Trap', 'Muerejoven', 0),
(1072, 'Urbano/Trap', 'La Joaqui', 0),
(1073, 'Urbano/Trap', 'Neo Pistea', 0),
(1074, 'Urbano/Trap', 'María Becerra', 0),
(1075, 'Urbano/Trap', 'Nicki Nicole', 0),
(1076, 'Urbano/Trap', 'Milo J', 0),
(1077, 'Urbano/Trap', 'C.R.O', 0),
(1078, 'Urbano/Trap', 'Drake', 1),
(1079, 'Urbano/Trap', 'Trueno', 1),
(1080, 'Urbano/Trap', 'Bizarrap', 1);

-- =============================================
--   PERSONA SOBRE ARTISTA KIDS
-- =============================================

insert into Persona (dni, nombre, apellido, mail) values
(1081, 'Laura', 'Franco', 'panam@artista.com'),             -- Nombre real de Panam
(1082, 'Mundo Jurásico', 'Kids', 'jurassickids@artista.com'), -- Banda
(1083, 'Pequeño', 'Pez', 'pequenopez@artista.com'),          -- Banda
(1084, 'La Banda de las', 'Corbatas', 'corbatas@artista.com'),-- Banda
(1085, 'Pancito', 'Musical', 'pancito@artista.com'),         -- Banda
(1086, 'Koufequin', 'Banda', 'koufequin@artista.com'),      -- Banda
(1087, 'Bigolates de', 'Chocote', 'bigolates@artista.com'), -- Banda
(1088, 'Los', 'Raviolis', 'losraviolis@artista.com'),       -- Banda
(1089, 'Rayos y', 'Centellas', 'rayoscentellas@artista.com'),-- Banda
(1090, 'Canticuénticos', 'Jr.', 'canticuenticosjr@artista.com'),-- Banda
(1091, 'Banda', 'Tapita', 'bandatapita@artista.com'),       -- Banda
(1092, 'Zamba y', 'Nina', 'zambanina@artista.com'),         -- Personajes
(1093, 'Las', 'Magdalenas', 'magdalenas@artista.com'),      -- Banda
(1094, 'Capitán', 'Sanata', 'capitansanata@artista.com'),   -- Personaje
(1095, 'Diego', 'Topa', 'topa@artista.com');                -- Nombre real de Topa

-- =============================================
--   ARTISTA KIDS
-- =============================================

insert into Artista (dni, generoMusical, nombreArtistico, destacado) values
(1081, 'Infantil', 'Panam', 0),
(1082, 'Infantil', 'Mundo Jurásico Kids', 0),
(1083, 'Infantil', 'Pequeño Pez', 0),
(1084, 'Infantil', 'La Banda de las Corbatas', 0),
(1085, 'Infantil', 'Pancito Musical', 0),
(1086, 'Infantil', 'Koufequin', 0),
(1087, 'Infantil', 'Bigolates de Chocote', 0),
(1088, 'Infantil', 'Los Raviolis', 0),
(1089, 'Infantil', 'Rayos y Centellas', 0),
(1090, 'Infantil', 'Canticuénticos Jr.', 0),
(1091, 'Infantil', 'Banda Tapita', 0),
(1092, 'Infantil', 'Zamba y Nina', 0),
(1093, 'Infantil', 'Las Magdalenas', 0),
(1094, 'Infantil', 'Capitán Sanata', 0),
(1095, 'Infantil', 'Topa', 1);

-- =============================================
--   PERSONA SOBRE ARTISTA ROCK
-- =============================================

insert into Persona (dni, nombre, apellido, mail) values
(1096, 'Mateo', 'Suárez', 'conociendorusia@artista.com'),  -- Nombre real de Conociendo Rusia
(1097, 'El Mató a un Policía', 'Motorizado', 'elmatoa@artista.com'), -- Banda
(1098, 'La Vela', 'Puerca', 'velapuerca@artista.com'),      -- Banda
(1099, 'Babasónicos', 'Banda', 'babasonicos@artista.com'),  -- Banda
(1100, 'Airbag', 'Banda', 'airbag@artista.com'),            -- Banda
(1101, 'Ratones', 'Paranoicos', 'ratonesparanoicos@artista.com'), -- Banda
(1102, 'Ciro', 'Martínez', 'ciroylospersas@artista.com'),    -- Nombre real de Ciro
(1103, 'The', 'Strokes', 'thestrokes@artista.com'),         -- Banda
(1104, 'Foo', 'Fighters', 'foofighters@artista.com'),       -- Banda
(1105, 'Los', 'Tipitos', 'lostipitos@artista.com'),         -- Banda
(1106, 'Usted', 'Señalemelo', 'usteds@artista.com'),        -- Banda
(1107, 'Turf', 'Banda', 'turf@artista.com'),                -- Banda
(1108, 'Eruca', 'Sativa', 'erucasativa@artista.com'),       -- Banda
(1109, 'No Te Va', 'Gustar', 'notevagustar@artista.com'),   -- Banda
(1110, 'Los Auténticos', 'Decadentes', 'autenticosdecadentes@artista.com'), -- Banda
(1111, 'Rodolfo', 'Páez', 'fitopaez@artista.com'),          -- Nombre real de Fito Páez
(1112, 'Arctic', 'Monkeys', 'arcticmonkeys@artista.com'),   -- Banda
(1113, 'Red Hot Chili', 'Peppers', 'rhcp@artista.com'),     -- Banda
(1114, 'Las Ligas', 'Menores', 'lasligasmenores@artista.com'), -- Banda
(1115, 'Santiago', 'Motorizado', 'santiagomotorizado@artista.com'), -- Nombre real
(1116, 'Bandalos', 'Chinos', 'bandaloschinos@artista.com'),  -- Banda
(1117, 'La', 'Renga', 'larenga@artista.com'),               -- Banda
(1118, 'Skay', 'Beilinson', 'skayylosfakires@artista.com'),  -- Nombre real de Skay
(1119, 'Divididos', 'Banda', 'divididos@artista.com'),       -- Banda
(1120, 'Tame', 'Impala', 'tameimpala@artista.com'),          -- Banda
(1121, 'Muse', 'Banda', 'muse@artista.com'),                -- Banda
(1122, 'Coldplay', 'Banda', 'coldplay@artista.com');        -- Banda

-- =============================================
--   ARTISTA ROCK
-- =============================================

insert into Artista (dni, generoMusical, nombreArtistico, destacado) values
(1096, 'Rock', 'Conociendo Rusia', 0),
(1097, 'Rock', 'El Mató a un Policía Motorizado', 0),
(1098, 'Rock', 'La Vela Puerca', 0),
(1099, 'Rock', 'Babasónicos', 0),
(1100, 'Rock', 'Airbag', 0),
(1101, 'Rock', 'Ratones Paranoicos', 0),
(1102, 'Rock', 'Ciro y los Persas', 0),
(1103, 'Rock', 'The Strokes', 1),
(1104, 'Rock', 'Foo Fighters', 1),
(1105, 'Rock', 'Los Tipitos', 0),
(1106, 'Rock', 'Usted Señalemelo', 0),
(1107, 'Rock', 'Turf', 0),
(1108, 'Rock', 'Eruca Sativa', 0),
(1109, 'Rock', 'No Te Va Gustar', 0),
(1110, 'Rock', 'Los Auténticos Decadentes', 0),
(1111, 'Rock', 'Fito Páez', 0),
(1112, 'Rock', 'Arctic Monkeys', 1),
(1113, 'Rock', 'Red Hot Chili Peppers', 1),
(1114, 'Rock', 'Las Ligas Menores', 0),
(1115, 'Rock', 'Santiago Motorizado', 0),
(1116, 'Rock', 'Bandalos Chinos', 0),
(1117, 'Rock', 'La Renga', 0),
(1118, 'Rock', 'Skay y los Fakires', 0),
(1119, 'Rock', 'Divididos', 0),
(1120, 'Rock', 'Tame Impala', 1),
(1121, 'Rock', 'Muse', 1),
(1122, 'Rock', 'Coldplay', 1);

-- =============================================
--   PERSONA SOBRE ARTISTA COMPLEMENTARIO
-- =============================================

-- 🎹 ESCENARIO INDIE / ALTERNATIVO / ELECTRÓNICA
insert into Persona (dni, nombre, apellido, mail) values
(1123, 'Glass', 'Animals', 'glassanimals@artista.com'),     -- Banda
(1124, 'Parcels', 'Banda', 'parcels@artista.com'),          -- Banda
(1125, 'Magdalena', 'Bay', 'magdalenabay@artista.com'),     -- Banda
(1126, 'Japanese', 'Breakfast', 'japanese@artista.com'),     -- Banda
(1127, 'King', 'Princess', 'kingprincess@artista.com'),     -- Solista con nombre único
(1128, 'Pond', 'Banda', 'pond@artista.com'),                -- Banda
(1129, 'Hot', 'Chip', 'hotchip@artista.com'),               -- Banda
(1130, 'Car Seat', 'Headrest', 'carseat@artista.com'),      -- Banda
(1131, 'Men I', 'Trust', 'menitrust@artista.com'),          -- Banda
(1132, 'Claire', 'Cottrill', 'clairo@artista.com'),          -- Nombre real de Clairo
(1133, 'The', 'Marías', 'themarias@artista.com'),           -- Banda
(1134, 'Alvvays', 'Banda', 'alvvays@artista.com'),          -- Banda
(1135, 'Wolf', 'Alice', 'wolfalice@artista.com'),           -- Banda
(1136, 'Amber', 'Bain', 'thejapanesehouse@artista.com'),    -- Nombre real de The Japanese House
(1137, 'Chazwick', 'Bundick', 'toroymoi@artista.com'),      -- Nombre real de Toro y Moi
(1138, 'Khruangbin', 'Banda', 'khruangbin@artista.com'),     -- Banda
(1139, 'Beatrice', 'Laus', 'beabadoobee@artista.com'),       -- Nombre real de Beabadoobee
(1140, 'Lindsey', 'Jordan', 'snailmail@artista.com'),        -- Nombre real de Snail Mail
(1141, 'Sophie', 'Allison', 'soccermommy@artista.com'),      -- Nombre real de Soccer Mommy
(1142, 'Phoebe', 'Bridgers', 'phoebebridgers@artista.com'),  -- Nombre real
(1143, 'Marie', 'Ulven', 'girlinred@artista.com'),           -- Nombre real de Girl in Red
(1144, 'Mac', 'DeMarco', 'macdemarco@artista.com'),          -- Nombre real
(1145, 'Alt-J', 'Banda', 'altj@artista.com'),                -- Banda
(1146, 'TV', 'Girl', 'tvgirl@artista.com');                  -- Banda

-- =============================================
--   ARTISTA COMPLEMENTARIO
-- =============================================

insert into Artista (dni, generoMusical, nombreArtistico, destacado) values
(1123, 'Indie/Alt/Elec', 'Glass Animals', 0),
(1124, 'Indie/Alt/Elec', 'Parcels', 0),
(1125, 'Indie/Alt/Elec', 'Magdalena Bay', 0),
(1126, 'Indie/Alt/Elec', 'Japanese Breakfast', 0),
(1127, 'Indie/Alt/Elec', 'King Princess', 0),
(1128, 'Indie/Alt/Elec', 'Pond', 0),
(1129, 'Indie/Alt/Elec', 'Hot Chip', 0),
(1130, 'Indie/Alt/Elec', 'Car Seat Headrest', 0),
(1131, 'Indie/Alt/Elec', 'Men I Trust', 0),
(1132, 'Indie/Alt/Elec', 'Clairo', 0),
(1133, 'Indie/Alt/Elec', 'The Marías', 0),
(1134, 'Indie/Alt/Elec', 'Alvvays', 0),
(1135, 'Indie/Alt/Elec', 'Wolf Alice', 0),
(1136, 'Indie/Alt/Elec', 'The Japanese House', 0),
(1137, 'Indie/Alt/Elec', 'Toro y Moi', 0),
(1138, 'Indie/Alt/Elec', 'Khruangbin', 0),
(1139, 'Indie/Alt/Elec', 'Beabadoobee', 0),
(1140, 'Indie/Alt/Elec', 'Snail Mail', 0),
(1141, 'Indie/Alt/Elec', 'Soccer Mommy', 0),
(1142, 'Indie/Alt/Elec', 'Phoebe Bridgers', 0),
(1143, 'Indie/Alt/Elec', 'Girl in Red', 0),
(1144, 'Indie/Alt/Elec', 'Mac DeMarco', 0),
(1145, 'Indie/Alt/Elec', 'Alt-J', 0),
(1146, 'Indie/Alt/Elec', 'TV Girl', 1);

-- =============================================
--   ESCENARIO
-- =============================================

insert into Escenario (id, nombre, ubicacion, idSponsor) values
(1, 'URBANO / TRAP', 'Sector Norte', 1),   -- Flow
(2, 'ROCK', 'Sector Central', 2),          -- Mercado Libre
(3, 'INDIE / ALT / ELECTRÓNICA', 'Sector Oeste', 17), -- Sony 
(4, 'KIDS', 'Sector Familiar', 22);         -- Neverland 

-- =============================================
--   SETLIST URBANA
-- =============================================

-- DÍA 1
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1051, 1, '13:00:00', '13:30:00', 1), -- Taichu
(1052, 1, '13:45:00', '14:20:00', 1), -- Lara91k
(1053, 1, '14:35:00', '15:15:00', 1), -- Tobi
(1054, 1, '15:30:00', '16:15:00', 1), -- Lucho SSJ
(1055, 1, '16:30:00', '17:20:00', 1), -- Ca7riel & Paco Amoroso
(1056, 1, '17:35:00', '18:30:00', 1), -- Saramalacara
(1057, 1, '18:45:00', '19:45:00', 1), -- Bhavi
(1058, 1, '20:00:00', '21:15:00', 1), -- Eladio Carrión
(1059, 1, '21:30:00', '23:00:00', 1), -- YSY A
(1060, 1, '23:15:00', '00:45:00', 1); -- Travis Scott

-- DÍA 2
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1061, 1, '13:00:00', '13:30:00', 2), -- Seven Kayne
(1062, 1, '13:45:00', '14:20:00', 2), -- El Doctor
(1063, 1, '14:35:00', '15:15:00', 2), -- Rei
(1064, 1, '15:30:00', '16:15:00', 2), -- KHEA
(1065, 1, '16:30:00', '17:20:00', 2), -- Lit Killah
(1066, 1, '17:35:00', '18:30:00', 2), -- Cazzu
(1067, 1, '18:45:00', '19:45:00', 2), -- Tiago PZK
(1068, 1, '20:00:00', '21:15:00', 2), -- Myke Towers
(1069, 1, '21:30:00', '23:00:00', 2), -- Kendrick Lamar
(1070, 1, '23:15:00', '00:45:00', 2); -- DUKI

-- DÍA 3
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1071, 1, '13:00:00', '13:30:00', 3), -- Muerejoven
(1072, 1, '13:45:00', '14:20:00', 3), -- La Joaqui
(1073, 1, '14:35:00', '15:15:00', 3), -- Neo Pistea
(1074, 1, '15:30:00', '16:15:00', 3), -- María Becerra
(1075, 1, '16:30:00', '17:20:00', 3), -- Nicki Nicole
(1076, 1, '17:35:00', '18:30:00', 3), -- Milo J
(1077, 1, '18:45:00', '19:45:00', 3), -- C.R.O
(1078, 1, '20:00:00', '21:15:00', 3), -- Drake
(1079, 1, '21:30:00', '23:00:00', 3), -- Trueno
(1080, 1, '23:15:00', '00:45:00', 3); -- Bizarrap

-- =============================================
--   SETLIST ROCK
-- =============================================

-- DÍA 1
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1096, 2, '13:00:00', '13:25:00', 1), -- Conociendo Rusia
(1097, 2, '13:40:00', '14:10:00', 1), -- El Mató a un Policía Motorizado
(1098, 2, '14:25:00', '15:05:00', 1), -- La Vela Puerca
(1099, 2, '15:20:00', '16:00:00', 1), -- Babasónicos
(1100, 2, '16:15:00', '17:05:00', 1), -- Airbag
(1101, 2, '17:20:00', '18:20:00', 1), -- Ratones Paranoicos
(1102, 2, '18:35:00', '19:55:00', 1), -- Ciro y Los Persas
(1103, 2, '20:10:00', '21:40:00', 1), -- The Strokes
(1104, 2, '21:55:00', '23:45:00', 1); -- Foo Fighters

-- DÍA 2
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1105, 2, '13:00:00', '13:25:00', 2), -- Los Tipitos
(1106, 2, '13:40:00', '14:10:00', 2), -- Usted Señalemelo
(1107, 2, '14:25:00', '15:00:00', 2), -- Turf
(1108, 2, '15:15:00', '15:55:00', 2), -- Eruca Sativa
(1109, 2, '16:10:00', '17:00:00', 2), -- No Te Va Gustar
(1110, 2, '17:15:00', '18:15:00', 2), -- Los Auténticos Decadentes
(1111, 2, '18:30:00', '19:45:00', 2), -- Fito Páez
(1112, 2, '20:00:00', '21:45:00', 2), -- Arctic Monkeys
(1113, 2, '22:00:00', '23:45:00', 2); -- Red Hot Chili Peppers

-- DÍA 3
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1114, 2, '13:00:00', '13:25:00', 3), -- Las Ligas Menores
(1115, 2, '13:40:00', '14:10:00', 3), -- Santiago Motorizado
(1116, 2, '14:25:00', '15:00:00', 3), -- Bandalos Chinos
(1117, 2, '15:15:00', '15:55:00', 3), -- La Renga
(1118, 2, '16:10:00', '17:00:00', 3), -- Skay y Los Fakires
(1119, 2, '17:15:00', '18:30:00', 3), -- Divididos
(1120, 2, '18:45:00', '20:15:00', 3), -- Tame Impala
(1121, 2, '20:30:00', '22:00:00', 3), -- Muse
(1122, 2, '22:15:00', '00:00:00', 3); -- Coldplay

-- =============================================
--   SETLIST COMPLEMENTARIO
-- =============================================

-- DÍA 1
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1123, 3, '14:00:00', '14:25:00', 1), -- Glass Animals
(1124, 3, '14:40:00', '15:05:00', 1), -- Parcels
(1125, 3, '15:20:00', '15:50:00', 1), -- Magdalena Bay
(1126, 3, '16:05:00', '16:40:00', 1), -- Japanese Breakfast
(1127, 3, '16:55:00', '17:35:00', 1), -- King Princess
(1128, 3, '17:50:00', '18:35:00', 1), -- Pond
(1129, 3, '18:50:00', '19:40:00', 1), -- Hot Chip
(1130, 3, '19:55:00', '20:40:00', 1); -- Car Seat Headrest

-- DÍA 2
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1131, 3, '14:00:00', '14:25:00', 2), -- Men I Trust
(1132, 3, '14:40:00', '15:05:00', 2), -- Clairo
(1133, 3, '15:20:00', '15:50:00', 2), -- The Marías
(1134, 3, '16:05:00', '16:40:00', 2), -- Alvvays
(1135, 3, '16:55:00', '17:35:00', 2), -- Wolf Alice
(1136, 3, '17:50:00', '18:35:00', 2), -- The Japanese House
(1137, 3, '18:50:00', '19:40:00', 2), -- Toro y Moi
(1138, 3, '19:55:00', '20:40:00', 2); -- Khruangbin

-- DÍA 3
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1139, 3, '14:00:00', '14:25:00', 3), -- Beabadoobee
(1140, 3, '14:40:00', '15:05:00', 3), -- Snail Mail
(1141, 3, '15:20:00', '15:50:00', 3), -- Soccer Mommy
(1142, 3, '16:05:00', '16:40:00', 3), -- Phoebe Bridgers
(1143, 3, '16:55:00', '17:35:00', 3), -- Girl in Red
(1144, 3, '17:50:00', '18:35:00', 3), -- Mac DeMarco
(1145, 3, '18:50:00', '19:40:00', 3), -- Alt-J
(1146, 3, '19:55:00', '20:40:00', 3); -- TV Girl

-- =============================================
--   SETLIST KIDS
-- =============================================

-- DÍA 1
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1081, 4, '13:00:00', '13:20:00', 1), -- Panam
(1082, 4, '13:35:00', '13:55:00', 1), -- Mundo Jurásico Kids
(1083, 4, '14:10:00', '14:35:00', 1), -- Pequeño Pez
(1084, 4, '14:50:00', '15:15:00', 1), -- La Banda de las Corbatas
(1085, 4, '15:30:00', '16:00:00', 1); -- Pancito

-- DÍA 2
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1086, 4, '13:00:00', '13:25:00', 2), -- Koufequin
(1087, 4, '13:40:00', '14:00:00', 2), -- Bigolates de Chocote
(1088, 4, '14:15:00', '14:40:00', 2), -- Los Raviolis
(1089, 4, '14:55:00', '15:15:00', 2), -- Rayos y Centellas
(1090, 4, '15:30:00', '16:00:00', 2); -- Canticuénticos Jr.

-- DÍA 3
insert into Setlist (idArtista, idEscenario, horaInicio, horaFin, dia) values
(1091, 4, '13:00:00', '13:20:00', 3), -- Banda Tapita
(1092, 4, '13:35:00', '13:55:00', 3), -- Zamba y Nina
(1093, 4, '14:10:00', '14:30:00', 3), -- Las Magdalenas
(1094, 4, '14:45:00', '15:10:00', 3), -- Capitán Sanata
(1095, 4, '15:25:00', '16:10:00', 3); -- Topa

-- =============================================
--   PERSONAL_ESCENARIO - DÍA 1
-- =============================================
insert into Personal_Escenario (idPersonal, idEscenario, dia, horaInicio, horaFin) values
-- TURNO TARDE (12:00:00 - 18:30:00)
-- Escenario 1
(1026, 1, 1, '12:00:00', '18:30:00'), -- Sonido E1
(1034, 1, 1, '12:00:00', '18:30:00'), -- Operador E1
(1038, 1, 1, '12:00:00', '18:30:00'), -- Escenografia E1
(1042, 1, 1, '12:00:00', '18:30:00'), -- Iluminacion E1
(1030, 1, 1, '12:00:00', '18:30:00'), -- Tecnico E1

-- Escenario 2
(1031, 2, 1, '12:00:00', '18:30:00'), -- Sonido E2
(1027, 2, 1, '12:00:00', '18:30:00'), -- Iluminacion E2
(1043, 2, 1, '12:00:00', '18:30:00'), -- Escenografia E2
(1039, 2, 1, '12:00:00', '18:30:00'), -- Operador E2
(1035, 2, 1, '12:00:00', '18:30:00'), -- Tecnico E2

-- Escenario 3
(1036, 3, 1, '12:00:00', '18:30:00'), -- Sonido E3
(1032, 3, 1, '12:00:00', '18:30:00'), -- Iluminacion E3
(1028, 3, 1, '12:00:00', '18:30:00'), -- Escenografia E3
(1044, 3, 1, '12:00:00', '18:30:00'), -- Operador E3
(1040, 3, 1, '12:00:00', '18:30:00'), -- Tecnico E3

-- Escenario 4
(1041, 4, 1, '12:00:00', '18:30:00'), -- Sonido E4
(1037, 4, 1, '12:00:00', '18:30:00'), -- Iluminacion E4
(1033, 4, 1, '12:00:00', '18:30:00'), -- Escenografia E4
(1029, 4, 1, '12:00:00', '18:30:00'), -- Operador E4
(1045, 4, 1, '12:00:00', '18:30:00'), -- Tecnico E4

-- TURNO NOCHE (18:30:00 - 01:00:00)
-- Escenario 1
(1046, 1, 1, '18:30:00', '01:00:00'), -- Sonido E1
(1152, 1, 1, '18:30:00', '01:00:00'), -- Iluminacion E1
(1154, 1, 1, '18:30:00', '01:00:00'), -- Escenografia E1
(1156, 1, 1, '18:30:00', '01:00:00'), -- Operador E1
(1050, 1, 1, '18:30:00', '01:00:00'), -- Tecnico E1

-- Escenario 2
(1147, 2, 1, '18:30:00', '01:00:00'), -- Sonido E2
(1047, 2, 1, '18:30:00', '01:00:00'), -- Iluminacion E2
(1155, 2, 1, '18:30:00', '01:00:00'), -- Escenografia E2
(1157, 2, 1, '18:30:00', '01:00:00'), -- Operador E2
(1159, 2, 1, '18:30:00', '01:00:00'), -- Tecnico E2

-- Escenario 3
(1148, 3, 1, '18:30:00', '01:00:00'), -- Sonido E3
(1150, 3, 1, '18:30:00', '01:00:00'), -- Iluminacion E3
(1048, 3, 1, '18:30:00', '01:00:00'), -- Escenografia E3
(1158, 3, 1, '18:30:00', '01:00:00'), -- Operador E3
(1160, 3, 1, '18:30:00', '01:00:00'), -- Tecnico E3

-- Escenario 4
(1149, 4, 1, '18:30:00', '01:00:00'), -- Sonido E4
(1151, 4, 1, '18:30:00', '01:00:00'), -- Iluminacion E4
(1153, 4, 1, '18:30:00', '01:00:00'), -- Escenografia E4
(1049, 4, 1, '18:30:00', '01:00:00'), -- Operador E4
(1161, 4, 1, '18:30:00', '01:00:00'); -- Tecnico E4


-- =============================================
--   PERSONAL_ESCENARIO - DÍA 2
-- =============================================

insert into Personal_Escenario (idPersonal, idEscenario, dia, horaInicio, horaFin) values
-- TURNO TARDE (12:00:00 - 18:30:00)
-- Escenario 1
(1027, 1, 2, '12:00:00', '18:30:00'), -- Iluminacion E1
(1033, 1, 2, '12:00:00', '18:30:00'), -- Escenografia E1
(1039, 1, 2, '12:00:00', '18:30:00'), -- Operador E1
(1041, 1, 2, '12:00:00', '18:30:00'), -- Sonido E1
(1045, 1, 2, '12:00:00', '18:30:00'), -- Tecnico E1

-- Escenario 2
(1028, 2, 2, '12:00:00', '18:30:00'), -- Escenografia E2
(1034, 2, 2, '12:00:00', '18:30:00'), -- Operador E2
(1036, 2, 2, '12:00:00', '18:30:00'), -- Sonido E2
(1042, 2, 2, '12:00:00', '18:30:00'), -- Iluminacion E2
(1040, 2, 2, '12:00:00', '18:30:00'), -- Tecnico E2

-- Escenario 3
(1029, 3, 2, '12:00:00', '18:30:00'), -- Operador E3
(1031, 3, 2, '12:00:00', '18:30:00'), -- Sonido E3
(1037, 3, 2, '12:00:00', '18:30:00'), -- Iluminacion E3
(1043, 3, 2, '12:00:00', '18:30:00'), -- Escenografia E3
(1035, 3, 2, '12:00:00', '18:30:00'), -- Tecnico E3

-- Escenario 4
(1026, 4, 2, '12:00:00', '18:30:00'), -- Sonido E4
(1030, 4, 2, '12:00:00', '18:30:00'), -- Tecnico E4
(1032, 4, 2, '12:00:00', '18:30:00'), -- Iluminacion E4
(1038, 4, 2, '12:00:00', '18:30:00'), -- Escenografia E4
(1044, 4, 2, '12:00:00', '18:30:00'), -- Operador E4

-- TURNO NOCHE (18:30:00 - 01:00:00)
-- Escenario 1
(1047, 1, 2, '18:30:00', '01:00:00'), -- Iluminacion E1
(1153, 1, 2, '18:30:00', '01:00:00'), -- Escenografia E1
(1157, 1, 2, '18:30:00', '01:00:00'), -- Operador E1
(1149, 1, 2, '18:30:00', '01:00:00'), -- Sonido E1
(1161, 1, 2, '18:30:00', '01:00:00'), -- Tecnico E1

-- Escenario 2
(1048, 2, 2, '18:30:00', '01:00:00'), -- Escenografia E2
(1156, 2, 2, '18:30:00', '01:00:00'), -- Operador E2
(1148, 2, 2, '18:30:00', '01:00:00'), -- Sonido E2
(1152, 2, 2, '18:30:00', '01:00:00'), -- Iluminacion E2
(1160, 2, 2, '18:30:00', '01:00:00'), -- Tecnico E2

-- Escenario 3
(1049, 3, 2, '18:30:00', '01:00:00'), -- Operador E3
(1147, 3, 2, '18:30:00', '01:00:00'), -- Sonido E3
(1151, 3, 2, '18:30:00', '01:00:00'), -- Iluminacion E3
(1155, 3, 2, '18:30:00', '01:00:00'), -- Escenografia E3
(1159, 3, 2, '18:30:00', '01:00:00'), -- Tecnico E3

-- Escenario 4
(1046, 4, 2, '18:30:00', '01:00:00'), -- Sonido E4
(1150, 4, 2, '18:30:00', '01:00:00'), -- Iluminacion E4
(1154, 4, 2, '18:30:00', '01:00:00'), -- Escenografia E4
(1158, 4, 2, '18:30:00', '01:00:00'), -- Operador E4
(1050, 4, 2, '18:30:00', '01:00:00'); -- Tecnico E4


-- =============================================
--   PERSONAL_ESCENARIO - DÍA 3
-- =============================================
insert into Personal_Escenario (idPersonal, idEscenario, dia, horaInicio, horaFin) values
-- TURNO TARDE (12:00:00 - 18:30:00)
-- Escenario 1
(1036, 1, 3, '12:00:00', '18:30:00'), -- Sonido E1
(1042, 1, 3, '12:00:00', '18:30:00'), -- Iluminacion E1
(1028, 1, 3, '12:00:00', '18:30:00'), -- Escenografia E1
(1034, 1, 3, '12:00:00', '18:30:00'), -- Operador E1
(1040, 1, 3, '12:00:00', '18:30:00'), -- Tecnico E1

-- Escenario 2
(1031, 2, 3, '12:00:00', '18:30:00'), -- Sonido E2
(1037, 2, 3, '12:00:00', '18:30:00'), -- Iluminacion E2
(1043, 2, 3, '12:00:00', '18:30:00'), -- Escenografia E2
(1029, 2, 3, '12:00:00', '18:30:00'), -- Operador E2
(1035, 2, 3, '12:00:00', '18:30:00'), -- Tecnico E2

-- Escenario 3
(1026, 3, 3, '12:00:00', '18:30:00'), -- Sonido E3
(1032, 3, 3, '12:00:00', '18:30:00'), -- Iluminacion E3
(1038, 3, 3, '12:00:00', '18:30:00'), -- Escenografia E3
(1044, 3, 3, '12:00:00', '18:30:00'), -- Operador E3
(1030, 3, 3, '12:00:00', '18:30:00'), -- Tecnico E3

-- Escenario 4
(1041, 4, 3, '12:00:00', '18:30:00'), -- Sonido E4
(1027, 4, 3, '12:00:00', '18:30:00'), -- Iluminacion E4
(1033, 4, 3, '12:00:00', '18:30:00'), -- Escenografia E4
(1039, 4, 3, '12:00:00', '18:30:00'), -- Operador E4
(1045, 4, 3, '12:00:00', '18:30:00'), -- Tecnico E4

-- TURNO NOCHE (18:30:00 - 01:00:00)
-- Escenario 1
(1149, 1, 3, '18:30:00', '01:00:00'), -- Sonido E1
(1151, 1, 3, '18:30:00', '01:00:00'), -- Iluminacion E1
(1048, 1, 3, '18:30:00', '01:00:00'), -- Escenografia E1
(1156, 1, 3, '18:30:00', '01:00:00'), -- Operador E1
(1161, 1, 3, '18:30:00', '01:00:00'), -- Tecnico E1

-- Escenario 2
(1148, 2, 3, '18:30:00', '01:00:00'), -- Sonido E2
(1152, 2, 3, '18:30:00', '01:00:00'), -- Iluminacion E2
(1154, 2, 3, '18:30:00', '01:00:00'), -- Escenografia E2
(1049, 2, 3, '18:30:00', '01:00:00'), -- Operador E2
(1160, 2, 3, '18:30:00', '01:00:00'), -- Tecnico E2

-- Escenario 3
(1046, 3, 3, '18:30:00', '01:00:00'), -- Sonido E3
(1150, 3, 3, '18:30:00', '01:00:00'), -- Iluminacion E3
(1155, 3, 3, '18:30:00', '01:00:00'), -- Escenografia E3
(1157, 3, 3, '18:30:00', '01:00:00'), -- Operador E3
(1050, 3, 3, '18:30:00', '01:00:00'), -- Tecnico E3

-- Escenario 4
(1147, 4, 3, '18:30:00', '01:00:00'), -- Sonido E4
(1037, 4, 3, '18:30:00', '01:00:00'), -- Iluminacion E4
(1153, 4, 3, '18:30:00', '01:00:00'), -- Escenografia E4
(1158, 4, 3, '18:30:00', '01:00:00'), -- Operador E4
(1159, 4, 3, '18:30:00', '01:00:00'); -- Tecnico E4

-- =============================================
--   FAVORITOS
-- =============================================

insert into Favoritos (dniCliente, idSetlist) values
(1001, 1), -- Día 1, Taichu
(1001, 2), -- Día 1, Lara91k
(1001, 3), -- Día 1, Tobi
(1001, 4), -- Día 1, Lucho SSJ
(1002, 5), -- Día 1, Ca7riel & Paco Amoroso
(1002, 6), -- Día 1, Saramalacara
(1002, 7), -- Día 1, Bhavi
(1002, 8), -- Día 1, Eladio Carrión
(1003, 9), -- Día 1, YSY A
(1003, 10), -- Día 1, Travis Scott
(1003, 51), -- Día 1, Bizarrap

(1004, 11), -- Día 2, Seven Kayne
(1004, 12), -- Día 2, El Doctor
(1004, 13), -- Día 2, Rei
(1004, 14), -- Día 2, KHEA
(1005, 15), -- Día 2, Lit Killah
(1005, 16), -- Día 2, Cazzu
(1005, 17), -- Día 2, Tiago PZK
(1005, 18), -- Día 2, Myke Towers
(1006, 19), -- Día 2, Kendrick Lamar
(1006, 20), -- Día 2, DUKI
(1006, 52), -- Día 2, Bizarrap
(1006, 53), -- Día 2, DUKI

(1007, 21), -- Día 3, Muerejoven
(1007, 22), -- Día 3, La Joaqui
(1007, 23), -- Día 3, Neo Pistea
(1007, 24), -- Día 3, María Becerra
(1008, 25), -- Día 3, Nicki Nicole
(1008, 26), -- Día 3, Milo J
(1008, 27), -- Día 3, C.R.O
(1008, 28), -- Día 3, Drake
(1009, 29), -- Día 3, Trueno
(1009, 30), -- Día 3, Bizarrap
(1009, 54), -- Día 3, Trueno
(1009, 55), -- Día 3, Duki

(1010, 31), -- Día 1, Conociendo Rusia
(1010, 32), -- Día 1, El Mató a un Policía Motorizado
(1010, 33), -- Día 1, La Vela Puerca
(1010, 34), -- Día 1, Babasónicos
(1011, 35), -- Día 1, Airbag
(1011, 36), -- Día 1, Ratones Paranoicos
(1011, 37), -- Día 1, Ciro y Los Persas
(1011, 38), -- Día 1, The Strokes
(1012, 39), -- Día 1, Foo Fighters
(1012, 40), -- Día 2, Los Tipitos
(1012, 56), -- Día 2, Airbag

(1013, 41), -- Día 2, Usted Señalemelo
(1013, 42), -- Día 2, Turf
(1013, 43), -- Día 2, Eruca Sativa
(1013, 44), -- Día 2, No Te Va Gustar
(1014, 45), -- Día 2, Los Auténticos Decadentes
(1014, 46), -- Día 2, Fito Páez
(1014, 47), -- Día 2, Arctic Monkeys
(1014, 48), -- Día 2, Red Hot Chili Peppers
(1015, 49), -- Día 3, Las Ligas Menores
(1015, 50), -- Día 3, Santiago Motorizado
(1015, 57), -- Día 3, Coldplay
(1015, 58), -- Día 3, Airbag
(1015, 59), -- Día 3, Coldplay

(1016, 60), -- Día 3, Travis Scott
(1016, 61); -- Día 3, Travis Scott

-- =============================================
--   MERCH
-- =============================================

insert into Merch (nombre, precio, stock, idArtista) values
('Remera oficial Taichu', 9000, 60, 1051),
('Gorra Lara91k', 7500, 45, 1052),
('Poster Tobi autografiado', 5000, 40, 1053),
('Buzo Lucho SSJ edición limitada', 15000, 25, 1054),
('Campera Ca7riel y Paco Amoroso', 18500, 20, 1055),
('Pulsera Sara Mala Cara', 2500, 100, 1056),
('Vinilo Bhavi “Traplife”', 14000, 30, 1057),
('Remera Eladio Carrión Tour', 10000, 50, 1058),
('Gorra YSY A “Modo Diablo”', 8500, 60, 1059),
('Poster Travis Scott UTOPIA', 7000, 35, 1060),
('CD Seven Kayne Deluxe', 6500, 35, 1061),
('Remera El Doctor', 8000, 40, 1062),
('Poster Rei edición firmada', 5500, 45, 1063),
('Buzo KHEA “Serotonina”', 15000, 30, 1064),
('Gorra Lit Killah “MAWZ”', 9000, 50, 1065),
('Remera Cazzu “Nena Trampa”', 9500, 40, 1066),
('Pulsera Tiago PZK', 2000, 120, 1067),
('Vinilo Myke Towers “Easy Money”', 17000, 25, 1068),
('Poster Kendrick Lamar “DAMN.”', 9000, 30, 1069),
('Remera Duki “Desde el Fin del Mundo”', 11000, 55, 1070),
('Gorra Muerejoven', 7500, 40, 1071),
('Poster La Joaqui “Barbie Copia”', 5500, 35, 1072),
('Remera Neo Pistea “Punkdemia”', 8500, 45, 1073),
('Vinilo María Becerra “La Nena”', 15000, 25, 1074),
('Remera Nicki Nicole “Alma”', 10000, 50, 1075),
('Pulsera Milo J edición especial', 3000, 100, 1076),
('Gorra C.R.O', 8000, 40, 1077),
('Vinilo Drake “Views”', 18000, 25, 1078),
('Buzo Trueno “Atrevido”', 13000, 30, 1079),
('Remera Bizarrap Sessions', 12000, 50, 1080);

-- =============================================
--   TARJETA
-- =============================================

insert into Tarjeta (numero, vencimiento, titular, cvv) values
('4539-5820-1294-5820', '2027-08-31', 'Juan Pérez', '317'),
('5502-7841-9320-1146', '2026-11-30', 'María Gómez', '842'),
('3714-592031-65892', '2028-03-31', 'Lucas Fernández', '195'),
('6011-4572-9843-2290', '2029-01-31', 'Sofía Martínez', '506'),
('4539-6210-7853-1190', '2027-12-31', 'Valentín López', '268'),
('5502-8964-3021-4458', '2028-09-30', 'Martina Rivas', '631'),
('3714-495820-77654',   '2026-05-31', 'Agustín Torres', '403'),
('6011-7741-5523-9901', '2029-10-31', 'Camila Duarte', '972'),
('4539-2780-9931-4451', '2028-07-31', 'Tomás Acuña', '684'),
('5502-8941-1209-3385','2027-04-30', 'Lucía Cabrera', '125');

-- =============================================
--   COMPRA
-- =============================================

insert into Compra (fecha, cantCuotas, dniCliente, idTarjeta) values
('2025-02-01', 1, 1001, 1),
('2025-02-01', 3, 1002, 2),
('2025-02-02', 2, 1003, 3),
('2025-02-02', 1, 1004, 1),
('2025-02-03', 4, 1005, 4),
('2025-02-03', 1, 1006, 2),
('2025-02-01', 2, 1007, 1),
('2025-02-02', 6, 1008, 3),
('2025-02-03', 1, 1009, 2),
('2025-02-01', 3, 1010, 4),
('2025-02-01', 1, 1011, 1),
('2025-02-02', 2, 1012, 3),
('2025-02-02', 1, 1013, 2),
('2025-02-03', 4, 1014, 1),
('2025-02-03', 1, 1015, 3);

-- =============================================
--   COMPRA_MERCH
-- =============================================

insert into Compra_Merch (idCompra, idMerch, cantidad, diaRetiro) values
(1, 1, 2, 1),
(1, 3, 1, 1),
(2, 2, 1, 1),
(2, 8, 2, 1),
(3, 4, 1, 2),
(3, 6, 3, 2),
(4, 5, 2, 2),
(4, 7, 1, 2),
(5, 9, 2, 3),
(5, 10, 1, 3),
(6, 11, 1, 3),
(6, 12, 1, 3),
(7, 13, 2, 1),
(7, 14, 1, 1),
(1, 15, 3, 2),
(1, 16, 1, 2),
(2, 17, 2, 3),
(2, 18, 1, 3),
(3, 19, 1, 1),
(3, 20, 2, 1),
(4, 21, 1, 2),
(4, 22, 1, 2),
(5, 23, 2, 3),
(5, 24, 1, 3),
(6, 25, 2, 1),
(6, 26, 1, 1),
(7, 27, 1, 2),
(7, 28, 2, 2),
(1, 29, 2, 3),
(1, 30, 1, 3);

-- =============================================
--   TICKET
-- =============================================

insert into Ticket (idDia) values (1);
insert into Ticket (idDia) values (2);
insert into Ticket (idDia) values (3);
insert into Ticket (idDia) values (1);
insert into Ticket (idDia) values (2);
insert into Ticket (idDia) values (3);