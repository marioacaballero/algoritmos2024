
Program test;

Uses testFunction;

Var 
  num1, num2: integer;
Begin
  WriteLn('Hello, World!');
  ReadLn(num1);
  ReadLn(num2);
  // suma := num1 + num2;
  WriteLn('La suma de ', num1, ' y ', num2, ' es ', Sumar(num1, num2));
End.
