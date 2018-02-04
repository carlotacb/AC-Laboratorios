#include "CacheSim.h"

/* Posa aqui les teves estructures de dades globals
 * per mantenir la informacio necesaria de la cache
 * */
 
struct {
	int via0;
	int via1;
	
} conjunt;
 
conjunt cache[512];

/* La rutina init_cache es cridada pel programa principal per
 * inicialitzar la cache.
 * La cache es inicialitzada al començar cada un dels tests.
 * */
void init_cache ()
{
    totaltime=0.0;
	/* Escriu aqui el teu codi */

	int i;
    
    for (i = 0; i < 512; ++i) {
		cache[i].via0 = -1;
		cache[i].via1 = -1;
	}

}

/* La rutina reference es cridada per cada referencia a simular */ 
void reference (unsigned int address)
{
	unsigned int byte;
	unsigned int bloque_m; 
	unsigned int conj_mc;
	unsigned int via_mc;
	unsigned int tag;
	unsigned int miss;	   // boolea que ens indica si es miss
	unsigned int replacement;  // boolea que indica si es reemplaça una linia valida
	unsigned int tag_out;	   // TAG de la linia reemplaçada
	float t1,t2;		// Variables per mesurar el temps (NO modificar)
	
	t1=GetTime();
	/* Escriu aqui el teu codi */


	miss = 0;
	replacement = 0;
	
	tag_out = -1;
	
	byte = ;
	
	bloque_m = ;
	
	conj_mc = ;
	
	via_mc = ;
	
	tag = ;
	
	if (cache[conj_mc].via0 == -1) { // encara no hi ha res al conjunt
		miss = 1;
		replacement = 0;
		cache[conj_mc].via0 = tag;
		via_mc = 0;
	}
	
	else if (cache[conj_mc].via0 != tag) {
		
		if (cache[conj_mc].via1 == -1) { // encara no hi ha res a la via1 del conjunt
			miss = 1;
			replacement = 0;
			cache[conj_mc].via1 = tag;
			via_mc = 1;
			
		}
		
		else {
			miss = 1;
			replacement = 1
			
		}
			
	}







	/* La funcio test_and_print escriu el resultat de la teva simulacio
	 * per pantalla (si s'escau) i comproba si hi ha algun error
	 * per la referencia actual. També mesurem el temps d'execució
	 * */
	t2=GetTime();
	totaltime+=t2-t1;
	test_and_print2 (address, byte, bloque_m, conj_mc, via_mc, tag,
			miss, replacement, tag_out);
}

/* La rutina final es cridada al final de la simulacio */ 
void final ()
{
 	/* Escriu aqui el teu codi */ 
  
  
}
