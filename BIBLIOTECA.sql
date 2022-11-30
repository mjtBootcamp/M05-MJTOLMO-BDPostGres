-- 1. Crear el modelo en una base de datos llamada biblioteca, considerando las tablas definidas y sus atributos. (2 puntos).
CREATE DATABASE biblioteca;

CREATE TABLE socio(
    id_socio SERIAL PRIMARY KEY,
    rut INT,
    rut_verificador INT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    direccion VARCHAR(255),
    region VARCHAR(60),
    comuna VARCHAR(30),
    ciudad VARCHAR(30)
);

CREATE TABLE telefono(
    id_telefono SERIAL PRIMARY KEY,
    numero INT,
    usuario_id INT REFERENCES socio(id_socio)
);

CREATE TABLE libro(
    id_libro SERIAL PRIMARY KEY,
    ISBN VARCHAR(13),
    titulo VARCHAR(200),
    paginas INT
);

CREATE TABLE prestamo(
    id_prestamo SERIAL PRIMARY KEY,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    socio_id INT REFERENCES socio(id_socio),
    libro_id INT REFERENCES libro(id_libro)
);

CREATE TABLE autor(
    id_autor SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    nacimiento INT,
    muerte INT
);

CREATE TABLE autoria(
    id_auditoria SERIAL PRIMARY KEY,
    autor BOOLEAN,
    coautor BOOLEAN,
    autor_id INT REFERENCES autor(id_autor),
    libro_id INT REFERENCES libro(id_libro)
);

-- 2. Se deben insertar los registros en las tablas correspondientes (1 punto).
INSERT INTO
    socio(
        rut,
        rut_verificador,
        nombre,
        apellido,
        direccion,
        region,
        comuna,
        ciudad
    )
VALUES
    (
        1111111,
        1,
        'JUAN',
        'SOTO',
        'AVENIDA 1',
        'METROPOLITANA',
        'SANTIAGO',
        'SANTIAGO'
    ),
    (
        2222222,
        2,
        'ANA',
        'PÉREZ',
        'PASAJE 2',
        'METROPOLITANA',
        'SANTIAGO',
        'SANTIAGO'
    ),
    (
        3333333,
        3,
        'SANDRA',
        'AGUILAR',
        'AVENIDA 2',
        'METROPOLITANA',
        'SANTIAGO',
        'SANTIAGO'
    ),
    (
        4444444,
        4,
        'ESTEBAN',
        'JEREZ',
        'AVENIDA 3',
        'METROPOLITANA',
        'SANTIAGO',
        'SANTIAGO'
    ),
    (
        5555555,
        5,
        'SILVANA',
        'MUÑOZ',
        'PASAJE 3',
        'METROPOLITANA',
        'SANTIAGO',
        'SANTIAGO'
    );

INSERT INTO
    telefono(numero, usuario_id)
VALUES
    (911111111, 1),
    (922222222, 2),
    (933333333, 3),
    (944444444, 4),
    (955555555, 5);

INSERT INTO
    libro(ISBN, titulo, paginas)
VALUES
    (
        1111111111111,
        'CUENTOSDE TERROR',
        344
    ),
    (
        2222222222222,
        'POESÍAS CONTEMPORANEAS',
        167
    ),
    (
        3333333333333,
        'HISTORIADE ASIA',
        511
    ),
    (
        4444444444444,
        'MANUAL DE MECÁNICA',
        298
    );

INSERT INTO
    prestamo(
        socio_id,
        libro_id,
        fecha_prestamo,
        fecha_devolucion
    )
VALUES
    (1, 1, '20-01-2020' :: date, '27-01-2020' :: date),
    (3, 3, '22-01-2020' :: date, '30-01-2020' :: date),
    (4, 4, '23-01-2020' :: date, '30-01-2020' :: date),
    (2, 1, '27-01-2020' :: date, '04-02-2020' :: date),
    (1, 4, '31-01-2020' :: date, '12-02-2020' :: date),
    (5, 2, '20-01-2020' :: date, '30-01-2020' :: date),
    (3, 2, '31-01-2020' :: date, '12-02-2020' :: date);

--
INSERT INTO
    autor(
        nombre,
        apellido,
        nacimiento,
        muerte
    )
VALUES
    ('ANDRÉS', 'ULLOA', 1982, NULL),
    ('SERGIO', 'MARDONES', 1950, 2012),
    ('JOSE', 'SALGADO', 1968, 2020),
    ('ANA', 'SALGADO', 1972, NULL),
    ('MARTIN', 'PORTA', 1976, NULL);

INSERT INTO
    autoria(autor_id, libro_id, autor, coautor)
VALUES
    (1, 2, true, false),
    (2, 3, true, false),
    (3, 1, true, false),
    (4, 1, false, true),
    (5, 4, true, false);

-- 3. Realizar las siguientes consultas:
-- a. Mostrar todos los libros que posean menos de 300 páginas. (0.5 puntos)
SELECT
    *
FROM
    libro
WHERE
    libro.paginas > 300;

-- 3. Realizar las siguientes consultas:
-- b. Mostrar todos los autores que hayan nacido después del 01-01-1970. (0.5 puntos)
SELECT
    *
FROM
    autor
WHERE
    autor.nacimiento >= 1970;

-- 3. Realizar las siguientes consultas:
-- c. ¿Cuál es el libro más solicitado? (0.5 puntos).
SELECT
    libro.titulo
FROM
    libro
WHERE
    libro.id_libro IN (
        SELECT
            prestamo.libro_id
        FROM
            prestamo
        GROUP BY
            prestamo.libro_id
        ORDER BY
            prestamo.libro_id DESC
    )
LIMIT
    1;

-- 3. Realizar las siguientes consultas:
-- d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días. (0.5 puntos)
SELECT
    socio.rut,
    socio.rut_verificador AS v,
    socio.nombre,
    socio.apellido,
    (
        extract(
            day
            from
                age(
                    date(prestamo.fecha_devolucion),
                    date(prestamo.fecha_prestamo)
                )
        ) -7
    ) * 100 as multa
from
    socio full
    outer join prestamo on socio.id_socio = prestamo.socio_id
where
    (
        extract(
            day
            from
                age(
                    date(prestamo.fecha_devolucion),
                    date(prestamo.fecha_prestamo)
                )
        ) -7
    ) * 100 > 0
order by
    socio.id_socio desc;