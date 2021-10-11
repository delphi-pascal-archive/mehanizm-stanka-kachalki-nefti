unit decompsv;
interface
uses math;
 type
  arraytype=array[1..maxint div sizeof(double)] of double;
  function determin(n:integer; var xi):double;
  procedure omwogj(n:word; var ai; var d:double);
  procedure invers(n:integer; var ai);
  procedure invert(n:integer; var ai; var det:double);
      procedure inver1 (n:integer; var ai);
      function _det(n:integer; var ai) : double;
      procedure _y_m(m,q,n :integer; var ai,bi,ci);
      procedure  gauss(u : integer; var ai,yi);
      procedure rpsly(n,m:integer; var ai,bi,ci);
      procedure mpin(n:integer; var ai,bi,xi);
      procedure Hauss(var ai,bi; n,m:integer);
  procedure linsysnm(n,m:word; var ai,bi);
   procedure solve(n:word; var ai,bi,ipvti);
   procedure decomp(n:word; var ai,ipvti,worki; var cond:double);
 implementation
 function indx(n,i,j:integer):integer;
    begin
     indx:=n*pred(i)+j
    end;
  
     function determin(n:integer; var xi):double;
        {вычисление опpедителя, pекуpсив.пpоцессов}
           var
                x: arraytype absolute xi;
                d: double;
                i: integer;
                b: array[1..7] of boolean;
        procedure thread ( p:double;e,i:integer);
            var
                j,f:integer;
          begin if i>n then 
                if odd(e) then d:=d-p else d:=d+p else
                if p <> 0 then
           begin                
                f:=0;
                for j:=n downto 1 do
                if b[j] then f:=f+1 else
           begin  b[j]:=true;
           thread(p*x[i],e+f,i+1);
           b[j]:=false
         end;
       end;
   end;
   begin  for i:=1 to n do b[i]:=false;
           d:=0;
           thread(1,0,1);
           determin:=d
      end;


   procedure omwogj(n:word; var ai; var d:double);
   { Обращение матрицы, вычисление определителя модифицированным
         методом Гаусса-Жордана}
   label 110;
    var
     a:arraytype absolute ai;
     r,b:double;
     i,j,k:word;
     br:array[1..50] of word;
    begin
     d:=1;
     r:=1;
     for i:=1 to n do
      begin
      for j:=i to n do
        if a[indx(n,j,i)]<>0 then goto 110;
       writeln('Матрица вырожденная');
       halt; {Матрица вырожденная}
    110: for k:=1 to n do
          begin
           b:=a[indx(n,i,k)];
           a[indx(n,i,k)]:=a[indx(n,j,k)];
           a[indx(n,j,k)]:=b;
          end;
          br[i]:=j;
          a[indx(n,i,i)]:=1/a[indx(n,i,i)];
        for k:=1 to n do
         if k<>i then a[indx(n,i,k)]:=a[indx(n,i,i)]*a[indx(n,i,k)];
       for j:=1 to n do
        if j<>i then
         begin
          b:=-a[indx(n,j,i)];
          a[indx(n,j,i)]:=0;
          for k:=1 to n do
           a[indx(n,j,k)]:=a[indx(n,j,k)]+b*a[indx(n,i,k)];
        end;
        d:=d/a[indx(n,i,i)];
       end;
       for i:=n downto 1 do
        if br[i]<>i then
         begin
          r:=-r;
          for k:=1 to n do
           begin
            b:=a[indx(n,k,i)];
            a[indx(n,k,i)]:=a[indx(n,k,br[i])];
            a[indx(n,k,br[i])]:=b;
           end;
       end;
      end;
    procedure invers(n:integer; var ai);
    {Обращение симметричной матрицы методом квадратных корней}
     var
      a:arraytype absolute ai;
      y,p:double;
      i,j,k:integer;
      v:array[1..50] of double;
    begin
      for k:=1 to n do
       begin
        if a[1]=0 then halt; {Вырожденная матрица}
         p:=1/a[1];
          for i:=2 to n do v[i-1]:=a[indx(n,1,i)];
          for i:=1 to n-1 do
           begin
            y:=-v[i]*p;
            a[indx(n,i,n)]:=y;
            for j:=i to n-1 do
            a[indx(n,i,j)]:=a[indx(n,i+1,j+1)]+v[j]*y;
           end;
          a[indx(n,n,n)]:=-p;
        end;
       for i:=1 to n do
        for j:=i to n do a[indx(n,i,j)]:=-a[indx(n,i,j)];
    end;
    procedure invert(n:integer; var ai; var det:double);
    {Обращение матрицы методом Гаусса-Жордана}
    var
     a:arraytype absolute ai;
     i,j,k,r,p:integer;
     y,w:real;
     b,c:array[1..50] of double;
     z:array[1..50] of integer;
   begin
     det:=1;
     for j:=1 to n do z[j]:=j;
      for i:=1 to n do
       begin
        k:=i;
        y:=a[indx(n,i,i)];
        r:=i-1; p:=i+1;
        for j:=p to n do
         begin
          w:=a[indx(n,i,j)];
          if abs(w)>abs(y) then
           begin k:=j; y:=w end;
         end;
         det:=y*det;
        if k<>i then det:=-det;
        if abs(y)=0 then halt;{Вырожденная матрица}
        y:=1/y;
        for j:=1 to n do
         begin
          c[j]:=a[indx(n,j,k)];
          a[indx(n,j,k)]:=a[indx(n,j,i)];
          a[indx(n,j,i)]:=-c[j]*y;
          a[indx(n,i,j)]:=a[indx(n,i,j)]*y;
          b[j]:=a[indx(n,i,j)];
        end;
        j:=z[i]; z[i]:=z[k]; z[k]:=j;
        a[indx(n,i,i)]:=y;
        for k:=1 to n do
        for j:=1 to n do
         if (k<>i) and (j<>i) then
         a[indx(n,k,j)]:=a[indx(n,k,j)]-b[j]*c[k];
       end;
       for r:=1 to n do
        begin
         k:=z[r];
         if k<>r then
          begin
           for i:=1 to n do
            begin
             w:=a[indx(n,r,i)];
             a[indx(n,r,i)]:=a[indx(n,k,i)];
             a[indx(n,k,i)]:=w;
            end;
          i:=z[k]; z[k]:=z[r]; z[r]:=i;
          k:=z[r];
        end;
       end;
     end;
    procedure inver1 (n:integer; var ai);
    {упрощенное обрашение матриц а[1..n,1..n]}
    var
      a:arraytype absolute ai;
      g:double;
      i,j,k:integer;
   begin
       for i:=1 to n do
    begin
        if abs(a[indx(n,i,i)])<1.E-20 then halt;
      g:=1/a[indx(n,i,i)];
      a[indx(n,i,i)]:=1;
      for k:=1 to n do
         a[indx(n,i,k)]:=a[indx(n,i,k)]*g;
    for j:=1 to n do
     if i <> j then
        begin
            g:=a[indx(n,j,i)];
            a[indx(n,i,j)]:=0;
            for k:=1 to n do
     a[indx(n,j,k)]:=a[indx(n,j,k)]-g*a[indx(n,i,k)];
      end;
     end;
    end;
    function _det(n:integer; var ai) : double;
      {вычисление определителя}
 var  a : arraytype absolute ai;
      i,j,k :integer;
      t,d,max :double;
  begin   d:=1;
    for  k:=1  to  n  do
    begin  max:=0;
       for  i:=k  to  n  do
         begin
           t:=a[indx(n,i,k)];
           if  abs(t) > abs(max)  then
             begin
               max:=t;
               j:=i;
             end;
         end;
       if  max=0  then  begin _det:=0; exit end;
       if  j<>k  then
         begin   d:=-d;
           for i:=k  to  n  do
           begin  t:=a[indx(n,j,i)];
                  a[indx(n,j,i)]:=a[indx(n,k,i)];
                  a[indx(n,k,i)]:=t;
           end
       end;
     for  i:=k+1  to  n  do
       begin  t:=a[indx(n,i,k)]/max;
             for j:=k+1 to n do
             a[indx(n,i,j)]:=a[indx(n,i,j)]-t*a[indx(n,k,j)];
       end;
        d:=d*a[indx(n,k,k)];
     end;
   _det:=d;
 end;

 procedure _y_m(m,q,n :integer; var ai,bi,ci);
   {умножение прямоугольных матриц}
   var  i,j,k : integer;
        a : arraytype absolute ai;
        b : arraytype absolute bi;
        c : arraytype absolute ci;
        r :double;
 begin
   for  i:=1  to  n  do
     for  k:=1  to  q  do
       for  j:=1  to  m  do
       begin
         r:=a[indx(m,i,j)]*b[indx(q,j,k)];
         if j=1  then  c[indx(q,i,k)]:=r    else
               c[indx(q,i,k)]:=r+c[indx(q,i,k)];
       end
 end;
  procedure  gauss(u : integer; var ai,yi);
  label no0,no1,no2;
  {РЕШЕНИЕ СИСТЕМЫ МЕТОДОМ ГАУССА  A[1..U,1..U+1] -
   РАСШИРЕННАЯ МАТРИЦА  Y[1..U] - ВЕКТОР РЕШЕНИЯ     }

  var  a : arraytype absolute ai;
       y : arraytype absolute yi;
       i,j,k,m,n : integer;
       temp : double;
   begin
     n:=0;
   no0 : n:=n+1;
         for k:=n  to u  do
         if  a[indx(u+1,k,n)] <>0  then  goto no1;
         halt;
    no1 : if k=n  then  goto no2;
          for  m:=n  to  u+1  do
          begin  temp:=a[indx(u+1,n,m)];
          a[indx(u+1,n,m)]:=a[indx(u+1,k,m)];
          a[indx(u+1,k,m)]:=temp;
          end;
    no2 : for j:=u+1 downto  n  do
          a[indx(u+1,n,j)]:=a[indx(u+1,n,j)]/a[indx(u+1,n,n)];
          for i:=k+1  to  u  do
          for  j:=n+1  to  u+1  do
          a[indx(u+1,i,j)]:=a[indx(u+1,i,j)]-
                            -a[indx(u+1,i,n)]*a[indx(u+1,n,j)];
          if n<>u  then  goto no0;
          for  i:=u  downto  1  do
          begin
            y[i]:=a[indx(u+1,i,u+1)]/a[indx(u+1,i,i)];
            for  k:=i-1  downto  1  do
            a[indx(u+1,k,u+1)]:=a[indx(u+1,k,u+1)]-
                               -a[indx(u+1,k,i)]*y[i];
          end
   end ;

  procedure rpsly(n,m:integer; var ai,bi,ci);
   {Решение переопределенной системы уравнений
     A*X=B, n-число неизвестных,m-число уравнений
      A[m,n],B[m],C[n]}
      var i,j,k:integer;
          s,c1:double;
          a:arraytype absolute ai;
          b:arraytype absolute bi;
          c:arraytype absolute ci;
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
    procedure mpin(n:integer; var ai,bi,xi);
     {pешение системы А*х=В методом последовательного исклю-
                       чение неизвестных}
   var
       a: arraytype absolute ai;
       b: arraytype absolute bi;
       x: arraytype absolute xi;
       i,j,k: integer;
       h: double;
   begin
        for i:=1 to n do
        for j:=i+1 to n do
   begin  a[indx(n,j,i)]:=-a[indx(n,j,i)]/a[indx(n,j,i)];
           for k:=i+1 to n do
           a[indx(n,j,k)]:=a[indx(n,j,k)]+a[indx(n,j,i)]*
                         a[indx(n,i,k)];
           b[j]:=b[j]+a[indx(n,j,i)]*b[i]
      end;
         x[n]:=b[n]/a[indx(n,n,n)];
         for i:=n-1 downto 1 do begin h:=b[i];
                 for j:=i+1 to n do
                 h:=h-x[j]*a[indx(n,i,j)];
                 x[i]:=h/a[indx(n,i,i)];
            end;
        end;

    procedure Hauss(var ai,bi; n,m:integer);
    {решение системы лин.ур. по компактной схеме
                     Гаусса [A]x=[B]}
      var
         i,k,l:integer;
         a:arraytype absolute ai;
         b:arraytype absolute bi;
         r1:double;
    begin
       for k:=1 to n do
    begin
       for i:=k to n do
    begin
     r1:=0;
     for l:=1 to k-1 do
       r1:=r1+a[indx(n,i,l)]*a[indx(n,l,k)];
        a[indx(n,i,k)]:=a[indx(n,i,k)]-r1
      end;
        for i:=k+1 to n do
    begin
      r1:=0;
      for l:=1 to k-1 do
       r1:=r1+a[indx(n,k,l)]*a[indx(n,l,i)];
       a[indx(n,k,i)]:=(a[indx(n,k,i)]-r1)/a[indx(n,k,k)]
     end;
      for i:=1 to m do
    begin
      r1:=0;
      for l:=1 to k-1 do
       r1:=r1+a[indx(n,k,l)]*b[indx(n,i,l)];
       b[indx(n,i,k)]:=(b[indx(n,i,k)]-r1)/a[indx(n,k,k)]
     end;
   end;
    for i:=1 to m do
    for k:=n-1 downto 1 do
    begin
      r1:=0;
      for l:=1 to n-k do
       r1:=r1+a[indx(n,k,k+l)]*b[indx(n,i,k+l)];
       b[indx(n,i,k)]:=b[indx(n,i,k)]-r1
     end;
   end;
   procedure linsysnm(n,m:word; var ai,bi);
   {Решение системы линейных уравнений с m правыми частями
               a[n,n]*x[n]=b[m,n], решение засылается в b[m,n]}
   var
     a:arraytype absolute ai;
     b:arraytype absolute bi;
     k,i,j:word;
     s:array[1..50] of double;
     d:double;
    begin
{     omwogj(n,a,d);}
    { invers(n,a);}
    invert(n,a,d);
     for k:=1 to m do
     begin
      for i:=1 to n do
        begin
          s[i]:=0;
          for j:=1 to n do
           s[i]:=s[i]+b[indx(n,k,j)]*a[indx(n,i,j)];
        end;
        for i:=1 to n do
          b[indx(n,k,i)]:=s[i];
        end;
     end;

   procedure solve(n:word; var ai,bi,ipvti);
    var
     a:arraytype absolute ai;
     b:arraytype absolute bi;
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
     a:arraytype absolute ai;
     ipvt:array[1..2] of integer absolute ipvti;
     work:arraytype absolute worki;
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
       end.