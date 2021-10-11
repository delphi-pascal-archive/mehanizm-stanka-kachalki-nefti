object Form1: TForm1
  Left = 223
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1052#1077#1093#1072#1085#1080#1079#1084' '#1089#1090#1072#1085#1082#1072' '#1082#1072#1095#1072#1083#1082#1080' '#1076#1083#1103' '#1085#1077#1092#1090#1080
  ClientHeight = 985
  ClientWidth = 1402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label5: TLabel
    Left = 433
    Top = 12
    Width = 20
    Height = 16
    Caption = 'fi1='
  end
  object Label6: TLabel
    Left = 433
    Top = 41
    Width = 20
    Height = 16
    Caption = 'fi2='
  end
  object Label7: TLabel
    Left = 433
    Top = 71
    Width = 20
    Height = 16
    Caption = 'fi3='
  end
  object Image1: TImage
    Left = 553
    Top = 8
    Width = 838
    Height = 929
    OnMouseUp = Image1MouseUp
  end
  object Label10: TLabel
    Left = 434
    Top = 100
    Width = 20
    Height = 16
    Caption = 'fi4='
  end
  object Label11: TLabel
    Left = 434
    Top = 130
    Width = 20
    Height = 16
    Caption = 'fi5='
  end
  object Button1: TButton
    Left = 15
    Top = 947
    Width = 80
    Height = 31
    Caption = #1057#1080#1085#1090#1077#1079
    TabOrder = 0
  end
  object Chart1: TChart
    Left = 12
    Top = 160
    Width = 533
    Height = 422
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      #1055#1086#1083#1086#1078#1077#1085#1080#1103)
    Legend.Alignment = laBottom
    Legend.Font.Charset = SYMBOL_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -13
    Legend.Font.Name = 'Symbol'
    Legend.Font.Style = []
    View3D = False
    OnGetLegendText = Chart1GetLegendText
    TabOrder = 1
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 2
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 2
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 2
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series4: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Edit5: TEdit
    Left = 457
    Top = 9
    Width = 84
    Height = 24
    AutoSize = False
    TabOrder = 2
  end
  object Edit6: TEdit
    Left = 457
    Top = 39
    Width = 84
    Height = 23
    AutoSize = False
    TabOrder = 3
  end
  object Edit7: TEdit
    Left = 457
    Top = 68
    Width = 84
    Height = 24
    AutoSize = False
    TabOrder = 4
  end
  object Button2: TButton
    Left = 143
    Top = 947
    Width = 80
    Height = 31
    Caption = #1040#1085#1072#1083#1080#1079
    TabOrder = 5
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 2
    Width = 413
    Height = 149
    Caption = ' '#1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '
    TabOrder = 6
    object Label1: TLabel
      Left = 20
      Top = 30
      Width = 17
      Height = 16
      Caption = 'l0='
    end
    object Label2: TLabel
      Left = 20
      Top = 62
      Width = 17
      Height = 16
      Caption = 'l1='
    end
    object Label3: TLabel
      Left = 164
      Top = 30
      Width = 17
      Height = 16
      Caption = 'l2='
    end
    object Label4: TLabel
      Left = 164
      Top = 62
      Width = 17
      Height = 16
      Caption = 'l3='
    end
    object Label8: TLabel
      Left = 316
      Top = 33
      Width = 14
      Height = 20
      Caption = 'r='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 316
      Top = 62
      Width = 18
      Height = 21
      Caption = 'd='
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Symbol'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 44
      Top = 27
      Width = 51
      Height = 23
      AutoSize = False
      TabOrder = 0
      Text = '1.507'
    end
    object Edit2: TEdit
      Left = 44
      Top = 55
      Width = 51
      Height = 23
      AutoSize = False
      TabOrder = 1
      Text = '0.421'
    end
    object Edit3: TEdit
      Left = 189
      Top = 27
      Width = 50
      Height = 23
      AutoSize = False
      TabOrder = 2
      Text = '1.051'
    end
    object Edit4: TEdit
      Left = 189
      Top = 55
      Width = 50
      Height = 23
      AutoSize = False
      TabOrder = 3
      Text = '0.5'
    end
    object Button3: TButton
      Left = 16
      Top = 100
      Width = 377
      Height = 31
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 4
      OnClick = Button3Click
    end
    object Edit8: TEdit
      Left = 340
      Top = 30
      Width = 51
      Height = 24
      AutoSize = False
      TabOrder = 5
      Text = '40'
    end
    object Edit9: TEdit
      Left = 340
      Top = 60
      Width = 51
      Height = 23
      AutoSize = False
      TabOrder = 6
      Text = '0'
    end
  end
  object Chart2: TChart
    Left = 12
    Top = 591
    Width = 533
    Height = 346
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      #1059#1075#1086#1083' '#1087#1077#1088#1077#1076#1072#1095#1080)
    Legend.Visible = False
    View3D = False
    TabOrder = 7
    object Series5: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object CheckBox1: TCheckBox
    Left = 297
    Top = 947
    Width = 104
    Height = 31
    Caption = #1040#1085#1080#1084#1072#1094#1080#1103
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object CheckBox2: TCheckBox
    Left = 465
    Top = 947
    Width = 89
    Height = 31
    Caption = #1057#1073#1086#1088#1082#1072' 2'
    TabOrder = 9
    OnClick = CheckBox2Click
  end
  object CheckBox3: TCheckBox
    Left = 595
    Top = 953
    Width = 80
    Height = 21
    Caption = #1057#1083#1077#1076
    Checked = True
    State = cbChecked
    TabOrder = 10
  end
  object Edit10: TEdit
    Left = 458
    Top = 98
    Width = 84
    Height = 23
    AutoSize = False
    TabOrder = 11
  end
  object Edit11: TEdit
    Left = 458
    Top = 127
    Width = 84
    Height = 24
    AutoSize = False
    TabOrder = 12
  end
  object Button4: TButton
    Left = 761
    Top = 947
    Width = 109
    Height = 31
    Caption = #1057#1090#1086#1087
    TabOrder = 13
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 1302
    Top = 947
    Width = 90
    Height = 31
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 14
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 918
    Top = 946
    Width = 169
    Height = 33
    Caption = #1057#1082#1086#1088#1086#1089#1090#1080' '#1080' '#1091#1089#1082#1086#1088#1077#1085#1080#1103
    Enabled = False
    TabOrder = 15
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 1164
    Top = 947
    Width = 100
    Height = 31
    Caption = #1050#1088#1080#1090#1077#1088#1080#1080
    TabOrder = 16
    OnClick = Button7Click
  end
end
