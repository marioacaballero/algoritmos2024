
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
Begin

End;

Procedure modificar(Var L: T_Lista; X: T_Dato_Lista);
Begin

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

Begin

End.
