
Unit stackUnit;

Interface

Const 
  maxS = 10;

Type 
  TStack = Record
    data: array[1..maxS] Of Integer;
    top: Integer;
  End;

Procedure initStack(Var stack: TStack);
Procedure pushStack(Var stack: TStack; element: Integer);
Procedure popStack(Var stack: TStack);
Function emptyStack(stack: TStack): boolean;
Procedure showStack(stack: TStack);
Function fullStack(stack: TStack): boolean;

Implementation

Procedure initStack(Var stack: TStack);
Begin
  stack.top := 0;
End;

Function emptyStack(stack: TStack): boolean;
Begin
  emptyStack := stack.top = 0;
End;

Function fullStack(stack: TStack): boolean;
Begin
  fullStack := stack.top = maxS;
End;

Procedure pushStack(Var stack: TStack; element: Integer);
Begin
  If stack.top < maxS Then
    Begin
      stack.top := stack.top + 1;
      stack.data[stack.top] := element;
    End
  Else
    WriteLn('Error: Stack full');
End;

Procedure popStack(Var stack: TStack);
Begin
  If Not emptyStack(stack) Then
    stack.top := stack.top - 1
  Else
    WriteLn('Error: Stack empty');
End;

Function lengthStack(stack: TStack): Integer;
Begin
  lengthStack := stack.top;
End;

Procedure showStack(stack: TStack);

Var 
  i: byte;
Begin
  For i := 1 To stack.top Do
    Write(stack.data[i], ' ');
  WriteLn;
End;

End.
