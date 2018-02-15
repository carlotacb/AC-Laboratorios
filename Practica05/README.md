# Laboratorio Sesión 05: Repaso de memoria cache

### Objetivo

El objetivo de esta sesión es recordar conceptos de memoria cache vistos en EC. Para hacerlo programaréis un simulador de cache básico que simule dos caches de lectura.

### Conocimientos Previos

En esta sesión programaremos una memoria cache con las siguientes caractarísticas:

* Las direcciones son de 32 bits (para simplificar asumiremos que todos los accesos son a bytes)
* La cache es de sólo lectura (asumiremos que todos los accesos son lecturas)
* La cache será de mapeo directo o 2 asociativa con reemplazo LRU
* Tamaño de la cache: 4 Kbytes
* Tamaño de la línea de cache: 32 bytes

### Toma de contacto con el entorno simulador

El simulador se compone de 3 ficheros: ```CacheSim.o```, ```CacheSim.h``` y ```MiSimulador.c``` El programa principal y algunos componentes del simulador ya están programados y se encuentran en el fichero ```CacheSim.o```. Este fichero se encarga de generar las secuencias de test, de imprimir los resultados de la simulación por pantalla con un formato agradable y de comprobar el correcto funcionamiento de vuestro simulador. Antes de que empecéis a programar el simulador, es interesante hacer algunas pruebas con este entorno. Para comenzar, compilad el simulador (```MiSimulador.c``` no funciona correctamente, pero compila).

```$> gcc -m32 CacheSim.o MiSimulador.c tiempo.c -o sim```
    
El programa tiene 3 tests:

* Test 0: Genera la secuencia de 20 referencias de la tabla del trabajo previo
* Test 1: Genera accesos secuenciales a un vector de enteros (1000 referencias)
* Test 2: Genera los accesos de un producto de matrices de 25x25 (62500 referencias)

Para pasar cualquiera de los tests, sólo es necesario poner el no de test como parámetro del simulador. Por ejemplo, para pasar el test 0 escribiríamos:

```
$> sim 0
Test 0 FAIL :-(
$>
```

Evidentemente el test ha fallado, ya que aun no hemos programado el simulador. En caso de que el simulador falle, nos interesará ver qué está pasando. Para ello podemos utilizar la opción ```v``` (de verbose) en el simulador (la v debe aparecer como primer parámetro):

```
$> sim v
eca130 -> l MP:400136d0 l MC:bffff3e0 TAG:78e530f byte:804822c MISS -> 804816c
eca131 -> l MP:400136d0 l MC:bffff3e0 TAG:78e530f byte:804822c MISS -> 804816c
ec2172 -> l MP:400136d0 l MC:bffff3e0 TAG:78e530f byte:804822c MISS -> 804816c
...
Test 0 FAIL :-(
```

Esta opción nos dará una salida parecida a la anterior. Como podéis ver las columnas corresponden básicamente a la tabla del ejercicio previo. De esta forma, comparando la salida y la tabla podemos ver dónde está el problema. Dado que en los tests 1 y 2 el número de referencias es muy alto, os recomendamos que no los probéis hasta que os funcione perfectamente el test 0. Con la opción v, los tests 1 y 2 se paran tan pronto aparece el primer error para ayudar a su identificación.

### Programación del módulo MiSimulador.c

Para programar vuestro simulador de cache tenéis que programar 3 secciones del fichero ```MiSimulador.c```:

1. **Estructuras globales** En esta sección tenéis que declarar las estructuras de datos globales necesarias para mantener el estado de la cache. Es necesario que sean globales, ya que la parte principal del simulador es la rutina reference que se ejecuta una vez por referencia y, como ya sabéis, su estado desaparece una vez se ejecuta.

