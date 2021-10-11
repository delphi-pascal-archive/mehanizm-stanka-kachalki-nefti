unit Vector2D;

interface

type TVector2=record
x,y:double;
end;

function xyToV(x,y:double):Tvector2;
procedure VToxy(V:Tvector2; var x,y:double);
function ab(a,b:TVector2):double;
function akb(a,b:TVector2):double;
function kxa(a:TVector2; q:double=1.0):TVector2;
function sqr_a(a:TVector2):double;
function Sum2(p,q:double; L:TVector2):Tvector2;
function Sum(p:array of double; a:array of TVector2):TVector2;

//var a,b,s:TVector2;
//    r:double;
var V_i,V_j:TVector2;

implementation

function xyToV(x,y:double):Tvector2;
begin
result.x:=x;
result.y:=y;
end;

procedure VToxy(V:Tvector2; var x,y:double);
begin
x:=V.x;
y:=V.y;
end;

function ab(a,b:TVector2):double;
begin
result:=a.x*b.x+a.y*b.y;
end;

function akb(a,b:TVector2):double;
//Смешанное произведение вукторов a*(kxb)
begin
result:=a.y*b.x-a.x*b.y;
end;

function kxa(a:TVector2; q:double=1.0):TVector2;
begin
result.x:=-a.y*q;
result.y:=a.x*q;
end;

function sqr_a(a:TVector2):double;
begin
result:=sqr(a.x)+sqr(a.y);
end;

function Sum2(p,q:double; L:TVector2):Tvector2;
begin
result.x:=p*L.x-q*L.y;
result.y:=p*L.y+q*L.x;
end;

function Sum(p:array of double; a:array of TVector2):TVector2;
var n,i:byte;
begin
 n:=high(p);
 result.x:=0;
 result.y:=0;
 for i:=0 to n do
 begin
  result.x:=result.x+p[i]*a[i].x;
  result.y:=result.y+p[i]*a[i].y;
 end;
end;

begin
V_i:=xyToV(1,0);
V_j:=xyToV(0,1);
{
a:=xyToV(1,2);
b:=xyTOV(3,4);
r:=ab(a,b);
r:=akb(a,b);
s:=kxa(a);
r:=sqr_a(a);
s:=sum2(5,6,a);
s:=sum([5,6],[a,b]);
}
end.
