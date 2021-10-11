unit cingras2;
interface
uses math;
 type
      wpara=array[1..6] of double;
      fxaw=array[1..3] of double;
      cint=record
       x,y,x1,y1,x11,y11:double;
       end;
      cins=record
      f,f1,f11:double;
      end;
      funtype=function(x:double):double;

   var n:cint;
       YesMex:boolean;
function _4W(pr:integer; xa,ya,xd,yd,a,b,c,alf:double;
              var gam,bet:double):boolean;

procedure cindt(a:cint; fi:cins; lac,alf:double; var c:cint);
procedure cinm1w(x0,y0,lab,f1:double; var b:cint);
procedure cinm1p(xq,yq,alf,s:double; var a:cint);
procedure f_cint(x,y,x1,y1,x11,y11:double; var a:cint);
procedure f_cins(f,f1,f11:double; var fi:cins);
procedure gr_www(nsb:byte; m,k:cint; li,lj:double; var fi,fj:cins);
procedure gr_wwp(nsb:byte; m,q:cint; fk:cins; li,lj,alf:double; var fi,lk:cins);
procedure gr_wpw(nsb:byte; m,k:cint; lj,alf:double; var fi,li:cins);
procedure gr_pwp(q,p:cint; fm,fk:cins; li,lj,alf,bet:double; var lm,lk:cins);
procedure gr_wpp(m,q:cint; fk:cins; lj,alf,bet:double; var li,lk:cins);

procedure zaswp_(x,y,ax,ay,wx,wy:double; var wp:wpara);
procedure zasfx_(x,ax,wx:double; var fx:fxaw);
procedure ozaswp_(var wp:wpara; var x,y,ax,ay,wx,wy:double);
procedure ozasfx_(var fx:fxaw; var x,ax,wx:double);
procedure km1(xo,yo,r,f1:double;
	var xa,ya,axa,aya,wxa,wya:double); overload;
procedure km1(xo,yo,r,f1:double;
	var a:wpara); overload;
procedure kdt(xm,ym,axm,aym,wxm,wym,msi,gsi,fi,afi,wfi:double;
		var xsi,ysi,axsi,aysi,wxsi,wysi:double); overload;
procedure kdt(var m:wpara;msi,gsi:double; var fi:fxaw;
		var si:wpara); overload;
procedure kg1(xm,ym,xn,yn,axm,aym,axn,ayn,
		wxm,wym,wxn,wyn,li,lj:double;
		var fi,fj,afi,afj,wfi,wfj,mj:double); overload;
procedure kg1(var m,n:wpara; li,lj:double;
		var fi,fj:wpara; var mj:double); overload;
procedure pkt(xm,ym,axm,aym,wxm,wym,ksi,aksi,wksi:double;
		var xm2,ym2,axm2,aym2,wxm2,wym2:double); overload;
procedure pkt(var m:wpara; var ksi:fxaw;
		var m2:wpara); overload;
procedure kg2(xm,ym,axm,aym,wxm,wym,xf,yf,
			axf,ayf,wxf,wyf,ksi,aksi,wksi,
			lli,lj,fj2:double;
      var fi2,afi,wfi,xn2,axn2,wxn2,mj:double); overload;
procedure kg2(var m,f:wpara; var ksi:fxaw; lli,lj,fj2:double;
		var fi2:fxaw; var xn2:fxaw; var mj:double); overload;
procedure kg3(xm,ym,axm,aym,wxm,wym,xn,yn,
		axn,ayn,wxn,wyn,mt:double;
		var fk,lk,afk,alk,wfk,wlk:double); overload;
procedure kg3(var m,n:wpara; mt:double;
		var fk,lk:fxaw);  overload;
procedure kg4(xe,ye,xf,yf,axe,aye,axf,ayf,
			wxe,wye,wxf,wyf,ksi,aksi,wksi,
			ksj,aksj,wksj,ali,alj,li,lj:double;
		var lki,lkj,alki,alkj,wlki,wlkj,
		xd,yd,axd,ayd,wxd,wyd:double); overload;
procedure kg4(var e,f:wpara; var ksi,ksj:fxaw; ali,alj,li,lj:double;
		var lki,lkj:fxaw; var d:wpara); overload;
procedure kg4u(xm,ym,xe,ye,axm,aym,axe,aye,
		wxm,wym,wxe,wye,fk,afk,wfk,
		ksi,aksi,wksi:double;
    var lk,alk,wlk,xn2,axn2,wxn2:double); overload;
procedure kg4u(var m,e:wpara; var fk,ksi:fxaw;
	  var lk,xn2:fxaw); overload;
procedure kg5(xf,yf,xm,ym,axf,ayf,axm,aym,
		wxf,wyf,wxm,wym,ksi,aksi,wksi,
		lj,ali,alj:double;
	   var lxn,lki,alxn,alki,wlxn,wlki,
		xn2,axn2,wxn2:double); overload;
procedure kg5(var f,m:wpara; var ksi:fxaw; lj,ali,alj:double;
	   var lxn,lki,xn2:fxaw); overload;

  procedure sincos2(a:double; var s,c:double);
  procedure AsBcC(a,b,c:double; var f1,f2:double);
  procedure ABCD_(a,b,c,d:double; var a1,a2:double); overload;
  procedure ABCD_(a,b,c,d:double; var a1,a2,b1,b2:double); overload;
  procedure mpi1(wes,eps:double; fun:funtype; var x:double);


implementation

  procedure mpi1(wes,eps:double; fun:funtype; var x:double);
    {Решение нелинейного уpавнения методом пpостых итеpаций}
    var wes1,f:double;
     begin
       f:=1;
       if wes=0 then wes1:=-eps/(fun(x+eps)-fun(x)) else wes1:=wes;
       while abs(f)>eps do
       begin
       f:=fun(x);
        x:=x+f*wes1
       end;
     end;

  procedure AsBcC(a,b,c:double; var f1,f2:double);
  {Решение уpавнения вида A*sin(f)+B*cos(f)+C=0}
   var d:double;
   begin
    YesMex:=false;
    d:=a*a+b*b-c*c;
    if d<0 then exit;
    YesMex:=true;
    d:=sqrt(d);
    f1:=arctan2(b*d-a*c,-a*d-b*c);
    f2:=arctan2(-b*d-a*c,a*d-b*c);
  end;
  procedure ABCD_(a,b,c,d:double; var a1,a2:double);
  {Решение системы вида A*cos(a)+B*cos(b)=C
                        A*sin(a)+B*sin(b)=D
   Для получения b1 и b2 пpи обpащении нужно поменть
   местами a и b}
   begin
   AsBcC(d,c,(b*b-c*c-d*d-a*a)/2/a,a1,a2);
   end;
  procedure ABCD_(a,b,c,d:double; var a1,a2,b1,b2:double);
  {Решение системы вида A*cos(a)+B*cos(b)=C
                        A*sin(a)+B*sin(b)=D
  }
  var si,co:extended;
   begin
   AsBcC(d,c,(b*b-c*c-d*d-a*a)/2/a,a1,a2);
   sincos(a1,si,co);
   b1:=arctan2( a*si-d,a*co-c);
   sincos(a2,si,co);
   b2:=arctan2( a*si-d,a*co-c);
   end;


procedure sincos2(a:double; var s,c:double);
var si,co:extended;
begin
sincos(a,si,co);
s:=si;
c:=co;
end;


function _4W(pr:integer; xa,ya,xd,yd,a,b,c,alf:double;
              var gam,bet:double):boolean;
  var a1,b1,r:double;
   function gam_bet(b0,c0:double):double;
    var p,r1:double;
    begin
    p:=(r+sqr(c0)-sqr(b0))/2/c0;
    r1:=r-sqr(p);
    gam_bet:=2*arctan2(b1+pr*sqrt(r1),a1-p);
    end;
   begin
    _4W:=false;
    a1:=xd-xa-a*cos(alf);
    b1:=yd-ya-a*sin(alf);
    r:=sqr(a1)+sqr(b1);
    if (r>sqr(b+c)) or (r<sqr(b-c)) then exit;
    _4W:=true;
    gam:=gam_bet(b,c);
    bet:=gam_bet(c,-b);
   end;

procedure cindt(a:cint; fi:cins; lac,alf:double; var c:cint);
 var s1,c1:extended;
  begin
  sincos(fi.f+alf,s1,c1);
   c.x:=a.x+lac*c1;
   c.y:=a.y+lac*s1;
   c.x1:=a.x1-lac*s1*fi.f1;
   c.y1:=a.y1+lac*c1*fi.f1;
   c.x11:=a.x11-lac*c1*sqr(fi.f1)-lac*s1*fi.f11;
    c.y11:=a.y11-lac*s1*sqr(fi.f1)+lac*c1*fi.f11;
  end;
 procedure cinm1w(x0,y0,lab,f1:double; var b:cint);
  var s,c:extended;
   begin
    sincos(f1,s,c);
    b.x:=x0+lab*c;
    b.y:=y0+lab*s;
    b.x1:=-lab*s; b.y1:=lab*c;
    b.x11:=-b.y1; b.y11:=b.x1;
   end;
procedure cinm1p(xq,yq,alf,s:double; var a:cint);
 begin
  a.x11:=0; a.y11:=0;
  sincos2(alf,a.y1,a.x1);
  a.x:=xq+s*a.x1;
  a.y:=yq+s*a.y1;
 end;
procedure f_cint(x,y,x1,y1,x11,y11:double; var a:cint);
 begin
  a.x:=x; a.y:=y;
  a.x1:=x1; a.y1:=y1;
  a.x11:=x11; a.y11:=y11;
 end;
procedure f_cins(f,f1,f11:double; var fi:cins);
 begin
  fi.f:=f; fi.f1:=f1; fi.f11:=f11
 end;
procedure gr_www(nsb:byte; m,k:cint; li,lj:double; var fi,fj:cins);
 var s,c,s1,c1,r,ax,ay:double;
  begin
   s:=2*(m.y-k.y)*li;
   c:=2*(m.x-k.x)*li;
   s1:=sqr(li)-sqr(lj)+sqr(m.x-k.x)+sqr(m.y-k.y);
   asbcc(s,c,s1,c1,r);
   if nsb=1 then fi.f:=c1 else fi.f:=r;
   sincos2(fi.f,s,c);
   n.x:=m.x+li*c;
   n.y:=m.y+li*s;
   fj.f:=arctan2(m.y-k.y+li*s,m.x-k.x+li*c);
   sincos2(fj.f,s1,c1);
   r:=sin(fi.f-fj.f);
   fi.f1:=((m.x1-k.x1)*c1+(m.y1-k.y1)*s1)/r/li;
   fj.f1:=((m.x1-k.x1)*c+(m.y1-k.y1)*s)/r/lj;
   n.x1:=m.x1-li*s*fi.f1;
   n.y1:=m.y1+li*c*fi.f1;
   ax:=m.x11-k.x11-li*c*sqr(fi.f1)+lj*c1*sqr(fj.f1);
   ay:=m.y11-k.y11-li*s*sqr(fi.f1)+lj*s1*sqr(fj.f1);
   fi.f11:=(ax*c1+ay*s1)/r/li;
   fj.f11:=(ax*c+ay*s)/r/lj;
   n.x11:=m.x11-li*c*sqr(fi.f1)-li*s*fi.f11;
   n.y11:=m.y11-li*s*sqr(fi.f1)+li*c*fi.f11;
  end;
procedure gr_wwp(nsb:byte; m,q:cint; fk:cins; li,lj,alf:double; var fi,lk:cins);
 var s,c,s1,c1,s2,c2,r,ax,ay:double;
  begin
  sincos2(fk.f,s,c);
  r:=(m.x-q.x)*s-(m.y-q.y)*c+lj*sin(alf);
  asbcc(-li*c,li*s,r,ax,ay);
  if nsb=1 then fi.f:=ax else fi.f:=ay;
  sincos2(fi.f,s1,c1);
   n.x:=m.x+li*c1;
   n.y:=m.y+li*s1;
  sincos2(fk.f+alf,s2,c2);
  lk.f:=(m.y-q.y+li*s1-lj*s2)/s;
  ax:=m.x1-q.x1+fk.f1*(lk.f*s+lj*s2);
  ay:=m.y1-q.y1-fk.f1*(lk.f*c+lj*c2);
  r:=cos(fi.f-fk.f);
  fi.f1:=(ax*s-ay*c)/li/r;
  lk.f1:=(ax*c1+ay*s1)/r;
   n.x1:=m.x1-li*s1*fi.f1;
   n.y1:=m.y1+li*c1*fi.f1;
  ax:=m.x11-q.x11-li*c1*sqr(fi.f1)+fk.f11*(lk.f*s+lj*s2)+
  sqr(fk.f1)*(lk.f*c+lj*c2)+2*lk.f1*fk.f1*s;
  ay:=m.y11-q.y11-li*s1*sqr(fi.f1)-fk.f11*(lk.f*c+lj*c2)+
  sqr(fk.f1)*(lk.f*s+lj*s2)-2*lk.f1*fk.f1*c;
  fi.f11:=(ax*s-ay*c)/li/r;
  lk.f11:=(ax*c1+ay*s1)/r;
   n.x11:=m.x11-li*c1*sqr(fi.f1)-li*s1*fi.f11;
   n.y11:=m.y11-li*s1*sqr(fi.f1)+li*c1*fi.f11;
 end;
procedure gr_wpw(nsb:byte; m,k:cint; lj,alf:double; var fi,li:cins);
 var s1,c1,s2,c2,ax,ay,r:double;
  begin
  asbcc(m.x-k.x,k.y-m.y,lj*sin(alf),ax,ay);
  if nsb=1 then fi.f:=ax else fi.f:=ay;
  sincos2(fi.f,s1,c1);
  sincos2(fi.f+alf,s2,c2);
   n.x:=k.x+lj*c2;
   n.y:=k.y+lj*s2;
  li.f:=(k.x-m.x+lj*c2)/c1;
  fi.f1:=((m.x1-k.x1)*s1-(m.y1-k.y1)*c1)/(li.f-lj*cos(alf));
   n.x1:=k.x1-lj*s2*fi.f1;
   n.y1:=k.y1+lj*c2*fi.f1;
  li.f1:=(k.y1-m.y1+fi.f1*(lj*s2-li.f*s1))/s1;
  ax:=m.x11-k.x11-2*li.f1*s1*fi.f1+lj*c2*sqr(fi.f1);
  ay:=m.y11-k.y11+2*li.f1*c1*fi.f1+lj*s2*sqr(fi.f1);
  r:=(li.f*s1-lj*s2)*s1-(lj*c2-li.f*c1)*c1;
  fi.f11:=(ax*s1-ay*c1)/r;
  li.f11:=(ax*(lj*c2-li.f*c1)-ay*(li.f*s1-lj*s2))/r;
   n.x11:=k.x11-lj*c2*sqr(fi.f1)-lj*s2*fi.f11;
   n.y11:=k.y11-lj*s2*sqr(fi.f1)+lj*c2*fi.f11;
 end;
procedure gr_pwp(q,p:cint; fm,fk:cins; li,lj,alf,bet:double; var lm,lk:cins);
  var r,r1,r2,r3,r4,s,c,s1,c1,vx,vy:double;
 begin
  r:=sin(fk.f-fm.f);
  sincos2(fk.f,s,c);
  sincos2(fm.f,s1,c1);
  r1:=(p.x-q.x)*s-(p.y-q.y)*c-li*sin(fk.f-fm.f+alf)-lj*sin(bet);
  lm.f:=r1/r;
  r1:=(p.x-q.x)*s1-(p.y-q.y)*c1+lj*sin(fk.f-fm.f+bet)+li*sin(alf);
  lk.f:=r1/r;
  r1:=lm.f*s1+li*sin(fm.f-alf);
  r2:=lk.f*s+lj*sin(fk.f+bet);
  r4:=lk.f*c+lj*cos(fk.f+bet);
  r3:=lm.f*c1+li*cos(fm.f-alf);
  vx:=p.x1-q.x1+r1*fm.f1-r2*fk.f1;
  vy:=p.y1-q.y1-r3*fm.f1+r4*fk.f1;
  lm.f1:=(vx*s-vy*c)/r;
  lk.f1:=(vx*s1-vy*c1)/r;
  vx:=p.x11-q.x11+r3*sqr(fm.f1)+r1*fm.f11+2*lm.f1*fm.f1*s1-
      r4*sqr(fk.f1)-r2*fk.f11-2*lk.f1*fk.f1*s;
  vy:=p.y11-q.y11+r1*sqr(fm.f1)-r3*fm.f11-2*lm.f1*fm.f1*c1-
      r2*sqr(fk.f1)+r4*fk.f11+2*lk.f1*fk.f1*c;
  lm.f11:=(vx*s-vy*c)/r;
  lk.f11:=(vx*s1-vy*c1)/r;
 end;
procedure gr_wpp(m,q:cint; fk:cins; lj,alf,bet:double; var li,lk:cins);
  var s,c,s1,c1,r,r1:double;
  begin
   sincos2(fk.f,s,c);
   sincos2(fk.f+bet-alf,s1,c1);
   r:=sin(bet-alf);
   r1:=lj*sin(alf);
   li.f:=((m.x-q.x)*s-(m.y-q.y)*c+r1)/r;
   lk.f:=((m.x-q.x)*s1-(m.y-q.y)*c1+r1)/r;
   r1:=((m.x-q.x)*c+(m.y-q.y)*s)*fk.f1;
   li.f1:=((m.x1-q.x1)*s-(m.y1-q.y1)*c+r1)/r;
   r1:=((m.x-q.x)*c1-(m.y-q.y)*s1)*fk.f1;
   lk.f1:=((m.x1-q.x1)*s1-(m.y1-q.y1)*c1+r1)/r;
   r1:=2*((m.x1-q.x1)*c+(m.y1-q.y1)*s)*fk.f1+
       sqr(fk.f1)*((m.y-q.y)*c-(m.x-q.x)*s)+
       fk.f11*((m.x-q.x)*c+(m.y-q.y)*s);
   li.f11:=((m.x11-q.x11)*s-(m.y11-q.y11)*c+r1)/r;
   r1:=2*((m.x1-q.x1)*c1+(m.y1-q.y1)*s1)*fk.f1+
       sqr(fk.f1)*((m.y-q.y)*c1-(m.x-q.x)*s1)+
       fk.f11*((m.x-q.x)*c1+(m.y-q.y)*s1);
   lk.f11:=((m.x11-q.x11)*s1-(m.y11-q.y11)*c1+r1)/r;
 end;
procedure zaswp_(x,y,ax,ay,wx,wy:double; var wp:wpara);
 begin
  wp[1]:=x; wp[2]:=y;
  wp[3]:=ax; wp[4]:=ay;
  wp[5]:=wx; wp[6]:=wy
 end;
procedure zasfx_(x,ax,wx:double; var fx:fxaw);
 begin
  fx[1]:=x; fx[2]:=ax; fx[3]:=wx
 end;
procedure ozaswp_(var wp:wpara; var x,y,ax,ay,wx,wy:double);
 begin
  x:=wp[1]; y:=wp[2];
  ax:=wp[3]; ay:=wp[4];
  wx:=wp[5]; wy:=wp[6]
 end;
procedure ozasfx_(var fx:fxaw; var x,ax,wx:double);
 begin
  x:=fx[1]; ax:=fx[2]; wx:=fx[3]
 end;
{-----------------------------}
procedure km1(xo,yo,r,f1:double;
	var xa,ya,axa,aya,wxa,wya:double);
  	var s,c:double;
   begin
	sincos2(f1,s,c);
xa:=r*c+xo;
ya:=r*s+yo;
axa:=-r*s;
aya:=r*c;
wxa:=-aya;
wya:=axa;
end;
procedure km1(xo,yo,r,f1:double;
	var a:wpara);
	var s,c:double;
   begin
	sincos2(f1,s,c);
a[1]:=r*c+xo;
a[2]:=r*s+yo;
a[3]:=-r*s;
a[4]:=r*c;
a[5]:=-a[4];
a[6]:=a[3];
end;
{-----------------------------}
procedure kdt(xm,ym,axm,aym,wxm,wym,msi,gsi,fi,afi,wfi:double;
		var xsi,ysi,axsi,aysi,wxsi,wysi:double);
var s,c:double;
begin
	sincos2(fi+gsi,s,c);
	xsi:=xm+msi*c;
        ysi:=ym+msi*s;
	axsi:=axm-msi*afi*s;
	aysi:=aym+msi*afi*c;
	wxsi:=wxm-msi*wfi*s-msi*afi*afi*c;
	wysi:=wym+msi*wfi*c-msi*afi*afi*s;
	end;
procedure kdt(var m:wpara;msi,gsi:double; var fi:fxaw;
		var si:wpara);
var s,c:double;
begin
	sincos2(fi[1]+gsi,s,c);
	si[1]:=m[1]+msi*c;
        si[2]:=m[2]+msi*s;
	si[3]:=m[3]-msi*fi[2]*s;
	si[4]:=m[4]+msi*fi[2]*c;
	si[5]:=m[5]-msi*fi[3]*s-msi*fi[2]*fi[2]*c;
	si[6]:=m[6]+msi*fi[3]*c-msi*fi[2]*fi[2]*s;
	end;
	{-----------------------------------}
procedure kg1(xm,ym,xn,yn,axm,aym,axn,ayn,
		wxm,wym,wxn,wyn,li,lj:double;
		var fi,fj,afi,afj,wfi,wfj,mj:double);
	var s,c,s1,c1,s2,c2:double;
      begin
	s:=hypot(xn-xm,yn-ym);
	c:=arctan2(yn-ym,xn-xm);
	mj:=arccos((li*li+lj*lj-s*s)/(2*li*lj));
	s1:=arccos((li*li+s*s-lj*lj)/(2*li*s));
	fi:=c+s1;
	fj:=c+s1+mj;
	sincos2(fi,s,c);
	sincos2(fj,s1,c1);
	sincos2(fi-fj,s2,c2);
	afi:=((axm-axn)*c1+(aym-ayn)*s1)/(li*s2);
	afj:=((axm-axn)*c+(aym-ayn)*s)/(lj*s2);
	wfi:=((wxm-wxn)*c1+(wym-wyn)*s1-
	       li*afi*afi*c2+lj*afj*afj)/(li*s2);
	wfj:=((wxm-wxn)*c+(wym-wyn)*s+
	       lj*afj*afj*c2-li*afi*afi)/(lj*s2)
      end;
procedure kg1(var m,n:wpara; li,lj:double;
		var fi,fj:wpara; var mj:double);
	var s,c,s1,c1,s2,c2:double;
      begin
	s:=sqrt(sqr(n[1]-m[1])+sqr(n[2]-m[2]));
	c:=arctan2(n[2]-m[2],n[1]-m[1]);
	mj:=arccos((li*li+lj*lj-s*s)/(2*li*lj));
	s1:=arccos((li*li+s*s-lj*lj)/(2*li*s));
	fi[1]:=c+s1;
	fj[1]:=c+s1+mj;
	sincos2(fi[1],s,c);
	sincos2(fj[1],s1,c1);
	sincos2(fi[1]-fj[1],s2,c2);
	fi[2]:=((m[3]-n[3])*c1+(m[4]-n[4])*s1)/(li*s2);
	fj[2]:=((m[3]-n[3])*c+(m[4]-n[4])*s)/(lj*s2);
	fi[3]:=((m[5]-n[5])*c1+(m[6]-n[6])*s1-
	       li*fi[2]*fi[2]*c2+lj*fj[2]*fj[2])/(li*s2);
	fj[3]:=((m[5]-n[5])*c+(m[6]-n[6])*s+
	       lj*fj[2]*fj[2]*c2-li*fi[2]*fi[2])/(lj*s2)
      end;
	{---------------------------------------}
procedure pkt(xm,ym,axm,aym,wxm,wym,ksi,aksi,wksi:double;
		var xm2,ym2,axm2,aym2,wxm2,wym2:double);
	var s, c:double;
	begin
	sincos2(ksi,s,c);
	xm2:=xm*c+ym*s;
	ym2:=ym*c-xm*s;
	axm2:=axm*c-xm*aksi*s+aym*s+ym*aksi*c;
	aym2:=aym*c-ym*aksi*s-axm*s-xm*aksi*c;
	wxm2:=wxm*c-2*axm*aksi*s-xm*wksi*s;
        wxm2:=wxm2-xm*sqr(aksi)*c+wym*s+2*aym*aksi*c;
        wxm2:=wxm2+ym*wksi*c-ym*sqr(aksi)*s;
	wym2:=wym*c-2*aym*aksi*s-ym*wksi*s;
        wym2:=wym2-ym*sqr(aksi)*c-wxm*s-2*axm*aksi*c;
        wym2:=wym2-xm*wksi*c+xm*sqr(aksi)*s
	end;
procedure pkt(var m:wpara; var ksi:fxaw;
		var m2:wpara);
	var s, c:double;
	begin
	sincos2(ksi[1],s,c);
	m2[1]:=m[1]*c+m[2]*s;
	m2[2]:=m[2]*c-m[1]*s;
	m2[3]:=m[3]*c-m[1]*ksi[2]*s+m[4]*s+m[2]*ksi[2]*c;
	m2[4]:=m[4]*c-m[2]*ksi[2]*s-m[3]*s-m[1]*ksi[2]*c;
	m2[5]:=m[5]*c-2*m[3]*ksi[2]*s-m[1]*ksi[3]*s;
        m2[5]:=m2[5]-m[1]*sqr(ksi[2])*c+m[6]*s+2*m[4]*ksi[2]*c;
        m2[5]:=m2[5]+m[2]*ksi[3]*c-m[2]*sqr(ksi[2])*s;
	m2[6]:=m[6]*c-2*m[4]*ksi[2]*s-m[2]*ksi[3]*s;
        m2[6]:=m2[6]-m[2]*sqr(ksi[2])*c-m[5]*s-2*m[3]*ksi[2]*c;
        m2[6]:=m2[6]-m[1]*ksi[3]*c+m[1]*sqr(ksi[2])*s
	end;
{--------------------------------}
procedure kg2(xm,ym,axm,aym,wxm,wym,xf,yf,
			axf,ayf,wxf,wyf,ksi,aksi,wksi,
			lli,lj,fj2:double;
		var fi2,afi,wfi,xn2,axn2,wxn2,mj:double);
	var s,c,s1,c1,xm2,ym2,axm2,aym2,wxm2,wym2:double;
            li,xf2,yf2,axf2,ayf2,wxf2,wyf2:double;
    begin
        li:=abs(lli);
	pkt(xm,ym,axm,aym,wxm,wym,ksi,aksi,wksi,
		xm2,ym2,axm2,aym2,wxm2,wym2);
	pkt(xf,yf,axf,ayf,wxf,wyf,ksi,aksi,wksi,
		xf2,yf2,axf2,ayf2,wxf2,wyf2);
	sincos2(fj2,s1,c1);
	fi2:=arcsin((yf2-ym2+lj*s1)/li);
        if lli<0 then fi2:=pi-fi2;
        sincos2(fi2,s,c);
	xn2:=xm2+li*c-lj*c1;
	s1:=(ayf2-aym2)/(li*c);
	afi:=s1+aksi;
	axn2:=axm2-li*s1*s;
	c1:=(wyf2-wym2+li*s1*s1*s)/(li*c);
	wfi:=c1+wksi;
	wxn2:=wxm2-li*c1*s-li*c1*c1*c;
	mj:=pi/2-abs(fi2)
	end;
procedure kg2(var m,f:wpara; var ksi:fxaw; lli,lj,fj2:double;
		var fi2:fxaw; var xn2:fxaw; var mj:double);
	var s,c,s1,c1,li:double;
            m2,f2:wpara;
    begin
        li:=abs(lli);
	pkt(m,ksi,m2);
	pkt(f,ksi,f2);
	sincos2(fj2,s1,c1);
	fi2[1]:=arcsin((f2[2]-m2[2]+lj*s1)/li);
        if lli<0 then fi2[1]:=pi-fi2[1];
        sincos2(fi2[1],s,c);
	xn2[1]:=m2[1]+li*c-lj*c1;
	s1:=(f2[4]-m2[4])/(li*c);
	fi2[2]:=s1+ksi[2];
	xn2[2]:=m2[3]-li*s1*s;
	c1:=(f2[6]-m2[6]+li*s1*s1*s)/(li*c);
	fi2[3]:=c1+ksi[3];
	xn2[3]:=m2[5]-li*c1*s-li*c1*c1*c;
	mj:=pi/2-abs(fi2[1])
	end;
	{---------------------------------}
procedure kg3(xm,ym,axm,aym,wxm,wym,xn,yn,
		axn,ayn,wxn,wyn,mt:double;
		var fk,lk,afk,alk,wfk,wlk:double);
	var s,c:double;
     begin
	s:=sqrt(sqr(xn-xm)+sqr(yn-ym));
	c:=arctan2(yn-ym,xn-xm);
	lk:=sqrt(s*s-mt*mt);
	fk:=c-arctan(mt/lk);
	sincos2(fk,s,c);
	afk:=((axm-axn)*s+(ayn-aym)*c)/lk;
	alk:=(axn-axm)*c+(ayn-aym)*s+mt*afk;
	wfk:=((wyn-wym)*c+(wxm-wxn)*s+mt*sqr(afk)-
		2*alk*afk)/lk;
	wlk:=(wxn-wxm)*c+(wyn-wym)*s+mt*wfk+lk*sqr(afk)
    end;
procedure kg3(var m,n:wpara; mt:double;
		var fk,lk:fxaw);
	var s,c:double;
     begin
	s:=sqrt(sqr(n[1]-m[1])+sqr(n[2]-m[2]));
	c:=arctan2(n[2]-m[2],n[1]-m[1]);
	lk[1]:=sqrt(s*s-mt*mt);
	fk[1]:=c-arctan(mt/lk[1]);
	sincos2(fk[1],s,c);
	fk[2]:=((m[3]-n[3])*s+(n[4]-m[4])*c)/lk[1];
	lk[2]:=(n[3]-m[3])*c+(n[4]-m[4])*s+mt*fk[2];
	fk[3]:=((n[6]-m[6])*c+(m[5]-n[5])*s+mt*sqr(fk[2])-
		2*lk[2]*fk[2])/lk[1];
	lk[3]:=(n[5]-m[5])*c+(n[6]-m[6])*s+mt*fk[3]+lk[1]*sqr(fk[2])
    end;
{-----------------------------------}
procedure kg4(xe,ye,xf,yf,axe,aye,axf,ayf,
			wxe,wye,wxf,wyf,ksi,aksi,wksi,
			ksj,aksj,wksj,ali,alj,li,lj:double;
		var lki,lkj,alki,alkj,wlki,wlkj,
		xd,yd,axd,ayd,wxd,wyd:double);
	var s,c,s1,c1,s2,c2,s3,c3,s4,c4:double;
			s5,c5,s6,c6:double;
        begin
	sincos2(ksi,s,c);
	sincos2(ksj,s1,c1);
	sincos2(ksi-ksj,s2,c2);  sincos2(ali,s5,c5);
	sincos2(ali+ksi-ksj,s3,c3);  sincos2(alj,s6,c6);
	sincos2(alj+ksj-ksi,s4,c4);
	lki:=((xe-xf)*s1+(yf-ye)*c1-li*s3+lj*s6)/s2;
	lkj:=((xe-xf)*s+(yf-ye)*c-li*s5+lj*s4)/s2;
	alki:=((axe-axf)*s1+(ayf-aye)*c1-lki*aksi*c2-
	li*aksi*c3+lkj*aksj+lj*aksj*c6)/s2;
  alkj:=((axe-axf)*s+(ayf-aye)*c-lki*aksi-
	li*aksi*c5+lkj*aksj*c2+lj*aksj*c4)/s2;
  wlki:=((wxe-wxf)*s1+(wyf-wye)*c1-2*alki*aksi*c2-
	lki*wksi*c2+lki*sqr(aksi)*s2-li*wksi*c3+
	li*sqr(aksi)*s3+2*alkj*aksj+lkj*wksj+
	lj*wksj*c6-lj*aksj*aksj*s6)/s2;
  wlkj:=((wxe-wxf)*S+(wyf-wye)*c-2*alki*aksi-lki*wksi-
	li*c5+li*sqr(aksi)*s5+2*alkj*aksj*c2+lkj*wksj*c2+
	lkj*sqr(aksj)*s2+lj*wksj*c4-lj*sqr(aksj)*s4)/s2;
	sincos2(ksi+ali,s3,c3);
	xd:=xe+lki*c+li*c3;
	yd:=ye+lki*s+li*s3;
       axd:=axe+alki*c-lki*aksi*s-li*aksi*s3;
       ayd:=aye+alki*s+lki*aksi*c+li*aksi*c3;
       wxd:=wxe+wlki*c-2*alki*aksi*s-lki*wksi*s-
  	lki*sqr(aksi)*c-li*wksi*s3-li*sqr(aksi)*c3;
       wyd:=wye+wlki*s+2*alki*aksi*c+lki*wksi*c-
	lki*sqr(aksi)*s+li*wksi*c3-li*sqr(aksi)*s3;
  end;
procedure kg4(var e,f:wpara; var ksi,ksj:fxaw; ali,alj,li,lj:double;
		var lki,lkj:fxaw; var d:wpara);
	var s,c,s1,c1,s2,c2,s3,c3,s4,c4:double;
			s5,c5,s6,c6:double;
        begin
	sincos2(ksi[1],s,c);
	sincos2(ksj[1],s1,c1);
	sincos2(ksi[1]-ksj[1],s2,c2);  sincos2(ali,s5,c5);
	sincos2(ali+ksi[1]-ksj[1],s3,c3);  sincos2(alj,s6,c6);
	sincos2(alj+ksj[1]-ksi[1],s4,c4);
	lki[1]:=((e[1]-f[1])*s1+(f[2]-e[2])*c1-li*s3+lj*s6)/s2;
	lkj[1]:=((e[1]-f[1])*s+(f[2]-e[2])*c-li*s5+lj*s4)/s2;
	lki[2]:=((e[3]-f[3])*s1+(f[4]-e[4])*c1-lki[1]*ksi[2]*c2-
	li*ksi[2]*c3+lkj[1]*ksj[2]+lj*ksj[2]*c6)/s2;
       lkj[2]:=((e[3]-f[3])*s+(f[4]-e[4])*c-lki[1]*ksi[2]-
	li*ksi[2]*c5+lkj[1]*ksj[2]*c2+lj*ksj[2]*c4)/s2;
       lki[3]:=((e[5]-f[5])*s1+(f[6]-e[6])*c1-2*lki[2]*ksi[2]*c2-
	lki[1]*ksi[3]*c2+lki[1]*sqr(ksi[2])*s2-li*ksi[3]*c3+
	li*sqr(ksi[2])*s3+2*lkj[2]*ksj[2]+lkj[1]*ksj[3]+
	lj*ksj[3]*c6-lj*ksj[2]*ksj[2]*s6)/s2;
       lkj[3]:=((e[5]-f[5])*S+(f[6]-e[6])*c-2*lki[2]*ksi[2]-lki[1]*ksi[3]-
	li*c5+li*sqr(ksi[2])*s5+2*lkj[2]*ksj[2]*c2+lkj[1]*ksj[3]*c2+
	lkj[1]*sqr(ksj[2])*s2+lj*ksj[3]*c4-lj*sqr(ksj[2])*s4)/s2;
	sincos2(ksi[1]+ali,s3,c3);
	d[1]:=e[1]+lki[1]*c+li*c3;
	d[2]:=e[2]+lki[1]*s+li*s3;
        d[3]:=e[3]+lki[2]*c-lki[1]*ksi[2]*s-li*ksi[2]*s3;
        d[4]:=e[4]+lki[2]*s+lki[1]*ksi[2]*c+li*ksi[2]*c3;
         d[5]:=e[5]+lki[3]*c-2*lki[2]*ksi[2]*s-lki[1]*ksi[3]*s-
  	lki[1]*sqr(ksi[2])*c-li*ksi[3]*s3-li*sqr(ksi[2])*c3;
        d[6]:=e[6]+lki[3]*s+2*lki[2]*ksi[2]*c+lki[1]*ksi[3]*c-
	lki[1]*sqr(ksi[2])*s+li*ksi[3]*c3-li*sqr(ksi[2])*s3;
  end;
{---------------------------------}
procedure kg4u(xm,ym,xe,ye,axm,aym,axe,aye,
		wxm,wym,wxe,wye,fk,afk,wfk,
		ksi,aksi,wksi:double;
	  var lk,alk,wlk,xn2,axn2,wxn2:double);
     var s,c,a2,w2,xm2,axm2,wxm2,ym2,aym2,wym2:double;
         xe2,ye2,axe2,aye2,wxe2,wye2:double;
begin
  pkt(xm,ym,axm,aym,wxm,wym,ksi,aksi,wksi,
	xm2,ym2,axm2,aym2,wxm2,wym2);
  pkt(xe,ye,axe,aye,wxe,wye,ksi,aksi,wksi,
	xe2,ye2,axe2,aye2,wxe2,wye2);
	sincos2(fk-ksi,s,c);
	a2:=afk-aksi;  w2:=wfk-wksi;
	lk:=(ye2-ym2)/s;
	xn2:=xm2+lk*c;
	alk:=(aye2-aym2-lk*a2*c)/s;
	axn2:=axm2+alk*c-lk*a2*s;
	wlk:=(wye2-wym2-2*alk*a2*c-lk*w2*c+
    		lk*a2*a2*s)/s;
	wxn2:=wxm2+wlk*c-2*alk*a2*s-lk*w2*s-
    		lk*a2*a2*c;
end;
procedure kg4u(var m,e:wpara; var fk,ksi:fxaw;
	  var lk,xn2:fxaw);
     var s,c,a2,w2:double;
         m2,e2:wpara;
begin
  pkt(m,ksi,m2);
  pkt(e,ksi,e2);
	sincos2(fk[1]-ksi[1],s,c);
	a2:=fk[2]-ksi[2];  w2:=fk[3]-ksi[3];
	lk[1]:=(e2[2]-m2[2])/s;
	xn2[1]:=m2[1]+lk[1]*c;
	lk[2]:=(e2[4]-m2[4]-lk[1]*a2*c)/s;
	xn2[2]:=m2[3]+lk[2]*c-lk[1]*a2*s;
	lk[3]:=(e2[6]-m2[6]-2*lk[2]*a2*c-lk[1]*w2*c+
    		lk[1]*a2*a2*s)/s;
	xn2[3]:=m2[5]+lk[3]*c-2*lk[2]*a2*s-lk[1]*w2*s-
    		lk[1]*a2*a2*c;
end;
	{---------------------------------}
procedure kg5(xf,yf,xm,ym,axf,ayf,axm,aym,
		wxf,wyf,wxm,wym,ksi,aksi,wksi,
		lj,ali,alj:double;
	   var lxn,lki,alxn,alki,wlxn,wlki,
		xn2,axn2,wxn2:double);
	var s,c,xm2,ym2,axm2,aym2,wxm2,wym2:double;
            xf2,yf2,axf2,ayf2,wxf2,wyf2:double;
    begin
	pkt(xf,yf,axf,ayf,wxf,wyf,ksi,aksi,wksi,
		xf2,yf2,axf2,ayf2,wxf2,wyf2);
	pkt(xm,ym,axm,aym,wxm,wym,ksi,aksi,wksi,
		xm2,ym2,axm2,aym2,wxm2,wym2);
	sincos2(ali,s,c);
	lki:=(ym2-yf2+lj*sin(ali+alj))/s;
	lxn:=xm2-xf2-lki*c+lj*cos(ali+alj);
	alki:=(aym2-ayf2)/s;
	alxn:=axm2-axf2-alki*c;
	wlki:=(wym2-wyf2)/s;
	wlxn:=wxm2-wxf2-wlki*c;
	xn2:=xf2+lxn;
	axn2:=axf2+alxn;
	wxn2:=wxf2+wlxn;
	end;
procedure kg5(var f,m:wpara; var ksi:fxaw; lj,ali,alj:double;
	   var lxn,lki,xn2:fxaw);
	var s,c:double;
            m2,f2:wpara;
    begin
	pkt(f,ksi,f2);
	pkt(m,ksi,m2);
	sincos2(ali,s,c);
	lki[1]:=(m2[2]-f2[2]+lj*sin(ali+alj))/s;
	lxn[1]:=m2[1]-f2[1]-lki[1]*c+lj*cos(ali+alj);
	lki[2]:=(m2[4]-f2[4])/s;
	lxn[2]:=m2[3]-f2[3]-lki[2]*c;
	lki[3]:=(m2[6]-f2[6])/s;
	lxn[3]:=m2[5]-f2[5]-lki[3]*c;
	xn2[1]:=f2[1]+lxn[1];
	xn2[2]:=f2[3]+lxn[2];
	xn2[3]:=f2[5]+lxn[3];
	end;
end.
