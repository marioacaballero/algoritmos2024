
Program Compara_ordenamiento;

Uses crt, Dos;

Const 
  n = 100000;

Type 
  t_dato = word;
  t_vector = array [1..n] Of t_dato;

Var 
  A,B: t_vector;
  h,m,s,cs,h1,m1,s1,cs1: word;

Procedure carga_todo (Var v: t_vector);

Var i: 1..n;
Begin
  randomize;
  For i:= 1 To n Do
    v[i] := random (10000);
End;
Procedure muestra_todo (Var v:t_vector);

Var i: 1..n;
Begin

  For i:= 1 To n Do
    write(v[i]:5, ' ');
End;
Procedure burbuja_1(Var V:T_vector);

Var 
  i, j: 1..N;
  aux: T_dato;
Begin
  For i := 1 To N-1 Do
    For j := 1 To N-I Do
      If V[j] > V[j+1] Then //intercambia valores
        Begin
          aux := V[j];
          V[j] := V[j+1];
          V[j+1] := aux;
        End;
End;
Procedure seleccion(Var V:T_vector);

Var 
  min, i, j: 1..N;
  aux: t_dato;
Begin
  For i := 1 To N-1 Do
    Begin
      min := i;
      For j := i+1 To N Do
        If V[j] < V[min] Then
          min := j;
      If i <> min Then
        Begin
          aux := V[min];
          V[min] := V[i];
          V[i] := aux;
        End;
    End;
End;
Begin
  carga_todo (A);
  B := A;
  muestra_todo(A);
  // gettime (h,m,s,cs);
  // burbuja_1(A);
  // gettime (h1,m1,s1,cs1);
  // writeln ('Burbuja: ',(h1-h) * 3600 + (m1-m)*60 + (s1-s) + ((cs1-cs)/100) );
  // readkey;
  // gettime (h,m,s,cs);
  // seleccion(B);
  // gettime (h1,m1,s1,cs1);
  // write ('Seleccion: ',(h1-h) * 3600 + (m1-m)*60 + (s1-s) + ((cs1-cs)/100) );
  readkey;
End.
