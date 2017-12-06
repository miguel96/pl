algoritmo orden3;
ent a, d, c: entero; sal max, min, med: entero; {Prec: a = A AND d = D AND c = C}
si a >= d y a >= c ->
max := a;
si d >= c ->med := d; min := c
[] d <c ->med := c; min := d
fsi
[] d >= a y d >= c ->
max := d;
si a >= c ->med := a; min := c
[] a <c ->med := c; min := a
fsi
[] c >= d y c >= a ->
max := c;
si d >= a ->med := d; min := a
[] d <a ->med := a; min := d
fsi
fsi
{Post: a=A AND d = D AND c= C ...}
falgoritmo.
