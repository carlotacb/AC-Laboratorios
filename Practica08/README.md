# Laboratorio Sesión 08: Investigando la jerarquía de memoria (II)

### Objetivo

El objetivo de la sesión es observar el efecto que puede tener la jerarquía de memoria en el rendimiento de un programa.

### El precompilador de C y la compilación condicional

Antes de ejecutar el compilador de C siempre se llama al precompilador. El precompilador de C se llama cpp. El precompilador se encarga básicamente de:

* La inclusión de los ficheros de cabeceras (p.e. ``#include <stdio.h>``).
* La expansión de macros.
* La compilación condicional. Usando algunas directivas especiales es posible incluir o excluir partes del programa original en función de condiciones varias.

En los programas de la sesión de hoy se utiliza la compilaci´on condicional. En la parte incial de cada programa encontramos lo siguiente:

``` c

#ifndef N
#define N 256
#endif
/* Dimensión por defecto */

```

Estas tres sentencias indican que si la constante ``N`` no está definida, entonces toma el valor 256. La forma de darle un valor diferente a esta constante es al compilar:

```
$> gcc mm-ijk.c tiempo.c -DN=64 -o IJK64
```

La opción ``-DN=64``, es la forma de inicializar ``N`` con el valor 64. Este mecanismo es muy útil para redefinir los parámetros de un programa en tiempo de compilación, sin necesidad de editar el programa de nuevo


### ¿Influye la jerarquía de memoria en el tiempo de ejecución de los programas?

La mejor forma de comprobar la influencia de la jerarquía de memoria en el tiempo de ejecución de los programas es mediante un ejemplo. En el paquete de programas de esta sesión tenéis 3 programas: ``mm-ijk.c``, ``mm-jki.c`` y ``mm-kij.c``. Estos programas son 3 de las 6 formas ijk del producto de matrices. En el programa ``mm-ijk.c`` se eval´ua la siguiente porci´on de c´odigo (ijk denota que el bucle m´as externo es el bucle controlado por la variable i y el m´as interno el controlado por k):

``` c

t1 = GetTime();

for (i=0; i<N; i++)
	for (j=0; j<N; j++)
		for (k=0; k<N; k++)
			C[i][j] = C[i][j] + A[i][k] * B[k][j];

t2 = GetTime();
total = t2 - t1;

```

El conjunto de los tres bucles anidados realiza el producto de matrices C = A * B. Como en las prácticas anteriores, las llamadas a las rutinas ``GetTime()`` sirven para calcular el tiempo de ejecución de este código. La rutina ``GetTime()`` nos da el tiempo empleado por el programa hasta ese instante; la diferencia (``t2-t1``) nos da el tiempo de ejecución del bucle medido en milisegundos. Este es el esquema básico a utilizar para medir el tiempo de ejecución de una porción de código. En el programa ``mm-jki.c``, el código a evaluar es el siguiente:

``` c

t1 = GetTime();

for (j=0; j<N; j++)
	for (k=0; k<N; k++)
		for (i=0; i<N; i++)
			C[i][j] = C[i][j] + A[i][k] * B[k][j];

t2 = GetTime();
total = t2 - t1;

```

La única diferencia con respecto al código anterior es la ordenación de los bucles y, en consecuencia, el orden en que se accede a los elementos de las matrices (algo similar ocurre para el programa ``mm-kij.c``). Un detalle fundamental es que los tres programas realizan, de distinta forma, la misma operación: el producto de matrices. 

Para compilar y ejecutar estos programas en Linux hay que hacer lo siguiente:

```
$> gcc mm-ijk.c tiempo.c -DN=64 -o IJK64
$> ./IJK64
```

Donde ``-DN=64`` indica que el tamaño de las matrices es ``N=64`` (si no se pone nada el valor por defecto es ``N=256``); y ``IJK64`` es el nombre del fichero ejecutable.

El ejecutable se comporta de forma diferente según el tamaño de la matriz. Si la matriz tiene un tamaño ``N=6`` (o menor), la aplicación vuelca por pantalla el contenido de la matriz resultante. Esto es útil para comprobar que los tres programas tienen el mismo resultado. Para tamaños mayores la aplicación devuelve el tiempo de ejecución medido en tics de reloj.

### Una optimización adicional

Una posible optimización del producto de matrices podría ser el siguiente:

``` c

t1 = GetTime();

for (i=0; i<N; i++)
	for (j=0; j<N; j++) {
		tmp = C[i][j];
		for (k=0; k<N; k++)
			tmp = tmp + A[i][k] * B[k][j];
		C[i][j] = tmp;
	}

t2 = GetTime();
total = t2 - t1;

```

Esta optimización se puede aplicar a las tres formas anteriores (nota importante: la optimización se aplica de forma diferente en los tres códigos). Este código optimizado lo podéis encontrar en el fichero ``mm-ijk2.c``.

### Trabajo a realizar durante la Práctica

1. Compilad y ejecutad los tres programas para un tamaño N=6. Comprobad que los 3 programas dan el mismo resultado.

2. Rellenad la tabla de la hoja de respuestas indicando para cada forma del producto de matrices cuánto tiempo (segundos) tarda en ejecutarse y a cuántos MFLOPS se ejecuta. Os aconsejamos el uso de una hoja de cálculo para agilizar vuestro trabajo.

3. Teniendo en cuenta lo que habéis hecho en los apartados anteriores y en el trabajo previo, explicad la razón de las diferencias de rendimiento en estos tres programas. 

4. Aplicad la optimización adicional a las otras dos aplicaciones que no la tienen. Compilad y ejecutad los tres programas para un tamaño N=6 y comprobad que los 3 programas dan el mismo resultado.

5. Rellenad la tabla de la hoja de respuestas indicando para cada forma del producto de matrices con la optimización adicional, cuánto tiempo (segundos) tarda en ejecutarse y a cuántos MFLOPS se ejecuta. Os aconsejamos el uso de una hoja de cálculo para agilizar vuestro trabajo.

6. Comparad los resultados obtenidos con los obtenidos antes de optimizar los programas, y sacad conclusiones de dicha comparación.