#include <stdio.h>

#define N 200000
#define tam 16*1024*1024

int i, j, step;
unsigned char v[tam];

void InitCache(int cod);
void Referencia(unsigned char *dir);
int Referencias();
int Fallos();


int main() 
{  int i, j, step;
   int refs, misses;

  for (step=1; step<=200; step+=1) {
	
    InitCache(0xE1947ACB); 

    i = 0;

    for (j=0; j<256; j++) {
      Referencia((unsigned char *)&v[i]);     // acceso a v[i] 
      i = i + step;
      if (i >= tam) i = 0;
    }

    refs = Referencias();
    misses = Fallos(); 
    printf("LineSize? step=%3d ; fallos=%6d ; referencias=%6d\n", step, misses, refs);

  }

  return 0;
}

