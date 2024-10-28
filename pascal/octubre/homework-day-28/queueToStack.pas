
Program queueToStack;

Uses 
stackUnit, queueUnit, sysutils;

Var 
  stack: TStack;
  queue: TQueue;
  i: byte;
Begin
  initStack(stack);
  initQueue(queue);
  For i := 1 To 10 Do
    enqueue(queue, random(100));

  WriteLn('Queue: ');
  showQueue(queue);

  While (Not fullStack(stack)) And (lengthQueue(queue) > 0) Do
    Begin
      pushStack(stack, queue.data[queue.front]);
      dequeue(queue);
    End;

  WriteLn('Stack: ');
  showStack(stack);
End.
