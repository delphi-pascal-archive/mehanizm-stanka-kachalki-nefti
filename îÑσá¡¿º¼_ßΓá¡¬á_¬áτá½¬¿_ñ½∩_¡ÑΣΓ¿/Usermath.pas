unit UserMath;

interface
uses Uglobal;

const
  SQRT2 = 1.4142135623731;
  SQRTPI = 1.77245385090552;
  TWSQRPI = 1.12837916709551;

var
  NVector:integer;
  _A_:matrix;
  _B_,_B1_,_B2_:vector;
procedure LinearW(N : integer; var A:matrix; var B,X:vector);
function Gauss(X : double) : double;
function DGauss(X : double) : double;
function Erfc(X : double) : double;
function DErfc(X : double) : double;
function Fp(X : double) : double;
function DFp(X : double) : double;
function Tn(x:double; n:byte):double;
   procedure rpsly(n,m:integer; var ai,bi,ci);
   procedure solve(n:word; var ai,bi,ipvti);
   procedure decomp(n:word; var ai,ipvti,worki; var cond:double);
   function interpol_2_3(n1,n2,k:integer; var xi1,yi1; x:extended):extended;

 implementation

const
  ErfP = 0.3275911;
  ErfA : array[1..5] of double =
   ( 0.254829593,
    -0.284496736,
     1.421413741,
    -1.453152027,
     1.061405429 );

 function indx(n,i,j:integer):integer;
    begin
     indx:=n*pred(i)+j
    end;

 // ┬шф яюышэюьр фы  Їюэр
  function Tn(x:double; n:byte):double;
   var i:byte;
       r1,r2,r3:double;
   begin
    r1:=1; Tn:=r1; if n=0 then exit;
    r2:=x; r3:=x;
    if n>1 then
     for i:=2 to n do
      if theb then
       begin r3:=2*x*r2-r1; r1:=r2; r2:=r3 end
       else r3:=r3*x;
    Tn:=r3;
   end;

  (**********************************************)
  (*                                            *)
  (* Решение системы уравнений методом вращений *)
  (*                                            *)
  (**********************************************)
  procedure LinearW(n:integer; var A:matrix; var B,X:vector);
  var
    i,j,k : byte;
    r,m,l   : double;
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

  
  (********************)
  (*                  *)
  (*  Функция Гаусса  *)
  (*                  *)
  (********************)
  function Gauss(X : double) : double;
  begin
    if Abs(X) < 8 then Gauss := Exp(-X*X)
    else Gauss := 0;
  end;

  (********************************)
  (*                              *)
  (*  Производная функции Гаусса  *)
  (*                              *)
  (********************************)
  function DGauss(X : double) : double;
  begin
    if Abs(X) < 8 then DGauss := -2*X*Exp(-X*X)
    else DGauss := 0;
  end;

  (*****************************************)
  (*                                       *)
  (*  Дополнительный интеграл вероятности  *)
  (*                                       *)
  (*****************************************)
  function Erfc(X : double) : double;
  begin
    if X < -8 then
    begin
      Erfc  := 2;
      Exit;
    end;
    if X > 8 then
    begin
      Erfc := 0;
      Exit;
    end;
    Erfc := Exp(-X*X)*Fp(X);
  end;

  (*******************************************************)
  (*                                                     *)
  (*  Производная дополнительного интеграла вероятности  *)
  (*                                                     *)
  (*******************************************************)
  function DErfc(X : double) : double;
  begin
    DErfc := -TWSQRPI*Exp(-X*X);
  end;

  (*****************************)
  (*                           *)
  (*  Вычисление функции F(p)  *)
  (*                           *)
  (*****************************)
  function Fp(X : double) : double;
  var
    I : INTEGER;
    F,Q,T : double;
  begin
    F := 0.0;
    Q := 1.0;
    T := 1/(1+ErfP*Abs(X));
    for I := 1 to 5 do
    begin
      Q := Q*T;
      F := F+ErfA[i]*Q;
    end;
    if X < 0 then Fp := 2*Exp(X*X)-F
    else Fp := F;
  end;

  (******************************)
  (*                            *)
  (*  Производная функции F(p)  *)
  (*                            *)
  (******************************)
  function DFp(X : double) : double;
  begin
    DFp := 2*X*Fp(X)-TWSQRPI;
  end;
  procedure rpsly(n,m:integer; var ai,bi,ci);
   {Решение переопределенной системы уравнений
     A*X=B, n-число неизвестных,m-число уравнений
      A[m,n],B[m],C[n]}
      var i,j,k:integer;
          s,c1:double;
          a:array[1..2] of double absolute ai;
          b:array[1..2] of double absolute bi;
          c:array[1..2] of double absolute ci;
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
          c1:=c1+a[indx(n,i,j)]+b[i];
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
   procedure solve(n:word; var ai,bi,ipvti);
    var
     a:array[1..2] of double absolute ai;
     b:array[1..2] of double absolute bi;
     ipvt:array[1..2] of integer absolute ipvti;
     t:double;
     i,k,m,kb:integer;
     {Решение линейной системы А*Х=D.}
     begin
      if n<>1 then
       begin
        for k:=1 to n-1 do
         begin
          m:=ipvt[k];
          t:=b[m];
          b[m]:=b[k];
          b[k]:=t;
           for i:=k+1 to n do
            b[i]:=b[i]+a[indx(n,i,k)]*t
         end;
         for kb:=1 to n-1 do
          begin
           k:=n-kb+1;
           b[k]:=b[k]/a[indx(n,k,k)];
           t:=-b[k];
           for i:= 1 to n-kb do
            b[i]:=b[i]+a[indx(n,i,k)]*t
          end;
        end;
       b[1]:=b[1]/a[1]
     end;
     {-----------------------}
   procedure decomp(n:word; var ai,ipvti,worki; var cond:double);
       var
     a:array[1..2] of double absolute ai;
     ipvt:array[1..2] of integer absolute ipvti;
     work:array[1..2] of double absolute worki;
     ek,t,anorm,ynorm,znorm:double;
     i,j,k,m,kb:integer;
      begin
       cond:=1.0e+32;
       ipvt[n]:=1;
       if n=1 then
        begin
         if a[1]<>0 then cond:=1;
         exit
        end;
        anorm:=0;
        for j:=1 to n do
         begin
          t:=0;
           for i:=1 to n do t:=t+abs(a[indx(n,i,j)]);
           if t>anorm then anorm:=t
         end;
         for k:=1 to n-1 do
          begin
           m:=k;
            for i:=k+1 to n do
             if abs(a[indx(n,i,k)])>abs(a[indx(n,m,k)]) then m:=1;
            ipvt[k]:=m;
            if m<>k then ipvt[n]:=-ipvt[n];
            t:=a[indx(n,m,k)];
            a[indx(n,m,k)]:=a[indx(n,k,k)];
            a[indx(n,k,k)]:=t;
            if t<>0 then
             begin
              for i:=k+1 to n do
               a[indx(n,i,k)]:=-a[indx(n,i,k)]/t;
              for j:=k+1 to n do
               begin
                t:=a[indx(n,m,j)];
                a[indx(n,m,j)]:=a[indx(n,k,j)];
                a[indx(n,k,j)]:=t;
                if t<>0 then
                 for i:=k+1 to n do
                  a[indx(n,i,j)]:=a[indx(n,i,j)]+a[indx(n,i,k)]*t
               end
             end
          end;
          for k:=1 to n do
           begin
            t:=0;
             if k<>1 then
              for i:=1 to k-1 do
               t:=t+a[indx(n,i,k)]*work[i];
             ek:=1;
             if t<0 then ek:=-1;
             if a[indx(n,k,k)]=0 then exit;
             work[k]:=-(ek+t)/a[indx(n,k,k)]
          end;
          for kb:=1 to n-1 do
           begin
            k:=n-kb;
             t:=0;
             for i:=k+1 to n do
              t:=t+a[indx(n,i,k)]*work[k];
             work[k]:=t;
             m:=ipvt[k];
             if m<>k then
              begin
               t:=work[m];
               work[m]:=work[k];
               work[k]:=t
              end
            end;
            ynorm:=0;
            for i:=1 to n do
             ynorm:=ynorm+abs(work[i]);
            solve(n,a,work,ipvt);
            znorm:=0;
            for i:=1 to n do
            znorm:=znorm+abs(work[i]);
            cond:=anorm*znorm/ynorm;
            if cond<1 then cond:=1
          end;

 //шэЄхЁяюы Ўш  яю 2 ш 3 Єюўърь
 function interpol_2_3(n1,n2,k:integer; var xi1,yi1; x:extended):extended;
 var
  xi:array[1..2] of extended absolute xi1;
  yi:array[1..2] of extended absolute yi1;
  x0,y0:array[1..3] of extended;
   i,j:integer;
   r,a,b,c:extended;
 begin
   for i:=n1 to n2 do
    if xi[i]>=x then
    begin
     j:=i;
     break;
    end;
    if x=xi[j] then
    begin
     result:=yi[j];
     exit;
    end;
    // яю фтєь Єюўърь
  if k=2 then
  begin
   if (j>n1) and (j<n2) then
    j:=j-1
   else
   if j=n2 then
    j:=n2-1;
  end;
    // яю ЄЁхь Єюўърь
  if k=3 then
  begin
   if j<n1+2 then j:=n1
   else
   if j>n2-2 then j:=n2-2
    else
     if abs(x-xi[j-1])<abs(x-xi[j]) then dec(j);
  end;
   for i:=1 to k do
    begin
    x0[i]:=xi[j-2+i];
    y0[i]:=yi[j-2+i];
    end;
   r:=(y0[2]-y0[1])/(x0[2]-x0[1]);
   if k=2 then
    result:=y0[1]+r*(x-x0[1])
   else
    begin
     a:=((y0[3]-y0[2])/(x0[3]-x0[2])-r)/(x0[3]-x0[1]);
     b:=r-a*(x0[2]+x0[1]);
     c:=y0[2]-x0[2]*(a*x0[2]+b);
     result:=x*(a*x+b)+c;
    end;
 end;

end.
