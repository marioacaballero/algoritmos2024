
Program parcial_enero_2024;

Type 
  T_Dato_Q = Record
    tipo: ['R' or 'C'];
    N_Can: '1'..'5';
    fecha: string[8];
    hora: string[5];
    dni: string[8];
  End;

  T_Puntero_Q = ^T_Nodo_Cola;
  T_Nodo_Cola = Record
    info: T_Dato_Q;
    sig: T_Puntero_Q;
  End;

  T_Cola = Record
    fre, fin: T_Puntero_Q;
    tam: byte;
  End;

  T_Dato_Vec = Record
    fecha: string[8];
    total: real;
    L: T_Lista;
  End;

  T_Vector = Array[1..5] Of T_Dato_Vec;

  T_Dato_L = Record
    dni: string[8];
    N_Can: '1'..'5';
    hora: string[5];
  End;

  T_Punt_Lista = ^T_Nodo_Lista;

  T_Nodo_Lista = Record
    info: T_Dato_L;
    sig: T_Punt_Lista;
  End;

  T_Lista = Record
    cab, act: T_Punt_Lista;
    tam: byte;
  End;

  // punto b
Procedure b(Var Q: T_Cola; Var V: T_Vector; Var QA: T_Cola);

Var 
  XQ: T_Dato_Q;
  XL: T_Dato_L;
  pos: byte;
  enc: Boolean;
Begin
  crear_Q(QA);
  While (Not cola_vacia(Q)) Do
    Begin
      desencolar(Q, XQ);
      pos := hash(XQ.fecha);
      buscado := XQ.hora + XQ.N_Can;
      buscar(V[pos].L, buscado, enc);
      If (XQ.tipo = 'R') Then
        Begin
          If enc Then
            encolar(QA, XQ)
          Else
            Begin
              XL.dni := XQ.dni;
              XL.N_Can := XQ.N_Can;
              XL.hora := XQ.hora;
              agregar(V[pos].L, XL);
            End;
          If (XQ.hora > '20:00') Then
            V[pos].total := V[pos].total + 10000
          Else
            V[pos].total := V[pos].total + 6000;
        End
      Else
        Begin
          If enc Then
            eliminar(V[pos].L, buscado, XL);
          If (XQ.hora > '20:00') Then
            V[pos].total := V[pos].total - 10000
          Else
            V[pos].total := V[pos].total - 6000;
        End;
    End;
End;

// punto c
Procedure c(Var V: T_Vectorl; Var dia: byte);

Var 
  max, i: byte;
Begin
  max := tamano(V[1].L);
  dia := 1;
  For i:= 1 To 5 Do
    Begin
      If (tamano(V[i].L) > max) Then
        Begin
          max := tamano(V[i].L);
          dia := i;
        End;
    End;
End;

Procedure muestra_c (Var V: T_Vector);

Var 
  dia: byte;
Begin
  write('Ingrese dia ');
  readln(dia);
  c(V, dia);
  writeln('El dia ', dia, 'tiene', tamano(V[dia].L), 'reservas');
End;

Procedure d(V: T_Vector; hora: String);

Var 
  i, j, cont: byte;
  enc: Boolean;
  XL: T_Dato_L;
  can: array [1..5] Of boolean;
Begin
  For i:= 1 To 5 Do
    Begin
      cont := 0;
      buscar(V[i].L,hora,enc);
      If enc Then
        Begin
          While (Not fin(V[i].L)) Do
            Begin
              recuperar(V[i].L, XL);
              If (XL.hora = hora) Then
                Begin
                  inc(cont);
                  can[StrToInt(XL.N_Can)] := true;
                End;
            End;
          If (cont = 5) Then
            writeln('El dia ', i, ' no tiene canchas disponibles en la hora ',
                    hora)
          Else
            Begin
              write('El dia ', i, ' tiene disponibles las canchas ');
              For j:= 1 To 5 Do
                If (Not can[j]) Then
                  write(can[j], ' ');
              Write('disponibles');
            End;
        End
      Else
        Writeln('El dia ', i, ' tiene todas las canchas disponibles en la hora '
                , hora)
    End;
End;

Procedure muestra_d(V: T_Vector);

Var 
  hora: string;

Begin
  Write('Ingrese la hora ');
  readln(hora);
  d(V, hora);
End;

Begin
  // menu de opciones

End.
