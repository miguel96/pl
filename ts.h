#ifndf ts_aitor_miguel_h
#define ts_aitor_miguel_h

typedef enum {
  VAR_INT,
  VAR_REAL,
  VAR_BOOL,
  VAR_CHAR,
  VAR_STRING
} tipo_variable;

typedef struct {
  char *nombre;
  tipo_variable tp;
} variable;

#endif
