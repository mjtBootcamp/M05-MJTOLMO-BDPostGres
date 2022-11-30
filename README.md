<br />
<div align="center">
  <h3 align="center">Modelamiento y normalización de BD en Postgres</h3>
  <p align="center">
    MODULO 05
    <hr/>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Tabla de contenido</summary>
  <ol>
    <li>
      <a href="#about-the-project">Sobre el proyecto</a>
      <ul>
        <li><a href="#built-with">Construido con</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Para comenzar</a>
      <ul>
        <li><a href="#prerequisites">prerrequisitos</a></li>
        <li><a href="#installation">Instalación</a></li>
      </ul>
    </li>
    <li><a href="#license">Licencia</a></li>
    <li><a href="#contact">Contacto</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## Sobre el proyecto

Poroyecto requerido en BootCamp JS FullStack. Desarrollado Off Line

Requerimientos:
 Se requiere modelar una base de datos para una biblioteca, de acuerdo a las reglas de negocio que ha definido el cliente. Debes prestar especial atención en la relación entre las entidades paracrearelmodeloconceptual,físicoylógicoeimplementarlabasededatosde acuerdo a dicho modelamiento. 
 En detalle, se requiere modelar lo siguiente:
 En la biblioteca se guardan los siguientes datos para cada préstamo que se realiza: los datos dellibro(ISBN,título,númerodepáginas,códigodelautor,nombreyapellidodelautor, fecha de nacimiento y muerte del autor, tipo de autor (principal, coautor)), datos del préstamo (fecha de inicio y fechadedevolución)ylosdatosdelsocio(rut,nombre,apellido, dirección y teléfono)
Además, se deben considerar las siguientes restricciones:
- Se registra una única dirección y teléfono para cada socio.
- El ISBN (International Standard Book Number), es un número de 13 cifras que identifica de una manera única a cada libro o producto de editorial publicado.
- Para este ejercicio, asumirá que la biblioteca posee un ejemplar de cada libro.
- El número único del autor es un correlativo interno que maneja la biblioteca para identificarlos y facilitar la búsqueda.
- Un libro tiene al menos un autor principal, puede tener además registrado un coautor.
- Un socio sólo puede pedir un libro a la vez.

## Requerimientos
#### Parte 1 - Creación del modelo conceptual, lógico y físico
1. Realizar el modelo conceptual, considerando las entidades y relaciones entre ellas. (1 Punto)
2. Realizar el modelo lógico, considerando todas las entidades y las relaciones entre ellas, los atributos, normalización y creación de tablasintermediasdesernecesario. (2 Puntos)
3. Realizar el modelo físico, considerando la especificación de tablas y columnas, además de las claves externas.(2 Puntos)
#### Parte 2 - Creando el modelo en la base de datos
1. Crear el modelo en una base de datos llamada biblioteca, considerando las tablas definidas y sus atributos. (2 puntos).
2. Se deben insertar los registros en las tablas correspondientes(1 punto).
3. Realizar las siguientes consultas:
a. Mostrar todos los libros que posean menos de 300 páginas.(0.5 puntos)
b. Mostrar todos los autores que hayan nacido después del 01-01-1970.
(0.5 puntos)
c. ¿Cuál es el libro más solicitado?(0.5 puntos).
d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días. (0.5 puntos)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Construido con

- Postgress
- DrawIo

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Para comenzar


### Prerequisites

Es necesario tener el motor de base de datos postgres instalado

### Instalación

1. En terminal
   ```sh
   git clone https://github.com/mjtBootcamp/M04-ProyectoCovid__1_.git
   ```
2. Ejecutar comandos
   ```sh
   sudo su postgres
   [contraseña]
   ```
3. Ejecutar comandos en BIBLIOTECA.sql

4. Instalar VSCode y la extensión Draw.io Integration 

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->

## Roadmap

- [x] Normalización
- [x] Modelamientos
- [x] Revisión
- [x] Entrega

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## Licencia

Distributed under the MIT License.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

<h3> María José Tolmo </h3>

[linkedin.com/in/mariajosetolmo](https://www.linkedin.com/in/mariajosetolmo)
mariajosetolmo@gmail.com
[github.com/mariajosetolmo](https://github.com/mariajosetolmo)

<hr>
<p align="right">(<a href="#readme-top">back to top</a>)</p>
