object Frm_InputKategori: TFrm_InputKategori
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Data Kategori'
  ClientHeight = 125
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object RzLabel1: TRzLabel
    Left = 8
    Top = 43
    Width = 81
    Height = 15
    Caption = 'Nama Kategori'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel4: TRzLabel
    Left = 88
    Top = 43
    Width = 3
    Height = 15
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object LID: TRzLabel
    Left = 328
    Top = 52
    Width = 17
    Height = 15
    Caption = 'LID'
    Visible = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Kategori'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 0
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 88
    Width = 442
    Height = 37
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      442
      37)
    object BtSave: TRzBitBtn
      Left = 359
      Top = 6
      Anchors = [akTop, akRight]
      Caption = 'Simpan'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtSaveClick
    end
    object BtnExit: TRzBitBtn
      Left = 279
      Top = 6
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
      OnClick = BtnExitClick
    end
  end
  object txtnama: TRzEdit
    Left = 111
    Top = 40
    Width = 318
    Height = 23
    FocusColor = clInfoBk
    FrameHotTrack = True
    FrameVisible = True
    TabOnEnter = True
    TabOrder = 1
  end
end
