# Laboratorio Sesión 07: Investigando la jerarquía de memoria

### Objetivo

El objetivo de esta sesión es desarrollar una serie de herramientas que nos permitirán averiguar alguno de los parámetros fundamentales de la memoria cache de un computador.

### Introducción

La memoria cache es una memoria de alta velocidad y pequeño tamaño que pretende almacenar, de forma transparente al programador, aquella información que será referenciada en un futuro próximo. Las memorias cache son efectivas porque se basan en las propiedades de localidad, tanto de datos como de instrucciones, de los programas. Algunos de los parámetros fundamentales que caracterizan una memoria cache son:

* Tamaño de la cache.
* Tamaño de la línea de cache.
* Grado de asociatividad de la cache.

En esta sesión vamos a desarrollar unos programas que nos permitirán averiguar los valores de estos tres parámetros en un computador cualquiera (La mayoría de los procesadores actuales disponen de una cache de datos y otra de instrucciones de primer nivel dentro del procesador. Nosotros estudiaremos sólo la cache de datos).

### Metodología de trabajo

La herramienta ideal para desarrollar este tipo de aplicaciones son los contadores hardware. Los contadores hardware son circuitos internos del microprocesador cuyo objetivo es permitir que el usuario tenga conocimiento de ciertos parámetros relevantes en la ejecución de programas. Los contadores hardware, una vez programados, se incrementan cada vez que se produce un determinado evento: acceso a memoria, fallos en la cache datos L1, etc. Estos contadores nos permiten averiguar cuántos eventos de un determinado tipo se producen en una porción de código. En el siguiente código se muestra cómo se obtiene esta información:

```
...
InitCounters(#Referencias, #FallosL1Datos); // Inicializar contadores
ReadCounters(&referencias1, &fallos1); // Leer contadores

// CODIGO A EVALUAR
ReadCounters(&referencias2, &fallos2); // Leer contadores
referencias = referencias2-referencias1; // Calcular referencias totales
fallos = fallos2 - fallos1; // Calcular fallos totales
m = fallos / referencias;
```

Otra forma de calcular estos parámetros es utilizar las medidas de tiempo (como las que se han hecho en las prácticas anteriores). Dado que los fallos de cache son más costosos (en tiempo) que un acierto, midiendo los tiempos de ejecución de distintos programas pueden deducirse el valor de algunos parámetros de la cache.

Sin embargo, cuando se utilizan medidas de tiempo, los resultados obtenidos suelen ser bastante imprecisos porque muchos otros eventos, y no sólo los fallos de cache, afectan al tiempo de ejecución.

En nuestro caso, para evitar las variaciones propias de los sistemas con varios procesadores, no vamos a utilizar ninguna de estas posibilidades. Vamos a utilizar un simulador, que para un programa determinado nos dirá cuántos fallos de cache se producen. Un ejemplo de cómo usar el simulador podría ser el siguiente código:

``` c
// 1) CODIGO A EVALUAR: 		// 1) CODIGO EVALUADOR:

sum = 0; 				InitCache(137); 				// Inicializar Cache #137
for (i=0; i<1000; i++) 			for (i=0; i<1000; i++)
	sum = sum + v[i] 			Referencia(&v[i]); 			// Evaluar acceso v[i]
					misses = Fallos(); 				// Obtener los fallos de cache

// 2) CODIGO A EVALUAR: 		// 2) CODIGO EVALUADOR:

for (i=0; i<1000; i++) 			InitCache(71); 					// Inicializar Cache #71
	v[i] = v[i] + 44 		for (i=0; i<1000; i++) {
						Referencia(&v[i]); 			// Evaluar acceso lect v[i]
						Referencia(&v[i]); 			// Evaluar acceso escr v[i]
					}
					misses = Fallos(); 				// Obtener los fallos de cache
```

En este código, el número que se pasa como parámetro a la función ``InitCache`` indica el tipo de cache que se usará para hacer las mediciones (hay muchas caches diferentes programadas con distintos tamaños de cache, tamaños de línea, asociatividad, políticas de escritura, etc., por lo que los resultados del experimento dependerán del parámetro que se pase a esta función).

** Ver PDF para el trabajo a realizar en la práctica **
