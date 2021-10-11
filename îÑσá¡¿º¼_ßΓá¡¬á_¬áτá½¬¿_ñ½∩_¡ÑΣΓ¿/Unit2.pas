unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls;

type
  TForm2 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    Chart3: TChart;
    Series5: TLineSeries;
    Label1: TLabel;
    Label8: TLabel;
    Edit8: TEdit;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Button1: TButton;
    Shape1: TShape;
    Shape2: TShape;
    procedure Chart1GetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure Chart2GetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Chart1GetLegendText(Sender: TCustomAxisPanel;
  LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
begin
 case index of
 0: LegendText:='y2 '+#162;
 1: LegendText:='y3 '+#162;
 2: LegendText:='y4 '+#162;
 3: LegendText:='y5 '+#162;
 end;
end;

procedure TForm2.Chart2GetLegendText(Sender: TCustomAxisPanel;
  LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
begin
 case index of
 0: LegendText:='y2 '+#178;
 1: LegendText:='y3 '+#178;
 2: LegendText:='y4 '+#178;
 3: LegendText:='y5 '+#178;
 end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 series5.XValues.Order:=loNone;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
close;
end;

end.
