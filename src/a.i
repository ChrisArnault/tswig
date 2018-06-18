/* File : a.i */

%module a

%{
/* Put headers and other declarations here */
extern double My_variable;
extern int    fact(int);
extern int    my_mod(int n, int m);

enum Beers { ALE, LAGER=10, STOUT, PILSNER, PILZ=PILSNER };

struct Vector {
  double x,y,z;
};

%}

extern double My_variable;
extern int    fact(int);
extern int    my_mod(int n, int m);

%include "enumtypesafe.swg" // optional as typesafe enums are the default
