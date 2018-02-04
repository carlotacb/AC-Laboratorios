# Laboratorio Sesión 02: Uso del debugger

### Objetivo

El objetivo de esta sesión es introducir el uso del debugger y las principales herramientas de depuración de código.

### Conocimientos Previos

#### Compilar a código máquina de 32 bits

En la primera práctica vimos el comando de compilación estándar de gcc:

```gcc -o miprograma miprograma.c```

Este comando compila para el sistema operativo en el que estamos trabajando (en este caso x86 de 64 bits o AMD64). Sin embargo en esta asignatura estudiamos el ensamblador x86 de 32 bits (o IA32). Para poder compilar hacia código máquina de 32 bits en nuestro sistema operativo tendremos que añadir la opción -m32:

```gcc -m32 -o miprograma miprograma.c```

El código generado se puede ejecutar directamente ya que la arquitectura es compatible con el código IA32 y además, cuando lo depuréis veréis las instrucciones estudiadas en clase.

#### Debuggers

Cuando se trata de depurar un programa, habitualmente se usa un programa de depuración. Hay gente que prefiere depurar a base de realizar `printf` en el código del programa. Aunque es una opción que a veces funciona y a veces no, dado que no se puede usar siempre implicará un 0 en estas prácticas :-)

Así pues, una de las primeras decisiones que hay que tomar es qué tipo de programa de depuración vamos a utilizar. Aunque podéis usar cualquiera, en esta asignatura vamos a ver el funcionamiento de dos de estos programas: `gdb` y `ddd` (podéis usarlos indistintamente y os animamos a probar los dos). El primero es un programa en línea de comandos que permite trabajar con un terminal texto y que representa el tipo de depuradores que podremos encontrar en entornos poco desarrollados (como los entornos de desarrollo de software para procesadores específicos, por ejemplo). El segundo es un programa bajo entorno gráfico que tiene las mismas funcionalidades pero con una aproximación más visual e intuitiva. Dentro de `ddd` tenéis una consola que os permite introducir las ordenes de `gdb`.

#### Compilar con información de depurado

El primer paso para poder depurar adecuadamente un programa consiste en compilarlo incluyendo en el ejecutable información que nos ayude a poder depurarlo (por ejemplo que permita mostrar el código original en C además del código ensamblador). También es bueno no permitir que el compilador optimice el programa a la hora de depurar ya que la correspondencia entre el código ejecutado y el código escrito será mayor. Así pues, para depurar nuestra orden básica de compilación será:

`gcc -m32 -gstabs+ -o miprograma miprograma.c`

A continuación invocaremos el programa de depurado deseado:

`gdb miprograma / ddd miprograma`

También podemos observar directamente el código ensamblador del programa compilado:

`objdump -d miprograma`

A partir de aquí la idea general es activar un conjunto de _breakpoints_ cercanos a los puntos que nos interesen en el código. Estos puntos pueden ser las primeras instrucciones de una subrutina o una determinada dirección de memoria. Cuando el programa pasa por uno de los _breakpoints_, el programa se para (antes de ejecutar la sentencia asociada al _breakpoint_) y devuelve control al usuario. Desde ese punto, podemos examinar el contenido de los registros y el contenido de la memoria. También podemos ejecutar el programa instrucción a instrucción, por grupos de instrucciones o justo hasta el siguiente _breakpoint_. Lo importante es comprobar que el conjunto de instrucciones que estamos examinando realmente dan el resultado esperado.
