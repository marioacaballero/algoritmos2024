
Unit unithm10;

Interface

Uses crt;

Const 
  n = 1000;

Type 
  type_cuotes = Array[1..12] Of real;
  type_poliza = Record
    id: word;
    clientName: string[100];
    address: string[60];
    yearOfBirthday: integer;
    price: real;
    cuotes: type_cuotes;
  End;

  type_polizas = array[1..n] Of type_poliza;


Procedure init (Var polizas: type_polizas);
Procedure showPeopleWith70YearsOld(polizas: type_polizas);
Procedure showPeopleWithLessThan30Price(polizas: type_polizas);
Procedure showPeopleWithMoreThan100Price(Var polizas: type_polizas);
Procedure binarySearchPeople(polizas: type_polizas; people:String; Var
                             found: boolean; Var pos: integer);

Implementation

Procedure initCuotes(price: real; Var cuotes: type_cuotes);

Var i: integer;
Begin
  For i:= 1 To 12 Do
    cuotes[i] := price / 12;
End;

Procedure init (Var polizas: type_polizas);

Var i: integer;
  poliza: type_poliza;

Begin
  For i:= 1 To n Do
    Begin
      clrscr;
      Writeln('Ingrese los siguientes datos del asegurado ', i, ':');
      Writeln('');
      Write('Nombre y apellido: ');
      ReadLn(poliza.clientName);
      Write('Direccion: ');
      ReadLn(poliza.address);
      Write('Año de nacimiento: ');
      ReadLn(poliza.yearOfBirthday);
      Write('Cantidad asegurada: ');
      ReadLn(poliza.price);
      poliza.id := i;
      initCuotes(poliza.price, poliza.cuotes);

      polizas[i] := poliza;
    End;
End;

Procedure showPeopleWith70YearsOld(polizas: type_polizas);

Var i: integer;

Begin
  Writeln('Personas con 70 años cumplidos: ');
  For i:= 1 To n Do
    Begin
      If polizas[i].yearOfBirthday = 1950 Then
        Begin
          Writeln('Nombre y apellido: ', polizas[i].clientName);
          Writeln('Direccion: ', polizas[i].address);
        End;
    End;
End;


Procedure showPeopleWithLessThan30Price(polizas: type_polizas);

Var i: integer;
Begin
  Writeln('Personas cuya cuota es menor a $ 30.00: ');
  For i:= 1 To n Do
    Begin
      If polizas[i].cuotes[1] < 30 Then
        Begin
          Writeln('Nombre y apellido: ', polizas[i].clientName);
          Writeln('Direccion: ', polizas[i].address);
        End;
    End;
End;

Procedure bubbleSort(Var polizas: type_polizas);

Var i, j: integer;
  aux: type_poliza;
Begin
  For i:= 1 To n-1 Do
    For j:= 1 To n-i Do
      If polizas[j].price > polizas[j+1].price Then
        Begin
          aux := polizas[j];
          polizas[j] := polizas[j+1];
          polizas[j+1] := aux;
        End;
End;

Procedure binarySearch(polizas: type_polizas; price: real; Var found: boolean;
                       Var pos: integer);

Var low, high, middle: integer;
Begin
  low := 1;
  high := n;
  found := false;
  While (low <= high) And Not found Do
    Begin
      middle := (low + high) Div 2;
      If polizas[middle].price = price Then
        Begin
          found := true;
          pos := middle;
        End
      Else
        If polizas[middle].price < price Then
          low := middle + 1
      Else
        high := middle - 1;
    End;
End;

Procedure showPeopleWithMoreThan100Price(Var polizas: type_polizas);

Var i: integer;
  found: boolean;
  pos: integer;
Begin
  bubbleSort(polizas);

  binarySearch(polizas, 100, found, pos);

  If found Then
    Begin
      Writeln('Personas cuya cuota es mayor a $ 100.00: ');
      For i:= pos To n Do
        Begin
          Writeln('Nombre y apellido: ', polizas[i].clientName);
          Writeln('Direccion: ', polizas[i].address);
        End;
    End
  Else
    Writeln('No se encontraron personas cuya cuota es mayor a $ 100.00');

End;

Procedure binarySearchPeople(polizas: type_polizas; people:String; Var
                             found: boolean; Var pos: integer);

Var low, high, middle: integer;
Begin
  low := 1;
  high := n;
  found := false;
  While (low <= high) And Not found Do
    Begin
      middle := (low + high) Div 2;
      If polizas[middle].clientName = people Then
        Begin
          found := true;
          pos := middle;
        End
      Else
        If polizas[middle].clientName < people Then
          low := middle + 1
      Else
        high := middle - 1;
    End;
End;

End.
