
Unit validationUnit;

Interface

Uses crt;

Procedure validateDni(dni: String);

Implementation
Function validateLargeDni(dni: String): integer;
Begin
  If (Length(dni) >= 7) And  (Length(dni) <= 8) Then
    validateLargeDni := 0
  Else
    validateLargeDni := 1;
End;

Function validateTypeDni(dni: String): integer;

Var i, flag, res : integer;
Begin
  If ((dni[1] <= '0') Or (dni[1] >= '9')) Then
    res := 1
  Else
    Begin
      i := 2;
      flag := 0;
      While ((i <= Length(dni)) And (flag = 0)) Do
        Begin
          flag := 1;
          res := 2;
          If ((dni[i] >= '0') And (dni[i] <= '9')) Then
            Begin
              flag := 0;
              res := 0;
              Inc(i);
            End;
        End;
    End;
  validateTypeDni := res;
End;


Procedure validateDni(dni: String);

Begin
  If validateTypeDni(dni) = 1 Then
    Begin
      writeln('');
      TextColor(red);
      Write('Error: The DNI can not start with a letter or "0"');
      writeln('');
      Textcolor(white)
    End
  Else If validateTypeDni(dni) = 2 Then
         Begin
           writeln('');
           TextColor(red);
           Write('Error: The DNI must have only numbers');
           writeln('');
           Textcolor(white)
         End
  Else If validateLargeDni(dni) = 1 Then
         Begin
           writeln('');
           TextColor(red);
           Write('Error: The DNI must have 7 or 8 digits');
           writeln('');
           Textcolor(white)
         End
  Else
    Begin
      writeln('');
      TextColor(green);
      Write('The DNI is correct');
      writeln('');
      Textcolor(white)
    End

End;

End.
