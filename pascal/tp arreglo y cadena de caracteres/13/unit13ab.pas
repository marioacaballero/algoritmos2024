
Unit unit13ab;

Interface

{$unitpath ../}

Uses unitVectorBaseTp;

Procedure addVectors(n, m: integer; v1, v2: vector; Var v: vector);

Implementation

Procedure addVectors(n, m: integer; v1, v2: vector; Var v: vector);

Var 
  i, j, k: integer;
Begin
  k := 0;
  i := 0;
  j := 0;
  While (k < (m + n)) Do
    Begin
      If (i < n) And (j < m) Then
        Begin
          If (v1[i+1] <= v2[j+1]) Then
            Begin
              k := k + 1;
              i := i + 1;
              v[k] := v1[i];
            End
          Else
            Begin
              k := k + 1;
              j := j + 1;
              v[k] := v2[j];
            End;
        End
      Else If (i < n) Then
             Begin
               k := k + 1;
               i := i + 1;
               v[k] := v1[i];
             End
      Else If (j < m) Then
             Begin
               k := k + 1;
               j := j + 1;
               v[k] := v2[j];
             End;
    End;

  show(k, v);
End;


End.
