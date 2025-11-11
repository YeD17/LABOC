#include <stdio.h>

extern int suma( int num1, int num2);
extern int strlen(char *str);
extern int getBit( int value, int numbit);

int main() {
    printf ("La suma de %d y %d es = %d\n", 5, 4, suma(5, 4));
    printf ("La longitud de la cadena '%s' es = %d\n", "Persona", strlen("Persona"));
    printf ("El bit numero %d de %d es = %d\n", 0, 8, getBit(8, 0));
    return 0;
}