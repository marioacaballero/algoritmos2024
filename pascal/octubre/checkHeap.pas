
Program checkHeap;

Uses sysUtils;

Var 
  HeapStatus: THeapStatus;

Begin
  HeapStatus := GetHeapStatus;
  writeln('Tamaño total del heap: ', HeapStatus.TotalAddrSpace, ' bytes');
  writeln('Tamaño del heap libre: ', HeapStatus.TotalFree, ' bytes');
End.
