# Laboratorio Sesión 04: Ensamblador: subrutinas y estructuras

### Objetivo

El objetivo de esta sesión es introducir la programación en ensamblador de subrutinas y estructuras en la arquitectura x86 bajo Linux. En concreto, se trabajarán aspectos como la programación de llamadas a subrutinas, la codificación de subrutinas completas y el accesos a estructuras de datos. Además se repasan conceptos como la programación de estructuras de control y el acceso a vectores y/o matrices. 

### Conocimientos Previos

Para realizar esta práctica deberíais repasar las traducciones directas de C a ensamblador del x86 de la codificación de subrutinas. Además deberías respasar la forma en que se almacenan y acceden las estructuras.

#### Los “Makefile”

Entre los ficheros de esta práctica encontraréis un elemento nuevo: un fichero llamado `Makefile`. Este fichero auxiliar sirve para compilar códigos cuando hay muchos ficheros de entrada distintos sin tener que teclear todos los nombres cada vez. Para utilizarlo basta con que tecleéis make y él mismo generará el resultado. Si abrís el fichero con un editor de textos veréis que su sintáxis es muy sencilla. En esta práctica podéis ejecutar el make con tres parámetros diferentes (uno por apartado): `test0`, `test1` y `test2`.

### Trabajo a realizar durante la Práctica:

1. Compilad (`make test0`) y probad la aplicación original escrita en C. Anotad algunos resultados originales para poder comprobar que vuestros códigos funcionan bien. 

2. Traducid a ensamblador del x86 la rutina `Intercambiar`. Utilizad como base el fichero `Intercambia.s` y comprobad el resultado con ayuda de los ficheros Main.c y Ordenar.c (podéis usar make test1 para compilar). Entregad en el Racó de la asignatura el fichero `Intercambia.s`.

3. Traducid a ensamblador del x86 la rutina Ordenar. Utilizad como base el fichero `Ordena.s`. Probadla con el fichero `Main.c` y con la rutina en ensamblador del apartado anterior (`make test2`). Entregad en el Racó de la asignatura el fichero `Ordena.s`
