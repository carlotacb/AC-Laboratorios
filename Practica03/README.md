# Laboratorio Sesión 03: Introducción al ensamblador de la arquitectura x86: Estructuras de control y matrices

### Objetivo

El objetivo de esta sesión es introducir la programación en ensamblador para la arquitectura x86. En concreto se trabajarán aspectos como la programación de estructuras de control (condicionales e iterativas) y el acceso a elementos estructurados (vectores y matrices).

### Conocimientos Previos

Para realizar esta práctica deberíais repasar las traducciones directas de C a ensamblador del x86 de las estructuras de control que habéis visto en la clase de teoría. Además deberías respasar los modos de direccionamiento del x86.

#### Acceso a un vector en ensamblador

Para acceder a un elemento i de un vector Vector mediante un acceso aleatorio, la posici´on de memoria a la que deb´eis acceder es:

`@Vector + i * (tamaño_en_bytes_de_un_elemento)`

En cambio, si queréis hacer un acceso secuencial a un elemento `i` a partir del anterior deberéis tener en cuenta:

`@Vector[i] = @Vector[i-1] + (tamaño_en_bytes_de_un_elemento)`

#### Acceso a una matriz en ensamblador

Si lo que queréis es acceder a un elemento en la posición `fila`, `columna` de una matriz `Matriz` mediante un acceso aleatorio, la posición de memoria a la que debéis acceder es:

`@Matriz + (fila * (columnas) + columna) * (tamaño_en_bytes_de_un_elemento)`

Para realizar accesos secuenciales, dependerá de la dirección (y el sentido) del acceso. Los dos accesos secuenciales más comunes con matrices son por filas:

`@Matriz[fila][columna] = @Matriz[fila][columna-1] + (tamaño_en_bytes_de_un_elemento)`

O por columnas:

`@Matriz[fila][columna] = @Matriz[fila-1][columna] + (columnas) * (tamaño_en_bytes_de_un_elemento)`

### Trabajo a realizar durante la practica:

1. Dada una rutina que tiene el siguiente código en alto nivel:

```c
    int OperaVec(int Vector[], int elementos) {
      // La @ de Vector esta en la @ 8[ebp] y el
      // valor de la variable elementos en la @ 12[ebp]
      
      int i; // i esta en la @ -8[ebp]
      int res; // res esta en la @ -4[ebp]
      res=Vector[0];
      
      // Código que has de introducir
      
      for (i=1;i<elementos;i++) {
        if (Vector[i]>res) res = Vector[i];
        // Fin del código a introducir
      }
      return res;
    }
```
Traduce el interior de la rutina a ensamblador y ponlo dentro del código `Practica3CompletarA.s`. Ejecútalo con el programa `Practica3MainA.c` y, cuando funcione, calcula cuántos ciclos tarda, cuántas instrucciones ejecuta y cuál es el CPI resultante.

2. Dada una rutina que tiene el suguiente código en alto nivel:

```c
    #define N 3
    
    int OperaMat(int Matriz[N][N], int salto) {
      // La @ de Matriz esta en la @ 8[ebp] y el
      // valor de la variable salto en la @ 12[ebp]
      
      int j; // j esta en la @ -12[ebp]
      int i; // i esta en la @ -8[ebp]
      int res; // res esta en la @ -4[ebp]

      // Codigo que has de introducir
      res=0;
      for (i=0; i <3; i+=salto) {
        for (j=0; j <3; j+=salto) {
          res+=Matriz[i][j];
        }
      }
      // Fin del codigo a introducir
      return res;
    }
```

Traduce el interior de la rutina a ensamblador y ponlo dentro del código `Practica3CompletarB.s`. Ejecútalo con el programa `Practica3MainB.c` y, cuando funcione, calcula cuántos ciclos tarda, cuántas instrucciones ejecuta y cuál es el CPI resultante.

3. Explica qué optimizaciones de código crees que se podrían aplicar a los dos códigos realizados.

