# Laboratorio Sesión 06: Políticas de escritura

### Objetivo

El objetivo de esta sesión es asentar los conocimientos sobre las diferentes políticas de escritura de las memorias cache. Para hacerlo programaréis un simulador de cache básico que simule lecturas y escrituras.

### Características de la memoria cache

En esta sesión programaremos una memoria cache con las siguientes caractarísticas:

* Las direcciones son de 32 bits (para simplificar asumiremos que todos los accesos son a bytes)
* La cache será de mapeo directo
* Tamaño de la cache: 4 Kbytes
* Tamaño de la línea de cache: 32 bytes
* Política de escritura: Write Through
* Política de emplazamiento: Write NO Allocate

### Toma de contacto con el entorno simulador

El simulador se compone de 3 ficheros: ```CacheSimWT.o```, ```CacheSim.h``` y ```MiSimulador.c``` El programa principal y algunos componentes del simulador ya están programados y se encuentran en el fichero ```CacheSimWT.o```. Este fichero se encarga de generar las secuencias de test, de imprimir los resultados de la simulación por pantalla con un formato agradable y de comprobar el correcto funcionamiento de vuestro simulador. Antes de que empecéis a programar el simulador, es interesante hacer algunas pruebas con este entorno. Para comenzar, compilad el simulador (```MiSimulador.c``` no funciona correctamente, pero compila).

```$> gcc -m32 CacheSimWT.o MiSimulador.c tiempo.c -o sim```

El programa tiene 3 tests:

* Test 0: Genera la secuencia de 20 referencias de la tabla del trabajo previo
* Test 1: Genera accesos secuenciales a un vector de enteros (1000 referencias)
* Test 2: Genera los accesos de un producto de matrices de 25x25 (62500 referencias)

Para pasar cualquiera de los tests, sólo es necesario poner el no de test como parámetre del simulador. Por ejemplo, para pasar el test 0 escribiríamos:

```
$> sim 0
Test 0 FAIL :-(
$>
```

Evidentemente el test ha fallado, ya que aún no hemos programado el simulador. En caso de que el simulador falle, nos interesará ver que está pasando. Para ello podemos utilizar la opción ```v``` (de verbose) en el simulador (la ```v``` debe aparecer como primer parámetro):

```
$> sim v 0
eca130 L -> l MP:4212dfa0 l MC:bfffe7a0 TAG:804a000 byte:40007dcf MISS L:134513233 E:1073774031 -> fd0
eca131 E -> l MP:4212dfa0 l MC:bfffe7a0 TAG:804a000 byte:40007dcf MISS L:134513233 E:1073774031 -> fd0
ec2172 E -> l MP:4212dfa0 l MC:bfffe7a0 TAG:804a000 byte:40007dcf MISS L:134513233 E:1073774031 -> fd0
...
Test 0 FAIL :-(
```

Esta opción nos dará una salida parecida a la anterior. Como podéis ver las columnas corresponden básicamente a la tabla del ejercicio previo. De esta forma, comparando la salida y la tabla podemos ver dónde está el problema. Dado que en los tests 1 y 2 el número de referencias es muy alto, os recomendamos que no los probéis hasta que os funcione perfectamente el test 0. Con la opción v, los tests 1 y 2 se paran tan pronto aparece el primer error para ayudar a su identificación.

### Programación del módulo MiSimulador.c

Para programar vuestro simulador de cache tenéis que programar 3 secciones del fichero ```MiSimulador.c```:

1. **Estructuras globales** En esta sección tenéis que declarar las estructuras de datos globales necesarias para mantener el estado de la cache. Es necesario que sean globales, ya que la parte principal del simulador es la rutina reference que se ejecuta una vez por referencia y, como ya sabéis, su estado desaparece una vez se ejecuta.

2. **Inicialización de la cache** La rutina init_cache se llama antes de pasar cada test para inicializar las estructuras de datos globales necesarias. El objetivo es dejar la cache en un estado inicial correcto (cache vacía). 

3. **Simulación de referencias** La simulación de las referéncias tenéis que hacerla en la rutina ```reference```. Esta rutina se llama una vez por cada referencia a simular. Solo es necesario que generéis el valor correcto de las 11 variables locales que ya tenéis declaradas al inicio de la subrutina y que se corresponden básicamente a las columnas de la tabla del trabajo previo (excepto el booleano ```replacement```, que no era necesario en el trabajo previo).

``` c

void reference (unsigned int address, unsigned int LE) {
    unsigned int byte;
    unsigned int bloque_m;
    unsigned int linea_mc;
    unsigned int tag;
    unsigned int miss; // booleano que indica si es miss
    unsigned int lec_mp; // booleano que indica si se lee de MP
    unsigned int mida_lec_mp;
    unsigned int esc_mp; // booleano que indica si se escribe en MP
    unsigned int mida_esc_mp;
    unsigned int replacement; // booleano que indica si se reemplaza
    // una l´ınea v´alida
    unsigned int tag_out; // TAG de la línea reemplazada

```

En otras palabras, lo que tenéis que hacer es implementar el algoritmo que, de forma intuitiva, habéis hecho servir manualmente para rellenar la tabla del estudio previo. Después de vuestro código, la rutina acaba con una llamada a la rutina ```test_and_print``` para comprobar si los valores de las variables son correctos e imprimirlos por pantalla en caso de tener la opción ```v``` activada.

4. **Impresión de resultados** Si tenéis que imprimir algún resultado final, la rutina final se ejecuta una vez al finalizar el programa.
