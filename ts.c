#include "ts.h"

void init(tabla_simbolos tabla) {
  tabla->size = 0;
  tabla->primero = null;
  tabla->ultimo = tabla->primero;
}
