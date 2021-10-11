UNIT min_f;

INTERFACE
uses uglobal,usermath;
const
        metod:byte=2;  Iter:integer=0;
           //x_1=20; x_2=63; y_1=8; y_2=15;
type tfun=function(var c:vector):double;
     Tfun_G=Procedure(var x:vector; var F:double; var F1:vector);
      funtype=function(x:double):double;
     Tfun1=function(c0,c1:double; n:integer; var c:vector):boolean;
 var
 flc:array[1..52] of boolean;
 Imax:word;
 Dmax:double;
 K_:vector;
procedure MNK(N:integer; var x,y; M:integer; var a);
function pol_M(M:integer; var a; x:double):double;
procedure minscs(n:integer; h0,e:double; var c:vector; fun:tfun);
procedure minhm(var x:vector; nx:integer; e,h:double; sumr:tfun);
procedure minkie(var x:vector;n:integer; e,h0:double; f:tfun; Fogr:TFun1);
procedure minkie1(var x:vector; n:integer; e:double; var hh:vector; f:tfun; fogr:Tfun1);
function find_sol(a,b,h:double; fun:funtype; var x1,x2:double):boolean;
function zeroin(ax,bx:double; f:funtype; tol:double):double;
procedure Min_Grad(var x:vector; n:integer; e,h0:double; f:Tfun; fogr:Tfun1);
procedure Min_Grad1(var x:vector; n:integer; e,h0:double; f:Tfun_G; fogr:Tfun1);

 implementation
uses math;
 function zeroin(ax,bx:double; f:funtype; tol:double):double;
  var
   a,b,c,d,e,eps,fa,fb,fc,tol1,xm,p,q,r,s:double;
  label 30,70;
   begin
    eps:=1; while 1+eps/2<>1 do eps:=eps/2;
    a:=ax; b:=bx; fa:=f(a); fb:=f(b);
    repeat
     c:=a; fc:=fa;
     d:=b-a; e:=d;
   30:
     if abs(fc)<abs(fb) then
      begin
       a:=b; b:=c; c:=a;
       fa:=fb; fb:=fc; fc:=fa;
     end;
     tol1:=2*eps*abs(b)+tol/2;
     xm:=(c-b)/2;
     if (abs(xm)<=tol1) or (fb=0) then
      begin
       zeroin:=b; exit
     end;
     if (abs(e)<tol1) or (abs(fa)<=abs(fb)) then goto 70
      else
       begin
        if a=c then
         begin
          s:=fb/fa;
          p:=2*xm*s;
          q:=1-s
         end
         else
          begin
           q:=fa/fc;
           r:=fb/fc;
           s:=fb/fa;
           p:=s*(2*xm*q*(q-r)-(b-a)*(r-1));
           q:=(q-1)*(r-1)*(s-1)
          end;
         if p>0 then q:=-q;
         p:=abs(p)
        end;
        if (2*p<3*xm*q-abs(tol1)*q) and (p<abs(e*q/2)) then
         begin
          e:=d; d:=p/q
         end
         else
         begin
       70: d:=xm; e:=d
         end;
          a:=b;
          fa:=fb;
          if abs(d)>tol1 then b:=b+d
           else
            if xm<0 then b:=b-abs(tol1)
             else b:=b+abs(tol1);
          fb:=f(b);
          if fb*(fc/abs(fc))<=0 then goto 30
        until false
      end;

      function find_sol(a,b,h:double; fun:funtype; var x1,x2:double):boolean;
      begin
       find_sol:=false;
       x2:=a;
       while x2<=b do
        begin
        x1:=x2;
        x2:=x2+h;
        if fun(x1)*fun(x2)<=0 then
         begin find_sol:=true; exit end;
        end;
      end;

   procedure minhm(var x:vector; nx:integer; e,h:double; sumr:tfun);
     { Метод Нелдера-Мида  }
     label 28,11,13,17,16,14,26;
      const
       alfa=1.0;
       beta=0.5;
       gama=2.0;
      var
          vn,step1,step2,difer,xnx,sumh,suml,sum2,sums,step:double;
          i,j,k1,k2,k3,k4,index,kount:integer;

      begin
        step:=h;
        difer:=0;
        xnx:=nx;
        _B_[1]:=sumr(x);
        k1:=nx+1;
        k2:=nx+2;
        k3:=nx+3;
        k4:=nx+4;
        vn:=nx;
           step1:=step/(vn*sqrt(2.0))*(sqrt(vn+1.0)+vn-1.0);
           step2:=step/(vn*sqrt(2.0))*(sqrt(vn+1.0)-1.0);
           for j:=1 to nx do _A_[1,j]:=0.;
           for i:=2 to k1 do
            begin
             for j:=1 to nx do
               _A_[i,j]:=step2;
               _A_[i-1,i]:=step1;
            end;
           for i:=1 to k1 do
            for j:=1 to nx do
             _A_[i,j]:=x[j]+_A_[i,j];

        for i:=1 to k1 do
         begin
          for j:=1 to nx do x[j]:=_A_[i,j];
          _B_[i]:=sumr(x);
         end;
     28: sumh:=_B_[1];
         index:=1;
         for i:=2 to k1 do
          begin
            if _B_[i]<=sumh then continue;
            sumh:=_B_[i];
            index:=i;
          end;
         suml:=_B_[1];
         kount:=1;
         for i:=2 to k1 do
          begin
           if suml<=_B_[i] then continue;
           suml:=_B_[i];
           kount:=i;
          end;
         for j:=1 to nx do
          begin
           sum2:=0.0;
           for i:=1 to k1 do
            sum2:=sum2+_A_[i,j];
            _A_[k2,j]:=1.0/xnx*(sum2-_A_[index,j]);
            _A_[k3,j]:=(1.0+alfa)*_A_[k2,j]-alfa*_A_[index,j];
            x[j]:=_A_[k3,j];
          end;
          _B_[k3]:=sumr(x);
          if _B_[k3]<suml then goto 11;
          if index=1 then sums:=_B_[2] else sums:=_B_[1];
          for i:=1 to k1 do
           if (index<>1) and (_B_[i]>sums) then sums:=_B_[i];
          if _B_[k3]>sums then goto 13 else goto 14;
       11: for j:=1 to nx do
            begin
             _A_[k4,j]:=(1-gama)*_A_[k2,j]+gama*_A_[k3,j];
             x[j]:=_A_[k4,j];
            end;
           _B_[k4]:=sumr(x);
           if _B_[k4]<suml then goto 16 else goto 14;
       13: if _B_[k3]>sumh then goto 17;
           for j:=1 to nx do
            _A_[index,j]:=_A_[k3,j];
       17: for j:=1 to nx do
            begin
             _A_[k4,j]:=beta*_A_[index,j]+(1.0-beta)*_A_[k2,j];
             x[j]:=_A_[k4,j];
            end;
          _B_[k4]:=sumr(x);
          if sumh>_B_[k4] then goto 16;
          for j:=1 to nx do
           for i:=1 to k1 do
            _A_[i,j]:=0.5*(_A_[i,j]+_A_[kount,j]);
          for i:=1 to k1 do
           begin
            for j:=1 to nx do
             x[j]:=_A_[i,j];
             _B_[i]:=sumr(x);
           end;
           goto 26;
       16: for j:=1 to nx do
            begin
             _A_[index,j]:=_A_[k4,j];
             x[j]:=_A_[index,j];
            end;
            _B_[index]:=sumr(x);
            goto 26;
       14: for j:=1 to nx do
            begin
             _A_[index,j]:=_A_[k3,j];
             x[j]:=_A_[index,j];
            end;
            _B_[index]:=sumr(x);
       26: for j:=1 to nx do
             x[j]:=_A_[k2,j];
            _B_[k2]:=sumr(x);
            difer:=0.;
            for i:=1 to k1 do
             difer:=difer+sqr(_B_[i]-_B_[k2]);
            difer:=1./xnx*sqrt(difer);
            if difer>=e then goto 28;
     end;

//вычисление полинома
function pol_M(M:integer; var a; x:double):double;
var
   a1:array[1..2] of double absolute a;
   s:double;
   i:byte;
 begin
  s:=0;
  for i:=M+1 downto 2 do
   s:=(s+a1[i])*x;
  pol_M:=s+a1[1];
 end;

procedure MNK(N:integer; var x,y; M:integer; var a);
{Аппроксимация полиномом y=a0+a1*x+a2*x^2+...+aM*x^M по методу MNK}
 const  metod_MNK=1;
 var
  x1:array[1..2] of double absolute x;
  y2:array[1..2] of double absolute y;
  a1:array[1..2] of double absolute a;
  b:array of double;
  c:array of double;
  am:array of array of double;
  y1:array of double;
  i,j,k,m0:integer;
  f,c1:double;
   begin
   //распределение памяти
    m0:=M+1;
    Setlength(y1,N+1);
    Setlength(b,m0+1);
    Setlength(c,2*m0+3);
    Setlength(am,m0+1);
    for i:=0 to m0 do
     Setlength(am[i],m0+1);

    for i:=1 to N do
    y1[i]:=y2[i];
    for i:=1 to m0 do
     b[i]:=0;
    for i:=1 to 2*m0-1 do
     c[i]:=0;
    for i:=1 to N do
     begin
      f:=1;
      for j:=1 to 2*m0-1 do
       begin
        if j<=m0 then
         begin b[j]:=b[j]+y1[i]; y1[i]:=y1[i]*x1[i]; end;
        c[j]:=c[j]+f;
        f:=f*x1[i]
       end;
     end;
     for i:=1 to m0 do
      begin
       k:=i;
       for j:=1 to m0 do
       begin
        am[i,j]:=c[k];
        k:=k+1;
       end;
      end;
     //решение системы методом Гаусса
 if Metod_MNK=1 then
  begin
     for i:=1 to m0-1 do
      for j:=i+1 to m0 do
       begin
        am[j,i]:=-am[j,i]/am[i,i];
         for k:=i+1 to m0 do
          am[j,k]:=am[j,k]+am[j,i]*am[i,k];
        b[j]:=b[j]+am[j,i]*b[i];
       end;
     a1[m0]:=b[m0]/am[m0,m0];
     for i:=m0-1 downto 1 do
      begin
       f:=b[i];
       for j:=i+1 to m0 do
        f:=f-a1[j]*am[i,j];
       a1[i]:=f/am[i,i];
      end;
   end;
  //решение системы методом квадратных корней
 if Metod_MNK=2 then
  begin
     for j:=1 to m0 do
     begin
      for k:=j to m0 do
       begin  f:=0;
       for i:=1 to m0 do
        f:=f+am[i,j]*am[i,k];
       a1[k]:=f;
       end;//k
       c1:=0;
         for i:=1 to m0 do
          c1:=c1+am[i,j]*b[i];
     for i:=j to m0 do
      am[i,j]:=a1[i];
     a1[j]:=c1;
   end; //j
   am[1,1]:=sqrt(am[1,1]);
   for j:=2 to m0 do
    am[1,j]:=am[j,1]/am[1,1];
   for i:=2 to m0 do
    begin
     f:=0;
     for k:=1 to i-1 do
      f:=f+am[k,i]*am[k,i];
     am[i,i]:=sqrt(am[i,i]-f);
     for j:=i+1 to m0 do
      begin
       f:=0;
       for k:=1 to i-1 do
        f:=f+am[k,i]*am[k,j];
        am[i,j]:=(am[j,i]-f)/am[i,i];
      end;//j
    end;//i
   a1[1]:=a1[1]/am[1,1];
   for i:=2 to m0 do
    begin
     f:=0;
     for k:=1 to i-1 do
      f:=f+am[k,i]*a1[k];
     a1[i]:=(a1[i]-f)/am[i,i];
    end;//i
   a1[m0]:=a1[m0]/am[m0,m0];
   for i:=m0-1 downto 1 do
    begin
     f:=0;
      for k:=i+1 to m0 do
       f:=f+am[i,k]*a1[k];
      a1[i]:=(a1[i]-f)/am[i,i];
    end;//i
  end;

   //освобождение памяти
    y1:=nil;
    b:=nil;
    c:=nil;
    am:=nil;
   end;

   //Минимизация по методу спирального координатного спуска
          procedure minscs(n:integer; h0,e:double; var c:vector; fun:tfun);
            label 0,1;
             var b,cc,ff:double;
                 h,hh:vector;
                 i,j,pr,k:integer;
                 it:integer;
               begin
                 pr:=0;
                 it:=0;
                 for i:=1 to n do
                 if flc[i] then
                 begin
                  if h0>=0 then
                  begin
                   h[i]:=h0;
                   if h[i]=0 then h[i]:=h0;
                  end
                  else h[i]:=abs(h0)*0.01*abs(c[i]);
                 end;
                 hh:=h;
              0: for i:=1 to n do
                  begin
                    if (flc[i]=false) then continue;
                    b:=1.e38;
                    j:=0;
                  1:
                     c[i]:=c[i]+h[i];
                     cc:=b;
                     ff:=fun(c);
                     b:=ff;
                     if (pr=0)  and (b<4) then
                      begin
                       pr:=1;
                       for k:=1 to n do  h[k]:=hh[k];
                      end;
                     j:=j+1;
                     if j=3 then
                     begin
                       h[i]:=h[i]*2; j:=0;
                       {if h[i]>1 then h[i]:=1;}
                     end;
               //      if abs(ff-cc)<1.0e-7 then continue;
                     if ff<cc then goto 1;
                  h[i]:=-h[i]/2;
                  end; //i
                  if Iter<>0 then begin it:=it+1; if it>Iter then exit; end;
                  for i:=1 to n do
                  if flc[i] then
                  if (abs(h[i])>e/5) or (abs(h[i])>=hh[i]) then goto 0;
               end;
    procedure minkie(var x:vector; n:integer; e,h0:double; f:tfun; fogr:Tfun1);
     {  ¬Ё­Ё¬Ё§ жЁп дг­ЄжЁЁ ¬Ґв®¤®¬ Єў ¤а вЁз­®© Ё­вҐаЇ®«пжЁЁ
                 Ё нЄбва Ї®«пжЁЁ }
       label 1;
       const dx=2;
       var s,i,it:integer;
           z,v,w,u,t,ff,q:double;
           hh:vector;
     procedure minf;
     begin
      if min(u,w)=w then
      if min(v,w)=w then x[i]:=z-hh[i] else x[i]:=z;
     end;
       begin
            it:=0;v:=0.0;
            for i:=1 to n do
             if flc[i] then
              begin
               if h0>0 then hh[i]:=h0
                else hh[i]:=abs(x[i])*0.01*abs(h0);
              end;
         1: s:=0; ff:=v;
            for i:=1 to n do
             if flc[i] then
              begin
                 z:=x[i];
                 v:=f(x);
                 x[i]:=z-hh[i]; w:=f(x);
                 x[i]:=z+hh[i]; u:=f(x);
                 t:=w*(2*z+hh[i])-4*v*z+u*(2*z-hh[i]);
                 q:=w-2*v+u;
                 if q>1.0e-6 then
                 t:=t/q/2 else begin minf; continue; end;
                 if abs(t-z)>e then s:=1;
                 if FOgr(z,t,i,x) then x[i]:=t
                 else minf;
              end;
              it:=it+1;
              if (iter<>0) and (v>=ff) then
               for i:=1 to n do if flc[i] then hh[i]:=hh[i]/dx;
              if (iter<>0) and (it>=Iter) then exit;
              if s<>0 then goto 1;
       end;
    procedure minkie1(var x:vector; n:integer; e:double; var hh:vector; f:tfun; fogr:Tfun1);
     {  ¬Ё­Ё¬Ё§ жЁп дг­ЄжЁЁ ¬Ґв®¤®¬ Єў ¤а вЁз­®© Ё­вҐаЇ®«пжЁЁ
                 Ё нЄбва Ї®«пжЁЁ }
       label 1;
       const dx=2;
       var s,i,it:integer;
           z,v,w,u,t,ff,q:double;
     procedure minf;
     begin
      if min(u,w)=w then
      if min(v,w)=w then x[i]:=z-hh[i] else x[i]:=z;
     end;
       begin
            it:=0;v:=0.0;
         1: s:=0; ff:=v;
            for i:=1 to n do
             if flc[i] then
              begin
                 z:=x[i];
                 v:=f(x);
                 x[i]:=z-hh[i]; w:=f(x);
                 x[i]:=z+hh[i]; u:=f(x);
                 t:=w*(2*z+hh[i])-4*v*z+u*(2*z-hh[i]);
                 q:=w-2*v+u;
                 if q>1.0e-6 then
                 t:=t/q/2 else begin minf; continue; end;
                 if abs(t-z)>e then s:=1;
                 if FOgr(z,t,i,x) then x[i]:=t
                 else minf;
              end;
              it:=it+1;
              if (iter<>0) and (v>=ff) then
               for i:=1 to n do if flc[i] then hh[i]:=hh[i]/dx;
              if (iter<>0) and (it>=Iter) then exit;
              if s<>0 then goto 1;
       end;
//метод градиентов
procedure Min_Grad(var x:vector; n:integer; e,h0:double; f:Tfun; fogr:Tfun1);
label M;
var i,it,s:integer;
    rf1,t,rr:vector;
    r,r1,z,rf,ff1,ff2:double;
begin
 it:=0;
 M:
 s:=0;
 inc(it);
 rf:=f(x);
 if h0<>0 then
  begin
   for i:=1 to n do
    t[i]:=x[i];
   for i:=1 to n do
    if flc[i] then
    begin
     r:=t[i];
     t[i]:=r+h0;
     ff1:=f(t);
     t[i]:=r-h0;
     ff2:=f(t);
     rf1[i]:=(ff1-ff2)/2/h0;
     t[i]:=r;
    end;
  end;
 r:=0;
 for i:=1 to n do
  if not flc[i] then continue
  else
  r:=r+sqr(rf1[i]);
  if r<e/5 then exit;
 for i:=1 to n do
  if not flc[i] then continue
  else
  begin
   z:=x[i];
   r1:=rf1[i]*rf/r;
   if abs(r1)>e then s:=1;
   x[i]:=x[i]-r1;
   if not FOgr(z,x[i],i,t) then x[i]:=t[i];
  end;
  if (iter<>0) and (it>=Iter) then exit;
  if s<>0 then goto M;
end;
procedure Min_Grad1(var x:vector; n:integer; e,h0:double; f:Tfun_G; fogr:Tfun1);
label M;
var i,it,s:integer;
    rf1,t,rr:vector;
    r,r1,z,rf,ff1,ff2:double;
begin
 it:=0;
 M:
 s:=0;
 inc(it);
 f(x,rf,rr);
 if h0<>0 then
  begin
   for i:=1 to n do
    t[i]:=x[i];
   for i:=1 to n do
    if flc[i] then
    begin
     r:=t[i];
     t[i]:=r+h0;
     f(t,ff1,rr);
     t[i]:=r-h0;
     f(t,ff2,rr);
     rf1[i]:=(ff1-ff2)/2/h0;
     t[i]:=r;
    end;
  end;
 r:=0;
 for i:=1 to n do
  if not flc[i] then continue
  else
  r:=r+sqr(rf1[i]);
  if r<e/5 then exit;
 for i:=1 to n do
  if not flc[i] then continue
  else
  begin
   z:=x[i];
   r1:=rf1[i]*rf/r;
   if abs(r1)>e then s:=1;
   x[i]:=x[i]-r1;
   if not FOgr(z,x[i],i,t) then x[i]:=t[i];
  end;
  if (iter<>0) and (it>=Iter) then exit;
  if s<>0 then goto M;
end;
END.
