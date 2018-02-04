
int rutina(v[20], limite) {
    int i, resultado;
    i = 1;
    resultado = 0;
    
    while (i < limite) {
        if (v[i] != 5) {
            calle(&resultado);
        }
        ++i;
    }
    return resultado;
}
