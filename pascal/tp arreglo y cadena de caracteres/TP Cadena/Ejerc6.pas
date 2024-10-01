
Program Ejerc6;

Uses SysUtils;

Function ExtractDomain(email: String): string;

Var 
  atPos, dotPos: Integer;
  domain: string;
Begin
  atPos := Pos('@', email);
  If atPos > 0 Then
    Begin
      dotPos := atPos + 1;
      While (dotPos <= Length(email)) And (email[dotPos] <> '.') Do
        Inc(dotPos);
      If dotPos <= Length(email) Then
        domain := Copy(email, atPos + 1, dotPos - atPos - 1)
      Else
        domain := 'Desconocido';
    End
  Else
    domain := 'Desconocido';
  ExtractDomain := domain;
End;

Var 
  email: string;
  domain: string;
Begin
  Write('Introduce la dirección de correo: ');
  ReadLn(email);
  domain := ExtractDomain(email);
  WriteLn('El dominio del correo es: ', domain);
End.
