
Program parcial_enero_2024_arch;

Const 
  path = './parcial.dat';

Type 
  T_Dato = char;
  T_Archivo = file Of T_Dato;

Var 
  arch: T_Archivo;
  x, x1:  T_Dato;
  n, i: byte;
  pal: Boolean;

Begin
  Assign(arch, path);
  Rewrite(arch);
  n := FileSize(arch);
  i := 0;
  pal := true;

  While (i < (n Mod 2)) And (pal) Do
    Begin
      Seek(arch, i);
      read(arch, x);
      Seek(arch, n - i - 1);
      read(arch, x1);
      If (x <> x1) Then
        pal := false
      Else
        inc(i);
    End;

  If pal Then
    WriteLn('Es palindromo')
  Else
    WriteLn('No es palindromo');
End.
