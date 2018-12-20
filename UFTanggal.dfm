object FTanggal: TFTanggal
  Left = 260
  Top = 138
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filter'
  ClientHeight = 127
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object RzLabel2: TRzLabel
    Left = 8
    Top = 56
    Width = 48
    Height = 15
    Caption = 'Tanggal :'
  end
  object RzLabel3: TRzLabel
    Left = 64
    Top = 32
    Width = 30
    Height = 15
    Caption = 'Dari :'
  end
  object RzLabel4: TRzLabel
    Left = 216
    Top = 32
    Width = 47
    Height = 15
    Caption = 'Sampai :'
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Filter'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 89
    Width = 337
    Height = 38
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdTop]
    TabOrder = 4
    VisualStyle = vsClassic
    DesignSize = (
      337
      38)
    object BtnOk: TRzBitBtn
      Left = 252
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnBatal: TRzBitBtn
      Left = 172
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Batal'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnBatalClick
    end
  end
  object BtnSama: TRzButton
    Left = 184
    Top = 53
    Width = 25
    Height = 24
    Caption = '>'
    Color = 12615680
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    OnClick = BtnSamaClick
  end
  object dtpdari: TcxDateEdit
    Left = 64
    Top = 53
    EditValue = 0d
    ParentFont = False
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.DateOnError = deToday
    Properties.InputKind = ikMask
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 113
  end
  object dtpsampai: TcxDateEdit
    Left = 216
    Top = 53
    EditValue = 0d
    ParentFont = False
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.DateOnError = deToday
    Properties.InputKind = ikMask
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    Width = 113
  end
end
