
Unit queueUnit;

Interface

Const 
  maxQ = 10;

Type 
  TQueue = Record
    data: array[1..maxQ] Of Integer;
    front, rear: Integer;
  End;

Procedure initQueue(Var queue: TQueue);
Procedure enqueue(Var queue: TQueue; element: Integer);
Procedure dequeue(Var queue: TQueue);
Function lengthQueue(queue: TQueue): Integer;
Function fullQueue(queue: TQueue): boolean;
Procedure showQueue(queue: TQueue);

Implementation

Procedure initQueue(Var queue: TQueue);
Begin
  queue.front := 1;
  queue.rear := 0;
End;

Function emptyQueue(queue: TQueue): boolean;
Begin
  emptyQueue := queue.rear < queue.front;
End;

Function fullQueue(queue: TQueue): boolean;
Begin
  fullQueue := queue.rear = maxQ;
End;

Procedure enqueue(Var queue: TQueue; element: Integer);
Begin
  If Not fullQueue(queue) Then
    Begin
      queue.rear := queue.rear + 1;
      queue.data[queue.rear] := element;
    End
  Else
    WriteLn('Error: Queue full');
End;

Procedure dequeue(Var queue: TQueue);
Begin
  If Not emptyQueue(queue) Then
    Begin
      // dequeue := queue.data[queue.front];
      queue.front := queue.front + 1;
    End
  Else
    Begin
      WriteLn('Error: Queue empty');
      // dequeue := -1;
    End;
End;

Function lengthQueue(queue: TQueue): Integer;
Begin
  lengthQueue := queue.rear - queue.front + 1;
End;

Procedure showQueue(queue: TQueue);

Var i: byte;
Begin
  For i := queue.front To queue.rear Do
    Write(queue.data[i], ' ');
  WriteLn;
End;

End.
