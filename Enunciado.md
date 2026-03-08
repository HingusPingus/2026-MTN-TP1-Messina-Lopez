POLIPALOZZA

“PoliPalozza” es el sistema de gestión oficial de varios festivales de música que se realizan en distintas ciudades del país. Su objetivo es unificar en una misma plataforma la organización de los artistas, el personal de producción y la experiencia de los asistentes, asegurando que cada evento sea único y esté perfectamente coordinado.

La propuesta de PoliPalozza es transformar la manera en que se viven los festivales: no solo como un espacio para escuchar música, sino como una experiencia integral en la que los artistas, el staff y el público participan de forma activa y conectada.

El festival se desarrolla en tres jornadas, desde las 12:30 hasta las 02:00 (00:45 fin del ultimo show, pero se necesita tiempo para la limpieza), en diferentes escenarios. Cada escenario tiene su propio nombre, una capacidad máxima de público y una grilla de programación que organiza los horarios de presentación de los artistas.

En el evento conviven tres tipos de participantes:

- Artistas: de ellos se almacena el género musical, la duración del show y si son considerados artistas destacados.

- Personal de producción: cada integrante cumple un rol específico (sonido, iluminación, escenografía, operador o técnico). La organización exige que en cada escenario haya al menos cinco personas de producción con roles distintos para garantizar la calidad del evento. Tambien contara con personal de producción voluntario, estos cumpliran las mismas funciones.

- Asistentes: se registran para poder comprar su entrada y reservar merch.

La plataforma permitirá a la organización y a los usuarios registrados:

- Consultar qué artistas se presentan en cada escenario, con sus horarios de show.

- Asignar personal de producción a los escenarios, validando automáticamente que se cumplan los requisitos de roles distintos y cantidad mínima.

- Consultar información de cada escenario: nombre, capacidad, programación y staff asignado.

- Definir escenarios y programar artistas en franjas horarias disponibles.

- Acceder al perfil de cada usuario (artistas, personal de producción y asistentes), con sus datos e información relevante para el festival.

1. Con esta información se le pide al equipo:

a. Realizar un breve benchmarking analizando competencias. Analizar cómo es la marca de la competencia (que paleta de colores, tipografías y tipo de

logo), qué ofrecen en sus sitios web (estructura, funcionalidades, imágenes, recursos gráficos, etc).

a. Realizar el branding para “Polipalozza” y construir su manual de marca.

b. Realizar wireframes del sitio web en figma. Deberá realizarse para Desktop, tablet y mobile. Luego, realizar testeos con 5 usuarios de sus wireframes, sacar conclusiones y realizar un breve informe respecto a los resultados y los cambios a realizarse.

c. Realizar los mockups del sitio web en figma en las 3 pantallas. Realizar nuevamente 5 testeos, sacar conclusiones y realizar un breve informe respecto a los resultados y los cambios a realizarse.

2. Diseñar un diagrama entidad-relación físico que represente de forma adecuada el sistema de organización del festival y crear la base de datos. Realizar allí (en un .sql) los siguientes triggers, eventos y procedimientos:

a. Trigger que, al asignar una persona a una presentación/show, valide que no tenga otra asignada para el mismo horario.

b. Trigger que, al agregar una presentación a un escenario valide que no se superponga con otra. Tener en cuenta también la duración de las presentaciones.

c. Procedimiento que, dado un escenario, si no cumple con el personal mínimo, le asigne una persona. Tener en cuenta el rol.

d. Procedimiento que compile datos del último evento (cantidad de asistentes promedio por escenario, cantidad de artistas destacados, promedio de duración de las presentaciones) y los inserte en una tabla “resumen_evento”.

e. Evento que canecele las reservas de merch si el usuario no lo retira en el dia acordado.

f. Evento que, cada 20 minutos empezando en el horario del festival, envíe una notificación a los usuarios sobre los shows que comienzan en los próximos 30 minutos. Realizarlo a través de una tabla de notificaciones.

Aclaración: Deben crear los procedimientos y funciones que se crean necesarios para tener un código limpio, mantenible y reutilizable

3. Además de modelar la base de datos y sus respectivas reglas con SQL, se solicita desarrollar una API REST en Java usando Spring Boot, que permita gestionar las entidades del sistema de forma dinámica y probar su funcionamiento desde el frontend (pueden hacer las pruebas iniciales utilizando herramientas como Postman)

Se pide desarrollar las siguientes rutas de la API:


a. Registro de usuarios

§ Ruta: POST /api/usuarios


§ Función: Registrar un nuevo usuario (artista, staff o asistente), incluyendo sus datos personales y la información del login

b. Carga de escenarios, artistas y staff (solo Admin)

§ Rutas:

· POST /api/admin/escenarios

· POST /api/admin/artistas

· POST /api/admin/staff

· POST /api/admin/shows

§ Función: Permiten al administrador definir los escenarios, cargar la programación y asignar personal de producción validando que haya al menos tres roles distintos por escenario.


c. Consulta de artistas por escenario y horario

§ Ruta: GET /api/escenarios/{id}/artistas

§ Función: Devuelve la grilla del escenario con los artistas, horarios, géneros y duración de cada show.


d. Consultar perfil de usuario

§ Ruta: GET /api/usuarios/{id}

§ Función: Muestra el perfil de cualquier usuario: artista, staff o asistente, con sus datos relevantes.


e. Guardar shows favoritos

§ Ruta: POST /api/usuarios/{id}/favoritos

§ Función: Permite a los asistentes marcar shows como favoritos para armar su agenda personalizada.


f. Armar y guardar grilla personalizada del festival

§ Ruta: POST /api/usuarios/{id}/mi-grilla

§ Función: Guarda la programación personalizada del asistente en base a sus artistas favoritos.


g. Reservar merchandising y compra tickets

§ Rutas:

· POST /api/reservas/merch

§ Función: Permite a los usuarios reservar productos del evento (merchandising) que deben ser retirados dentro del dia asignado.


h. Asignar staff a un escenario (solo Admin)

§ Ruta: POST /api/admin/asignar-staff

§ Función: Asocia personal de producción a un escenario, validando que no haya superposición de horarios ni duplicidad de roles.


Aclaración: Además se deben crear todos los endpoints que sean necesarios desde el front-end para cumplir con las funcionalidades pedidas.
