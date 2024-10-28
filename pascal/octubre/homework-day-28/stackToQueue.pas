
Program stackToQueue;

Uses 
stackUnit, queueUnit, sysutils;

Var 
  stack: TStack;
  queue: TQueue;
  i: byte;
Begin
  randomize;
  initStack(stack);
  initQueue(queue);
  For i := 1 To 10 Do
    pushStack(stack, random(100));

  WriteLn('Stack: ');
  showStack(stack);

  While (Not emptyStack(stack)) And (Not fullQueue(queue)) Do
    Begin
      enqueue(queue, stack.data[stack.top]);
      popStack(stack);
    End;

  WriteLn('Queue: ');
  showQueue(queue);
End.
