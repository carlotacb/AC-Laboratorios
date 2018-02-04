#include "CacheSim.h"

/* Posa aqui les teves estructures de dades globals
 * per mantenir la informacio necesaria de la cache
 * */

int cache[1024]; 

/* La rutina init_cache es cridada pel programa principal per
 * inicialitzar la cache.
 * La cache es inicialitzada al començar cada un dels tests.
 * */
void init_cache ()
{
    totaltime=0.0;
    /* Escriu aqui el teu codi */
    
    int i;
    
    for (i = 0; i < 1024; ++i) cache[i] = -1;
    
}

/* La rutina reference es cridada per cada referencia a simular */ 
void reference (unsigned int address)
{
	unsigned int byte;              // byte que utilitza.
	unsigned int bloque_m;          // Bloc de memoria accedit
	unsigned int linea_mc;          // linea de la memoria cache utilitzada 
	unsigned int tag;               // etiqueta que posem a la linea de mem cache
	unsigned int miss;	            // boolea que ens indica si es miss
	unsigned int replacement;       // boolea que indica si es reemplaça una linia valida
	unsigned int tag_out;	        // TAG de la linia reemplaçada
	float t1,t2;		            // Variables per mesurar el temps (NO modificar)
	
	t1=GetTime();
	
	/* Escriu aqui el teu codi */
	
	miss = 0; // false
	replacement = 0; // false
	tag_out = -1; // no hi ha linea reemplaçada pel moment
	
	byte = ;
	
	bloque_m = ;
	
	linea_mc = ;
	
	tag = ;
	
	if (cache[linea_mc] == -1) { // miss perque encara no hi ha res per tant no reemplaça
	  miss = 1; // true
	  replacement = 0; // false
	  cache[linea_mc] = tag;
	}
	  
	else if (cache[linea_mc] != tag) { // miss reemplaçant, ja que el tag es diferent
	  miss = 1; // true
	  replacement = 1; // true
	  tag_out = cache[linea_mc];
	  cache[linea_mc] = tag;
	}
	  
	else { // hit 
	  miss = 0; // false
	  replacement = 0; // false
		  
	}

	/* La funcio test_and_print escriu el resultat de la teva simulacio
	 * per pantalla (si s'escau) i comproba si hi ha algun error
	 * per la referencia actual. També mesurem el temps d'execució
	 * */
	t2=GetTime();
	totaltime+=t2-t1;
	test_and_print (address, byte, bloque_m, linea_mc, tag, miss, replacement, tag_out);
}

/* La rutina final es cridada al final de la simulacio */ 
void final ()
{
 	/* Escriu aqui el teu codi */ 
  
  
}
