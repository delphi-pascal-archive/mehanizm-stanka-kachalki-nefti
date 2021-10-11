object Form2: TForm2
  Left = 249
  Top = 103
  BorderStyle = bsDialog
  Caption = #1057#1082#1086#1088#1086#1089#1090#1080' '#1080' '#1091#1089#1082#1086#1088#1077#1085#1080#1103
  ClientHeight = 729
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 67
    Top = 680
    Width = 80
    Height = 13
    Caption = #1055#1088#1103#1084#1072#1103'  x=ay+b'
  end
  object Label8: TLabel
    Left = 171
    Top = 680
    Width = 15
    Height = 16
    Caption = 'a='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 251
    Top = 680
    Width = 15
    Height = 16
    Caption = 'b='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 66
    Top = 705
    Width = 63
    Height = 13
    Caption = #1055#1088#1103#1084#1072#1103'  x=b'
  end
  object Label4: TLabel
    Left = 170
    Top = 705
    Width = 15
    Height = 16
    Caption = 'b='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 250
    Top = 705
    Width = 17
    Height = 19
    Caption = 'D='
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Symbol'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 330
    Top = 678
    Width = 18
    Height = 19
    Caption = 'a='
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Symbol'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 410
    Top = 678
    Width = 17
    Height = 19
    Caption = 'D='
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Symbol'
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 25
    Top = 686
    Width = 33
    Height = 5
    Brush.Color = clBlue
  end
  object Shape2: TShape
    Left = 25
    Top = 710
    Width = 33
    Height = 5
    Brush.Color = clGreen
  end
  object Chart1: TChart
    Left = 16
    Top = -1
    Width = 433
    Height = 337
    Legend.Alignment = laBottom
    Legend.CheckBoxes = True
    Legend.Font.Charset = SYMBOL_CHARSET
    Legend.Font.Name = 'Symbol'
    Legend.Symbol.Pen.Width = 3
    Legend.Symbol.Squared = True
    Title.Text.Strings = (
      #1057#1082#1086#1088#1086#1089#1090#1080)
    View3D = False
    OnGetLegendText = Chart1GetLegendText
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 2
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 2
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 2
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series4: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  object Chart2: TChart
    Left = 16
    Top = 336
    Width = 433
    Height = 337
    Legend.Alignment = laBottom
    Legend.CheckBoxes = True
    Legend.Font.Charset = SYMBOL_CHARSET
    Legend.Font.Name = 'Symbol'
    Legend.Symbol.Pen.Width = 3
    Legend.Symbol.Squared = True
    Title.Text.Strings = (
      #1059#1089#1082#1086#1088#1077#1085#1080#1103)
    View3D = False
    OnGetLegendText = Chart2GetLegendText
    TabOrder = 1
    object LineSeries1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 2
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object LineSeries2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 2
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object LineSeries3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 2
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object LineSeries4: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  object Chart3: TChart
    Left = 456
    Top = 0
    Width = 225
    Height = 673
    Legend.Visible = False
    MarginTop = 3
    Title.Text.Strings = (
      #1058#1088#1072#1077#1082#1090#1086#1088#1080#1103)
    View3D = False
    TabOrder = 2
    object Series5: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loDescending
      YValues.Name = 'Y'
    end
    object Series6: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series7: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  object Edit8: TEdit
    Left = 191
    Top = 678
    Width = 41
    Height = 19
    AutoSize = False
    ReadOnly = True
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 271
    Top = 678
    Width = 41
    Height = 19
    AutoSize = False
    ReadOnly = True
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 190
    Top = 703
    Width = 41
    Height = 19
    AutoSize = False
    ReadOnly = True
    TabOrder = 5
  end
  object Edit3: TEdit
    Left = 270
    Top = 703
    Width = 41
    Height = 19
    AutoSize = False
    ReadOnly = True
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 350
    Top = 678
    Width = 41
    Height = 19
    AutoSize = False
    ReadOnly = True
    TabOrder = 7
  end
  object Edit5: TEdit
    Left = 430
    Top = 678
    Width = 41
    Height = 19
    AutoSize = False
    ReadOnly = True
    TabOrder = 8
  end
  object Button1: TButton
    Left = 576
    Top = 688
    Width = 89
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 9
    OnClick = Button1Click
  end
end
