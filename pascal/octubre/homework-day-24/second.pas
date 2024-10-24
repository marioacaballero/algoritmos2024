
Program second;

Const 
  MAX = 100;

Type 
  TPila = Record
    datos: array[1..MAX] Of Integer;
    cima: Integer;
  End;

Procedure InicializarPila(Var pila: TPila);
Begin
  pila.cima := 0;
End;

Function PilaVacia(pila: TPila): Boolean;
Begin
  PilaVacia := pila.cima = 0;
End;

Procedure Apilar(Var pila: TPila; elemento: Integer);
Begin
  If pila.cima < MAX Then
    Begin
      pila.cima := pila.cima + 1;
      pila.datos[pila.cima] := elemento;
    End
  Else
    WriteLn('Error: Pila llena');
End;

Function Desapilar(Var pila: TPila): Integer;
Begin
  If Not PilaVacia(pila) Then
    Begin
      Desapilar := pila.datos[pila.cima];
      pila.cima := pila.cima - 1;
    End
  Else
    Begin
      WriteLn('Error: Pila vacía');
      Desapilar := -1;
    End;
End;

Procedure EliminarImpares(Var pila: TPila);

Var 
  pilaAux: TPila;
  elemento: Integer;
Begin
  InicializarPila(pilaAux);

  While Not PilaVacia(pila) Do
    Begin
      elemento := Desapilar(pila);
      If elemento Mod 2 = 0 Then
        Apilar(pilaAux, elemento);
    End;

  While Not PilaVacia(pilaAux) Do
    Begin
      Apilar(pila, Desapilar(pilaAux));
    End;
End;

Var 
  pila: TPila;
  i: Integer;

Begin
  InicializarPila(pila);

  // Cargar algunos para probar (de forma automatica)
  For i := 1 To 10 Do
    Apilar(pila, i);

  WriteLn('Pila original:');
  For i := 1 To pila.cima Do
    Write(pila.datos[i], ' ');
  WriteLn;

  EliminarImpares(pila);

  WriteLn('Pila después de eliminar impares:');
  For i := 1 To pila.cima Do
    Write(pila.datos[i], ' ');
  WriteLn;
End.
