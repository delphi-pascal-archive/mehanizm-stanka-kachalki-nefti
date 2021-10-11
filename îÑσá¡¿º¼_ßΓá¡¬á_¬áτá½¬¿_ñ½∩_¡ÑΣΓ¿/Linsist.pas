unit Linsist;

interface
 type
  arraytype=array[1..(maxint) div sizeof(double)] of double;
// procedure rpsly(n,m:integer; var ai,bi,ci);
  procedure rpsly(n,m:integer; var ai,bi,ci:array of double);
//procedure LinearW(n:integer; var Ai; var Bi,Xi);
//procedure LinearW(n:integer; var A:array of double; var B,X:array of double);
procedure Linear_G(nf:integer; var A,B,X:array of double);

implementation
 function indx(n,i,j:integer):integer;
    begin
     indx:=n*pred(i)+j
    end;

procedure Linear_G(nf:integer; var A,B,X:array of double);
var i,j,k:integer;
begin
    for i:=0 to nf-2 do
       begin
	 for j:=i+1 to nf-1 do
	    begin
	      A[nf*j+i]:=-A[nf*j+i]/A[nf*i+i];
	      for k:=i+1 to nf-1 do
		   A[nf*j+k]:=A[nf*j+k]+A[nf*j+i]*A[nf*i+k];
	      B[j]:=B[j]+A[nf*j+i]*B[i];
	    end;
       end;
////////////////////////////////////
    X[nf-1]:=B[nf-1]/A[nf*nf-1];
//
    for i:=nf-2 downto 0 do
       begin
	 for j:=i+1 to nf-1 do
	     B[i]:=B[i]-A[nf*i+j]*X[j];
	 X[i]:=B[i]/A[nf*i+i];
       end;
//
  end;
{
procedure LinearW(n:integer; var A:array of double; var B,X:array of double);
  var
    i,j,k : byte;
    r,m,l   : double;
//    A:array[1..1,1..1] of double absolute Ai;
 //   B:array[1..1] of double absolute Bi;
 //   X:array[1..1] of double absolute Xi;
  begin
    for i := 1 to n-1 do
    begin
      for j := i+1 to n do
      begin
        if (A[i,i]=0) and (A[j,i]=0) then
        begin m:=1; l:=0; end
        else
        begin
        m:=sqrt(sqr(A[i,i])+sqr(A[j,i]));
        l:=-A[j,i]/m;
        m:=A[i,i]/m;
        end;
        for k := 1 to n do
         begin
          r:=m*A[i,k]-l*A[j,k];
          A[j,k] := l*A[i,k]+m*A[j,k];
          A[i,k]:=r;
         end;
         r:=m*B[i]-l*B[j];
        B[j] := l*B[i]+m*B[j];
        B[i] :=r;
      end;
    end;
    for i := n downto 1 do
    begin     m:=0;
      if i<>n then
      for j := 0 to n-i-1 do
       m:=m+X[n-j]*A[i,n-j];
        X[i] := (B[i]-m)/A[i,i];
    end;
  end;
}
  procedure rpsly(n,m:integer; var ai,bi,ci:array of double);
   {Решение переопределенной системы уравнений
     A*X=B, n-число неизвестных,m-число уравнений
      A[m,n],B[m],C[n]}
      var i,j,k:integer;
          s,c1:double;
          a:array[1..20] of double absolute ai;
          b:array[1..20] of double absolute bi;
          c:array[1..20] of double absolute ci;
      begin
       for j:=1 to n do
        begin
         for k:=j to n do
          begin
           s:=0;
           for i:=1 to m do
            s:=s+a[indx(n,i,j)]*a[indx(n,i,k)];
           c[k]:=s
          end;
         c1:=0;
         for i:=1 to m do
          c1:=c1+a[indx(n,i,j)]*b[i];
         for i:=j to n do a[indx(n,i,j)]:=c[i];
         c[j]:=c1
        end;
        a[indx(n,1,1)]:=sqrt(a[indx(n,1,1)]);
        for j:=2 to n do
         a[indx(n,1,j)]:=a[indx(n,j,1)]/a[indx(n,1,1)];
        for i:=2 to n do
         begin
          s:=0;
           for k:=1 to i-1 do
            s:=s+sqr(a[indx(n,k,i)]);
           a[indx(n,i,i)]:=sqrt(a[indx(n,i,i)]-s);
           for j:=i+1 to n do
            begin
             s:=0;
             for k:=1 to i-1 do
              s:=s+a[indx(n,k,i)]*a[indx(n,k,j)];
             a[indx(n,i,j)]:=(a[indx(n,j,i)]-s)/a[indx(n,i,i)];
            end
           end;
          c[1]:=c[1]/a[indx(n,1,1)];
          for i:=2 to n do
           begin s:=0;
            for k:=1 to i-1 do
             s:=s+a[indx(n,k,i)]*c[k];
            c[i]:=(c[i]-s)/a[indx(n,i,i)]
           end;
          c[n]:=c[n]/a[indx(n,n,n)];
          for i:=n-1 downto 1 do
           begin s:=0;
            for k:=i+1 to n do
             s:=s+a[indx(n,i,k)]*c[k];
            c[i]:=(c[i]-s)/a[indx(n,i,i)]
           end;
       end;

end.
