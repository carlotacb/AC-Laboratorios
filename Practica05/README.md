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

