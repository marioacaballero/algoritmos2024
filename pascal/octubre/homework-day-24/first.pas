
Program first;

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

Function ContarCopias(pila: TPila; elemento: Integer): Integer;

Var 
  contador, i: Integer;
Begin
  contador := 0;
  For i := 1 To pila.cima Do
    Begin
      If pila.datos[i] = elemento Then
        contador := contador + 1;
    End;
  ContarCopias := contador;
End;

Var 
  pila: TPila;
  elemento, numCopias: Integer;

Begin
  InicializarPila(pila);

  // Para agregar algunas a la pila
  // Apilar(pila, 5);
  // Apilar(pila, 3);
  // Apilar(pila, 5);
  // Apilar(pila, 7);
  // Apilar(pila, 5);

  Write('Ingrese el elemento a contar: ');
  ReadLn(elemento);

  WriteLn('El elemento ', elemento, ' aparece ', ContarCopias(pila, elemento),
  ' veces en la pila.'
  );
End.
