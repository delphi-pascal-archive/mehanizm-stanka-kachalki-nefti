unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Button2: TButton;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Chart2: TChart;
    Series5: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button3: TButton;
    Edit8: TEdit;
    Label8: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    CheckBox3: TCheckBox;
    Edit10: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit11: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Chart1GetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses math,Mexanic,Vector2D, Unit2, Unit3;

{$R *.dfm}

var l1,l2,l3,l0,fi1,fi3,fi2,fi1_0,fi3_0,fi2_0,mu,r,delta:double;
Xo,Yo,Xa,Ya,fi4,fi5,l5,l4,lh,L,alf,Xh,Yh,omega:double;
    mex2:TMexanic;
    p,q,L_2:double;
    VL,Vl2,Vl3,Vr,Vl4,Vl5:TVector2;
    Nsb:integer;
     PA,PB,PC,PD,PM,PH,PH0,PG,PO,PF:TPoint;
     Pr:Tpoint2;
      fstop:boolean=false;
      fi3_1,fi4_1,fi2_1,fi5_1,fi3_11,fi4_11,fi2_11,fi5_11:double;

procedure cin2;
var s,s1,s2,s3,s4,s5,r1,r2:double;
begin
  s:=sin(fi3-fi2); s1:=sin(fi4-fi5);
  s2:=sin(fi1-fi2); s3:=sin(fi1-fi3);
  s4:=sin(fi3-fi5); s5:=sin(fi3-fi4);
  fi3_1:=l1*s2/l3/s;  fi2_1:=l1*s3/l2/s;
  fi4_1:=l3*s4/l4/s1*fi3_1;  fi5_1:=l3*s5/l5/s1*fi3_1;

  r1:=s*s; r2:=s1*s1;
  fi3_11:=s*cos(fi1-fi2)*(1-fi2_1)-s2*cos(fi3-fi2)*(fi3_1-Fi2_1);
  fi3_11:=fi3_11*l1/l3/r1;
  fi2_11:=s*cos(fi1-fi3)*(1-fi3_1)-s3*cos(fi3-fi2)*(fi3_1-Fi2_1);
  fi2_11:=fi2_11*l1/l2/r1;
  fi4_11:=s1*cos(fi3-fi5)*(fi3_1-fi5_1)-s4*cos(fi4-fi5)*(fi4_1-Fi5_1);
  fi4_11:=l3/l4*(fi4_11*fi3_1/r2+s4/s1*fi3_11);
  fi5_11:=s1*cos(fi3-fi4)*(fi3_1-fi4_1)-s5*cos(fi4-fi5)*(fi4_1-Fi5_1);
  fi5_11:=l3/l5*(fi5_11*fi3_1/r2+s5/s1*fi3_11);
end;

function mex4W:boolean;
begin
  result:=false;
  VL:=xyToV(Xo-l1*cos(fi1),Yo-l1*sin(fi1));
  L_2:=sqr_a(VL);
  if L_2=0 then  exit;
  p:=(l2*l2-l3*l3)/2/L_2-0.5;
  q:=l3*l3/L_2-p*p;
  if q<0 then  exit;
  result:=true;
  q:=-sqrt(q);
  Vl3:=sum2(p,q,VL);
  Vl2:=sum2(p+1,q,VL);
  fi2:=arctan2(Vl2.y,Vl2.x);
  fi3:=arctan2(Vl3.y,Vl3.x);
  mu:=arccos((l2*l2+l3*l3-L_2)/2/l2/l3);
  Vr:=xyToV(l3*cos(fi3)+r*cos(fi2+delta),l1*sin(fi1)+r*sin(fi2+delta));

  result:=false;
  VL:=xyToV(Xa-l3*cos(fi3)-Xo,Ya-l3*sin(fi3)-Yo);
  L_2:=sqr_a(VL);
  if L_2=0 then  exit;
  p:=(l5*l5-l4*l4)/2/L_2-0.5;
  q:=l4*l4/L_2-p*p;
  if q<0 then  exit;
  result:=true;
  q:=sqrt(q);
  Vl4:=sum2(p,q,VL);
  Vl5:=sum2(p+1,q,VL);
  fi5:=arctan2(Vl5.y,Vl5.x);
  fi4:=arctan2(Vl4.y,Vl4.x);

  p:=sin(fi5); q:=cos(fi5);
  Xh:=Xo+l3*cos(fi3)-l0*q+lh*p;
  Yh:=Yo+l3*sin(fi3)-l0*p-lh*q;

end;

procedure rismex(flagP:boolean=true);
begin
if flagP then
begin
  Pr:=Point2_(l1,fi1);
  PF:=P2_Point(PG,Pr);
  Pr:=point2_(Pr,l2,fi2);
  PC:=P2_Point(PG,Pr);
  Pr:=Point2(Xo,Yo);
  PO:=P2_Point(PG,Pr);
  Pr:=Point2(Xa,Ya);
  PA:=P2_Point(PG,Pr);
  Pr:=Point2_(l4,fi4);
  PB:=P2_Point(PA,Pr);
  Pr:=Point2_(l0,fi5-pi);
  PM:=P2_Point(PC,Pr);
  Pr:=Point2_(lh,fi5-pi/2);
  PH:=P2_Point(PM,Pr);

end;
  mex2.Mex2WWWW([PG,PF,PC,PO]);
  mex2.GrWWW(pA,pB,pC);
  mex2.stoica(pA);
  mex2.HedelWW(Pc,Pm,-1,0);
  mex2.HedelWW(PM,PH,0,3);
  mex2.Arc(PC,10,fi5,fi5-pi);
end;

procedure outmex;
begin
 with form1 do
 image1.Canvas.FillRect(rect(0,0,image1.Width,image1.Height));
 fi1:=0;
 mex4W;
 rismex;
end;

procedure zasdat;
begin
with form1 do
begin
l0:=strtofloat(edit1.text);
l1:=strtofloat(edit2.text);
l2:=strtofloat(edit3.text);
l3:=strtofloat(edit4.text);
delta:=strtofloat(edit9.text)*pi/180;
r:=strtofloat(edit8.text);
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
mex2:=TMexanic.Create;
mex2.SetCanvas(image1.Canvas);
mex2.masxy(250.0);
x000:=410;
y000:=620;
decimalseparator:='.';
zasdat;
Xo:=-0.45;
Yo:=1;
Xa:=0.75;
Ya:=-0.04;
l5:=0.85;
l4:=1;
lh:=0.088;
L:=hypot(l0,lh);
alf:=arctan(lh/l0);
Nsb:=-1;
 PG.X:=x000;
 PG.Y:=y000;
 //mex2.Canvas.Pen.Width:=3;
 outmex;
 edit5.Text:=format('%0.3f',[fi1*180/pi]);
 edit6.Text:=format('%0.3f',[fi2*180/pi]);
 edit7.Text:=format('%0.3f',[fi3*180/pi]);
 edit10.Text:=format('%0.3f',[fi4*180/pi]);
 edit11.Text:=format('%0.3f',[fi5*180/pi]);
 omega:=pi*10/30;
end;


procedure TForm1.Button2Click(Sender: TObject);
const n=36;
var df:double;
     flag,flag2:boolean;
     m,i:integer;
     xi,yi:array[1..n+1] of double;
     a,b,b0,gamma,s1,s2,s3,s4,d1,d2,k1,k2,k3,k4:double;
begin
flag2:=true;
zasdat;
 image1.Canvas.FillRect(rect(0,0,image1.Width,image1.Height));
 PA.X:=x000;
 PA.Y:=y000;
 series1.Clear;
 series2.Clear;
 series3.Clear;
 series4.Clear;
 series5.Clear;
 df:=2*pi/(n+1);
 //if checkbox2.Checked then Nsb:=-1 else Nsb:=1;
 fstop:=false;
 repeat
 fi1:=0;
 flag:=false;
 m:=0;
  s1:=0; s2:=0; s3:=0; s4:=0;
 while fi1<=2*pi do
 begin
  if not mex4W then
  begin
   fi1:=fi1+df;
   continue;
  end;
  if flag2 then
  begin
  series1.AddXY(fi1,fi2);
  series2.AddXY(fi1,fi3);
  series3.AddXY(fi1,fi4);
  series4.AddXY(fi1,fi5);
  series5.AddXY(fi1,mu);

  form2.series5.AddXY(Xh,Yh);

  cin2;

  form2.series1.AddXY(fi1,fi2_1*omega);
  form2.series2.AddXY(fi1,fi3_1*omega);
  form2.series3.AddXY(fi1,fi4_1*omega);
  form2.series4.AddXY(fi1,fi5_1*omega);

  form2.Lineseries1.AddXY(fi1,fi2_11*omega*omega);
  form2.Lineseries2.AddXY(fi1,fi3_11*omega*omega);
  form2.Lineseries3.AddXY(fi1,fi4_11*omega*omega);
  form2.Lineseries4.AddXY(fi1,fi5_11*omega*omega);

  inc(m);
  xi[m]:=Xh; yi[m]:=Yh;
  s2:=s2+xi[m]*yi[m];
  s1:=s1+yi[m]*yi[m];
  s3:=s3+xi[m];
  s4:=s4+yi[m];

  k1:=(l0*cos(fi5)+lh*sin(fi5))/l5/sin(fi4-fi5);
  k2:=sqrt(k1*k1+1+2*k1*sin(fi4));
  d1:=pi/2-arcsin(k1/k1*cos(fi4));
  k3:=sin(d1-fi3)/sin(fi2-fi3);
  k4:=k3*cos(fi2-fi3)-cos(fi3-d1);
  form3.series1.AddXY(fi1,k1);
  form3.series2.AddXY(fi1,k2);
  form3.series3.AddXY(fi1,k3);
  form3.series4.AddXY(fi1,k4);
  d1:=maxvalue([k1,k2,k3*k2,k4*k2]);
  d1:=k3*k2*sin(fi2)/d1;
  form3.series5.AddXY(fi1,d1);
  d2:=l3*cos(fi3)*fi3_1-l0*cos(fi5)*fi5_1+lh*sin(fi5)*fi5_1;
  d2:=l1/d2;
 // form3.series6.AddXY(fi1,d2);
  end;
  rismex;
  //Pr:=Point2(Vr.x,Vr.y);
 // PH:=P2_Point(PG,Pr);
   mex2.Canvas.Pen.Color:=clred;
  if flag then mex2.line(PH0,PH);
   mex2.Canvas.Pen.Color:=clblack;
  flag:=true;
  if checkbox1.Checked then
  begin
   delay_wait(50);
   if checkbox3.Checked then
   mex2.Canvas.Pen.Color:=clbtnface
   else
   mex2.Canvas.Pen.Color:=clwhite;
   rismex(false);
   mex2.Canvas.Pen.Color:=clblack;
//   mex2.Mex2WWWW([PA,PB,PC,PD]);
  end;
  fi1:=fi1+df;
  PH0:=PH;
 end;

 if flag2 then
 begin
  a:=(m*s2-s3*s4)/(m*s1-s4*s4);
  b:=(s3-a*s4)/m;
  b0:=s3/m;
  gamma:=arctan(a);
  form2.Edit8.Text:=format('%0.4f',[a]);
  form2.Edit1.Text:=format('%0.4f',[b]);
  form2.Edit4.Text:=format('%0.4f',[(gamma)*180/pi]);
  form2.Edit2.Text:=format('%0.4f',[b0]);
  s1:=yi[1]; s2:=s1;
  s3:=0; s4:=0;
  for i:=1 to m do
  begin
   if yi[i]<s1 then s1:=yi[i];
   if yi[i]>s2 then s2:=yi[i];
   d1:=abs(xi[i]-b0);
   if d1>s3 then s3:=d1;
  // s3:=s3+d1;
   d2:=abs(xi[i]-a*yi[i]-b);
   if d2>s4 then s4:=d2;
  // s4:=s4+d2;
  end;
  form2.Edit3.Text:=format('%0.4f',[s3]);
  form2.Edit5.Text:=format('%0.4f',[s4]);
  s3:=a*s1+b;
  form2.Series6.AddXY(s3,s1);
  s3:=a*s2+b;
  form2.Series6.AddXY(s3,s2);
  form2.Series7.AddXY(b0,s1);
  form2.Series7.AddXY(b0,s2);

 end;

 button6.Enabled:=true;
  flag2:=false;
  if fstop or not checkbox1.Checked then break;
 until false;
  if checkbox1.Checked then
   rismex(false);
//   mex2.Mex2WWWW([PA,PB,PC,PD]);
end;

procedure TForm1.Chart1GetLegendText(Sender: TCustomAxisPanel;
  LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
begin
 case index of
 0: LegendText:='y2';
 1: LegendText:='y3';
 2: LegendText:='y4';
 3: LegendText:='y5';
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
zasdat;
outmex;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
if checkbox2.Checked then Nsb:=-1 else Nsb:=1;
outmex;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 r:=hypot(X-PC.X,Y-PC.Y)/masx;
 edit8.Text:=format('%0.2f',[r]);
 delta:=(arctan2(-Y+PC.Y,X-PC.X)-fi5)*180/pi;
 edit9.Text:=format('%0.2f',[delta]);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
fstop:=true;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
fstop:=true;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
form3.show;
end;

end.
