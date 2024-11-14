
Program parcial_2023_tarde;

Const 
  n = 31;

Type 
  T_Dato_Pila = Record
    dni: string[8];
    fecha: string[8];
    tipo: 1..3;
  End;

  T_Puntero_Pila = ^T_Nodo_Pila;

  T_Nodo_Pila = Record
    info: T_Dato_Pila;
    sig: T_Puntero_Pila;
  End;

  T_Pila = Record
    tope: T_Puntero_Pila;
    tam: word;
  End;

  T_Dato_Lista = Record
    dni: string[8];
    tipo: 1..3;
    puntos: word;
  End;

  T_Puntero_Lista = ^T_Nodo_Lista;

  T_Nodo_Lista = Record
    info: T_Dato_Lista;
    sig: T_Puntero_Lista;
  End;

  T_Lista = Record
    cab, act: T_Puntero_Lista;
    tam: word;
  End;

  T_Dato_Vec = Record
    fecha: 1..31;
    L: T_Lista;
  End;

  T_Vector = Array[1..n] Of T_Dato_Vec;

  // --------------------------------------------------
Procedure punto_b (Var V: T_Vector; Var S: T_Pila);

Var 
  i: 1..n;
  XS: T_Dato_Pila;
  XL: T_Dato_Lista;
  pos: byte;
  enc: Boolean;
Begin
  For i:= 1 To n Do
    crear(V[i].L);

  While (Not pila_vacia(S)) Do
    Begin
      desapilar(S, XS);
      pos := StrToInt(copy(XS.fecha, 1, 2));
      XL.dni := XS.dni;
      XL.tipo := XS.tipo;
      Case XL.tipo Of 
        1: XL.puntos := 4;
        2: XL.puntos := 5;
        3: XL.puntos := 10;
      End;
      buscar(V[pos].L, XL.dni, enc);
      If (enc) Then
        modificar(V[pos].L, XL)
      Else
        If (Not lista_llena(V[pos].L)) Then
          agregar(V[pos].L, XL);
    End;
End;

// --------------------------------------------------
Procedure crear(Var L: T_Lista);
Begin
  L.cab := Nil;
  L.tam := 0;
End;

Procedure buscar(Var L: T_Lista; buscado: String; Var enc: boolean);

Var 
  pos: word;
  E: T_Dato_Lista;
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
    enc := true;
End;

Procedure agregar(Var L: T_Lista; X: T_Dato_Lista);

Var 
  dir, ant: T_Puntero_Lista;
Begin
  new(dir);
  dir^.info = X;
  If (L.cab = Nil ) Or (L.cab^.info.dni > x.dni) Then
    Begin
      dir^.sig := L.cab;
      L.cab := dir;
    End
  Else
    Begin
      ant := L.cab;
      L.act := ant^.sig;
      While (Not fin(L)) And (L.act^.info.dni < x.dni) Do
        Begin
          ant := L.act;
          L.act := ant^.sig;
        End;
      ant^.sig := dir;
      dir^.sig := L.act;
    End;
  inc(L.tam);
End;

Procedure modificar(Var L: T_Lista; X: T_Dato_Lista);
Begin
  L.act^.info.tipo := X.tipo;
  L.act^.info.puntos := L.act^.info.puntos + X.puntos;
End;

Procedure primero(Var L: T_Lista);
Begin
  L.act := L.cab;
End;

Procedure siguiente(Var L: T_Lista);
Begin
  L.act := L.act^.sig;
End;

Procedure recuperar(L: T_Lista; Var E: T_Dato_Lista);
Begin
  E := L.act^.info;
End;

Function fin(L: T_Lista): boolean;
Begin
  fin := L.act = Nil;
End;

Function lista_llena(L: T_Lista): boolean;
Begin
  lista_llena := GetHeapStatus.TotalFree < SizeOf(T_Nodo_Lista);
End;

// --------------------------------------------------
Procedure punto_c(Var V: T_Vector; buscado: String);

Var 
  XL: T_Dato_Lista;
  cont: word;
  i: byte;
  enc: Boolean;
Begin
  cont := 0;
  For i:=1 To n Do
    Begin
      buscar(V[i].L, buscado, enc);
      If (enc) Then
        Begin
          recuperar(V[i].L, XL);
          cont := cont + XL.puntos;
        End;
    End;
  If (cont = 0) Then
    WriteLn('El dni no posee infracciones')
  Else
    WriteLn('El dni ', buscado, ' tiene ', cont, ' puntos');
End;

Procedure muestra_c(Var V: T_Vector);

Var 
  buscado: string;
Begin
  Write('Ingrese dni: ');
  ReadLn(buscado);
  punto_c(V, buscado);
End;

// -------------------------------------------------------------

Var 
  V: T_Vector;
  S: T_Pila;
  op: byte;
Begin
  Repeat
    WriteLn('Opciones disponibles');
    WriteLn('1. Iniciar vector de infracciones');
    WriteLn('2. Consulta de puntos de DNI');
    WriteLn('3. Infractores con mas de 20 puntos');
    WriteLn('4. Salir');
    Write('Ingrese opcion: ');
    ReadLn(op);

    Case op Of 
      1: punto_b(V, S);
      2: muestra_c(V);
      3: write('c');
      Else
        op := 4;
    End;
  Until op = 4;
End.
