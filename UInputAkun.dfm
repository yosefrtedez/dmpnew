object Frm_InputAkun: TFrm_InputAkun
  Left = 341
  Top = 226
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Input Akun'
  ClientHeight = 187
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label7: TLabel
    Left = 10
    Top = 45
    Width = 58
    Height = 15
    Caption = 'Klasifikasi'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 113
    Top = 45
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
  object Label1: TLabel
    Left = 10
    Top = 72
    Width = 27
    Height = 15
    Caption = 'Kode'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 113
    Top = 72
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
  object Label2: TLabel
    Left = 10
    Top = 99
    Width = 32
    Height = 15
    Caption = 'Nama'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 113
    Top = 99
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
  object LKlasifikasi: TLabel
    Left = 330
    Top = 45
    Width = 63
    Height = 15
    Caption = 'LKlasifikasi'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LID: TLabel
    Left = 394
    Top = 77
    Width = 17
    Height = 15
    Caption = 'LID'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LSubKlasifikasi: TLabel
    Left = 330
    Top = 61
    Width = 83
    Height = 15
    Caption = 'LSubKlasifikasi'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 432
    Height = 37
    Align = alTop
    BorderOuter = fsNone
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 0
    object Label22: TLabel
      Left = 8
      Top = 8
      Width = 69
      Height = 19
      Caption = 'Input Akun'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 150
    Width = 432
    Height = 37
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 6
    TabStop = True
    DesignSize = (
      432
      37)
    object BtSave: TRzBitBtn
      Left = 349
      Top = 7
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
    object BtClose: TRzBitBtn
      Left = 269
      Top = 7
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
      OnClick = BtCloseClick
    end
  end
  object cbklasifikasi: TRzComboBox
    Left = 120
    Top = 42
    Width = 297
    Height = 23
    AllowEdit = False
    Ctl3D = False
    DisabledColor = clYellow
    FocusColor = clInfoBk
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 15
    ParentCtl3D = False
    ReadOnlyColor = clYellow
    TabOnEnter = True
    TabOrder = 1
    OnExit = cbklasifikasiExit
    OnSelect = cbklasifikasiSelect
  end
  object txtNama: TRzEdit
    Left = 120
    Top = 96
    Width = 297
    Height = 23
    FocusColor = clInfoBk
    FrameHotTrack = True
    FrameVisible = True
    TabOnEnter = True
    TabOrder = 3
  end
  object cbkas: TRzCheckBox
    Left = 120
    Top = 126
    Width = 97
    Height = 17
    Caption = 'Kas / Bank'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 4
  end
  object cbaktif: TRzCheckBox
    Left = 248
    Top = 126
    Width = 73
    Height = 17
    Caption = 'Aktif'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 5
  end
  object txtkode: TRzEdit
    Left = 120
    Top = 69
    Width = 121
    Height = 23
    FocusColor = clInfoBk
    FrameHotTrack = True
    FrameVisible = True
    ReadOnlyColor = clYellow
    TabOnEnter = True
    TabOrder = 2
  end
  object QKlasifikasi: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select * from tbl_subklasifikasi')
    Params = <>
    Left = 400
  end
end
