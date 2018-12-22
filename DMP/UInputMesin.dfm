object Frm_InputMesin: TFrm_InputMesin
  Left = 471
  Top = 152
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Data Mesin'
  ClientHeight = 428
  ClientWidth = 656
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
  object RzPanel2: TRzPanel
    Left = 0
    Top = 391
    Width = 656
    Height = 37
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 3
    DesignSize = (
      656
      37)
    object BtSave: TRzBitBtn
      Left = 573
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Simpan'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtSaveClick
    end
    object BtClose: TRzBitBtn
      Left = 493
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
      TabOrder = 0
      OnClick = BtCloseClick
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Mesin'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      656
      25)
    object cbaktif: TRzCheckBox
      Left = 576
      Top = 3
      Width = 64
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Aktif'
      HotTrack = True
      State = cbUnchecked
      TabOrder = 0
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 177
    Width = 656
    Height = 214
    ActivePage = TabSheet1
    ActivePageDefault = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 2
    TabOrientation = toBottom
    TabStyle = tsRoundCorners
    FixedDimension = 21
    object TabSheet1: TRzTabSheet
      Caption = 'Data'
      object Label6: TLabel
        Left = 7
        Top = 97
        Width = 73
        Height = 15
        Caption = 'Stok Minimal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 7
        Top = 16
        Width = 89
        Height = 16
        AutoSize = False
        Caption = 'Dalam Stok'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 169
        Top = 16
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
      object Label20: TLabel
        Left = 169
        Top = 97
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
      object Label10: TLabel
        Left = 7
        Top = 124
        Width = 105
        Height = 15
        Caption = 'Harga Beli Terakhir'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 7
        Top = 152
        Width = 99
        Height = 15
        Caption = 'Harga Jual Satuan'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 169
        Top = 152
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
      object Label26: TLabel
        Left = 169
        Top = 124
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
      object Label5: TLabel
        Left = 343
        Top = 16
        Width = 110
        Height = 15
        Caption = 'Harga Pokok Satuan'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 505
        Top = 16
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
      object Label7: TLabel
        Left = 7
        Top = 43
        Width = 146
        Height = 16
        AutoSize = False
        Caption = 'Telah dipesan ke Supplier'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 169
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
      object Label9: TLabel
        Left = 7
        Top = 70
        Width = 146
        Height = 16
        AutoSize = False
        Caption = 'Telah dipesan Pelanggan'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 169
        Top = 70
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
      object Label22: TLabel
        Left = 343
        Top = 124
        Width = 98
        Height = 15
        Caption = 'Pajak Pembelian :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 343
        Top = 151
        Width = 96
        Height = 15
        Caption = 'Pajak Penjualan :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object LPajakPembelian: TRzLabel
        Left = 472
        Top = 128
        Width = 94
        Height = 15
        Caption = 'LPajakPembelian'
        Visible = False
      end
      object LPajakPenjualan: TRzLabel
        Left = 456
        Top = 152
        Width = 92
        Height = 15
        Caption = 'LPajakPenjualan'
        Visible = False
      end
      object txtStok: TRzNumericEdit
        Left = 179
        Top = 13
        Width = 158
        Height = 23
        TabStop = False
        Color = clYellow
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 0
        DisplayFormat = '#,#0.##'
      end
      object txtMin: TRzNumericEdit
        Left = 179
        Top = 94
        Width = 158
        Height = 23
        FocusColor = clInfoBk
        FrameHotTrack = True
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 4
        IntegersOnly = False
        DisplayFormat = '#,#0.##'
      end
      object txtbeli: TRzNumericEdit
        Left = 179
        Top = 121
        Width = 158
        Height = 23
        TabStop = False
        Color = clYellow
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 5
        DisplayFormat = '#,#0.##'
      end
      object txtjual: TRzNumericEdit
        Left = 179
        Top = 149
        Width = 158
        Height = 23
        FocusColor = clInfoBk
        FrameHotTrack = True
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 8
        IntegersOnly = False
        DisplayFormat = '#,#0.##'
      end
      object txthpp: TRzNumericEdit
        Left = 529
        Top = 13
        Width = 110
        Height = 23
        TabStop = False
        Color = clYellow
        FocusColor = clInfoBk
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 1
        IntegersOnly = False
        DisplayFormat = '#,#0.##'
      end
      object txtpo: TRzNumericEdit
        Left = 179
        Top = 40
        Width = 158
        Height = 23
        TabStop = False
        Color = clYellow
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 2
        DisplayFormat = '#,#0.##'
      end
      object txtso: TRzNumericEdit
        Left = 179
        Top = 67
        Width = 158
        Height = 23
        TabStop = False
        Color = clYellow
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 3
        DisplayFormat = '#,#0.##'
      end
      object txtpajakbeli: TRzButtonEdit
        Left = 443
        Top = 121
        Width = 198
        Height = 23
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 6
        AllowKeyEdit = False
      end
      object txtpajakjual: TRzButtonEdit
        Left = 443
        Top = 148
        Width = 198
        Height = 23
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 7
        AllowKeyEdit = False
      end
    end
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 25
    Width = 656
    Height = 152
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 1
    object Label2: TLabel
      Left = 7
      Top = 12
      Width = 30
      Height = 15
      Caption = 'Kode '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 169
      Top = 12
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
    object Label12: TLabel
      Left = 169
      Top = 66
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
    object Label27: TLabel
      Left = 7
      Top = 66
      Width = 35
      Height = 15
      Caption = 'Lokasi'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 7
      Top = 93
      Width = 96
      Height = 15
      Caption = 'Kelompok Barang'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 169
      Top = 93
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
    object Label29: TLabel
      Left = 7
      Top = 120
      Width = 21
      Height = 15
      Caption = 'Size'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 169
      Top = 120
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
    object Label17: TLabel
      Left = 7
      Top = 39
      Width = 69
      Height = 15
      Caption = 'Nama Mesin'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 169
      Top = 39
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
    object txtkode: TRzEdit
      Left = 179
      Top = 9
      Width = 158
      Height = 23
      FocusColor = clInfoBk
      FrameHotTrack = True
      FrameVisible = True
      ReadOnlyColor = clYellow
      TabOnEnter = True
      TabOrder = 0
    end
    object txtnama: TRzEdit
      Left = 179
      Top = 63
      Width = 332
      Height = 23
      FocusColor = clInfoBk
      FrameHotTrack = True
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 2
    end
    object txtkelompokbarang: TRzButtonEdit
      Left = 179
      Top = 90
      Width = 158
      Height = 23
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 3
      AllowKeyEdit = False
    end
    object txtfield1: TRzEdit
      Left = 179
      Top = 117
      Width = 158
      Height = 23
      FocusColor = clInfoBk
      FrameHotTrack = True
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 4
    end
    object txtsupcode: TRzEdit
      Left = 179
      Top = 36
      Width = 332
      Height = 23
      FocusColor = clInfoBk
      FrameHotTrack = True
      FrameVisible = True
      ReadOnlyColor = clYellow
      TabOnEnter = True
      TabOrder = 1
    end
  end
end
