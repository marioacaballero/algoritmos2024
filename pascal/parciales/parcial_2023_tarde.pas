
Program parcial_2023_tarde;

Const 
  n = 31;
  // cant de dias de diciembre

Type 

  T_Dato_Lista = Record
    dni: string[8];
    fecha: string[8];
    // DDMMAAAA string[2]
    tipo: 1..3;
  End;

  T_Puntero_Lista = ^T_Nodo_Lista;

  T_Nodo_Lista = Record
    info: T_Dato_Lista;
    sig: T_Puntero_Lista;
  End;

  T_Dato_Vector = Record
    dia: 1..n;
    L: T_Dato_Lista;
  End;

  // 2 Estructuras: 1 vector y 1 lista
  T_Lista = Record
    cab, act: T_Puntero_Lista;
    tam: word;
  End;

  T_Vector = array [1..n] Of T_Dato_Vector;
  // V[1].L aca estoy en la lista

  // T_Vector = array [1..n] Of T_Lista; V[1] aca estoy en la lista

  // ---------------------------------------------------------------------
  T_Dato_Lista_2 = Record
    dni: string[8];
    cant_inf: byte;
  End;

  T_Puntero_Lista_2 = ^T_Nodo_Lista_2;

  T_Nodo_Lista_2 = Record
    info: T_Dato_Lista_2;
    sig: T_Puntero_Lista_2;
  End;

  T_Lista_2 = Record
    cab, act: T_Puntero_Lista_2;
    tam: word;
  End;

  T_Dato_Vector_2 = Record
    quin: 1..2;
    L: T_Lista_2;
  End;

  T_Vector_2 = array[1..2] Of T_Dato_Vector_2;

  // ---------------------------------------------------------------------
  // V -> Vector de inf /// V2 -> Vector de quincenas
Procedure punto_b (V:T_Vector;Var V2: T_Vector_2);

Var 
  i: byte;
  enc: Boolean;
  XL1: T_Dato_Lista;
  XL2: T_Dato_Lista_2;
  L_aux: T_Lista_2;
Begin
  crear(V2[1].L);
  crear(V2[2].L);

  // For i:= 1 To n Do
  //   Begin
  //     primero(V[i].L);
  //     While (Not fin(V[i].L)) Do
  //       Begin
  //         If (1 < 16) Then
  //           L_aux := V2[1].L
  //         Else
  //           L_aux := V2[2].L;
  //         recuperar(V[i].L, XL1);
  //         buscar(L_aux, XL1.dni, enc);
  //         If (enc) Then
  //           modificar(L_aux, XL1.dni)
  //         Else
  //           Begin
  //             XL2.dni := XL1.dni;
  //             XL2.cant_inf := 1;
  //             agregar(L_aux, XL2);
  //           End;
  //         siguiente(V[i].L);
  //       End;
  //   End;

  For i:= 1 To 15 Do
    Begin
      primero(V[i].L);
      While (Not fin(V[i].L)) Do
        Begin
          recuperar(V[i].L, XL1);
          buscar(V2[1].L, XL1.dni, enc);
          If (enc) Then
            modificar(V2[1].L, XL1.dni)
          Else
            Begin
              XL2.dni := XL1.dni;
              XL2.cant_inf := 1;
              agregar(V2[1].L, XL2);
            End;
          siguiente(V[i].L);
        End;
    End;

  For i:= 16 To n Do
    Begin
      primero(V[i].L);
      While (Not fin(V[i].L)) Do
        Begin
          recuperar(V[i].L, XL1);
          buscar(V2[2].L, XL1.dni, enc);
          If (enc) Then
            modificar(V2[2].L, XL1.dni)
          Else
            Begin
              XL2.dni := XL1.dni;
              XL2.cant_inf := 1;
              agregar(V2[2].L, XL2);
            End;
          siguiente(V[i].L);
        End;
    End;
End;

Procedure crear(Var L: T_Lista_2);
Begin
  L.cab := Nil;
  L.tam := 0;
End;

Procedure primero(L: T_Lista);
Begin
  L.act := L.cab;
End;

Procedure siguiente(L: T_Lista);
Begin
  L.act := L.act^.sig;
End;

Procedure recuperar(L: T_Lista; Var E: T_Dato_Lista);
Begin
  E := L.act^.info;
End;

Function fin(L: T_Lista): Boolean;
Begin
  fin :=  L.act = Nil;
End;

Procedure buscar(L: T_Lista_2; buscado: String; Var enc: Boolean);

Var 
  pos: Byte;
  E: T_Dato_Lista_2;
Begin
  enc := false;
  pos := 0;
  primero(L);
  While (Not fin(L)) And (pos = 0) Do
    Begin
      recuperar(L, E);
      If (E.dni = buscado) Then
        pos := 1
      Else If (E.dni > buscado) Then
             pos := 2
      Else
        siguiente(L);
    End;

  If (pos = 1) Then
    enc := true
End;

Procedure agregar(Var L: T_Lista_2; X: T_Dato_Lista_2);

Var 
  dir, ant: T_Puntero_Lista_2;
Begin
  new(dir);
  dir^.info := X;
  If ( L.cab = Nil ) Or (L.cab^.info.dni > X.dni ) Then
    Begin
      dir^.sig := L.cab;
      L.cab :=  dir;
    End
  Else
    Begin
      ant := L.cab;
      L.act := L.cab^.sig;
      While (L.act <> Nil) And (L.act^.info.dni < X.dni)  Do
        Begin
          ant := L.act;
          L.act := ant^.sig;
        End;
      dir^.sig := L.act;
      ant^.sig := dir;
    End;
  inc(L.tam);
End;

Procedure recorrer(L: T_Lista_2; X: String);
Begin
  primero(L);
  While (L.act^.info.dni <> x) Do
    siguiente(L);
End;

Procedure modificar(Var L: T_Lista_2; X: String);
Begin
  recorrer(L, X);
  inc(L.act^.info.cant_inf);
End;

// ----------------------------------------------------
Procedure punto_c(V: T_Vector_2; dni: String);

Var 
  enc: Boolean;
  XL: T_Dato_Lista_2;
Begin
  For i:=1 To 2 Do
    Begin
      buscar(V[i].L, dni, enc);
      If (enc) Then
        Begin
          recorrer(V[i].L, dni);
          recuperar(V[i].L, XL);
          WriteLn('El dni ', dni, ' tiene ', XL.cant_inf, ' inf en la quinc ', i
          );
        End
      Else
        writeln('El dni no registra infracciones en la quincena ', i);
    End;
End;

Procedure muestra_c(V: T_Vector_2);

Var 
  dni: string;
Begin
  Write('Ingrese dni: ');
  ReadLn(dni);
  punto_c(V, dni);
End;



// cuerpo principal

Var 
  op: byte;
  V1: T_Vector;
  V2: T_Vector_2;

Begin
  Repeat
    Writeln('Opciones diponibles');
    Writeln('1. Separar por quincenas');
    Writeln('2. Cantidad de infracciones de un DNI');
    Writeln('3. Total de puntos a descontar por DNI');
    Writeln('4. Salir');

    Write('Ingrese una opcion');
    ReadLn(op);

    Case op Of 
      1: punto_b(V1, V2);
      2: muestra_c(V2);
      3: writeln('3');
    End;

  Until op = 4;

End.
