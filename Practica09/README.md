# Laboratorio Sesión 09: Coma flotante, precisión y rendimiento

### Objetivo

El objetivo de esta sesión es introducir el uso y los problemas de precisión de los cálculos en coma flotante además de realizar medidas de rendimiento. Para recordar cómo se tratan en un procesador actual las operaciones en coma flotante pod´eis repasar la Sección 3.5 del libro Computer organization and design: the hardware/software interface de David A. Patterson y John L. Hennessy.

### Conocimientos previos

#### MIPS vs. MFLOPS

Ya en la práctica 1 vimos los MIPS como forma de medir el rendimiento de un procesador. Sin embargo los MIPS son una unidad de medida que es extremadamente variable ya que el mismo código fuente se puede implementar con más o menos instrucciones: dependiendo del ISA del procesador, del compilador y de las optimizaciones un mismo programa que se ejecuta en el mismo tiempo puede dar lugar a medidas de más o menos MIPS. Para intentar paliar este tipo de problemas, al menos en los programas científicos, se utilizan como unidad de medida de la velocidad de un procesador los MFLOPS (millones de Operaciones de Coma Flotante por Segundo). Las diferencias con los MIPS son principalmente dos:

* Mide las operaciones y no las instrucciones, es decir, una multiplicación siempre es una operación, independientemente de la cantidad de instrucciones que hagan falta para implementarla. Así pues esta medida es más independiente del código máquina que los MIPS.

* Las operaciones son de Coma Flotante y no enteras. Esto hace que los MFLOPS sean adecuados para medir el rendimiento de programas de cálculo numérico (que usan este tipo de operaciones), pero no para programas que no usan la coma flotante. Es más, un procesador enfocado a la ejecución de códigos enteros (y por tanto sin unidad hardware específica de coma flotante) puede ser muy rápido y tener una velocidad en MFLOPS muy lenta.

Además, como pasa con los MIPS, hay una gran diferencia entre la velocidad máxima teórica (o de pico) y la velocidad real a la que se pueden ejecutar las instrucciones (debido a la influencia de la memoria, etc.). Para hacer comparaciones entre computadores se suelen ejecutar un conjunto concreto de códigos como por ejemplo el benchmark LINPACK (usado en el TOP500).

### Trabajo a realizar durante la Práctica

1. Para empezar esta práctica vamos a ver algunos de los problemas que nos puede dar el hecho de usar números en formato IEEE debido a los errores de precisión. Dada la siguiente operación:

	z = x^4 − 4y^4 − 4y^2

Haced un programa que calcule el resultado para z de la anterior operación para los valores iniciales x = 665857 y y = 470832 en doble precisión. 

2. A continuación calculad la misma operación en simple precisión.

3. Finalmente computad el resultado usando variables enteras largas (long long).

4. Explicad las diferencias observadas y razonad cuál es la solución correcta y por qué. Para comprobar el resultado podéis utilizar una calculadora, un móvil, el programa bc o incluso la calculadora de Google. Ojo, sólo os aseguramos que bc da el resultado correcto.

5. A continuación vamos a ver la importancia de los MFLOPS como elemento de medida de la velocidad. Partiendo del programa SumMulMat.c que tenéis en el paquete de programas de la práctica, ejecutadlo en vuestro ordenador y calculad a cuantos MIPS y a cuantos MFLOPS se ejecuta. Para calcular las operaciones de coma flotante y el tiempo tened en cuenta la parte del programa que se indica en el código del mismo. Para calcular las instrucciones, aunque es una aproximacióon, podéis usar por las instrucciones totales del programa tal y como las indica la herramienta valgrind. Recordad no medir a la vez tiempo e instrucciones.

6. A continuación compilad optimizando el código, es decir, con la opción -O2. Calculad de nuevo a cuantos MIPS y MFLOPS se ejecuta en este caso. Calculad el Speedup que se ha obtenido en este caso.