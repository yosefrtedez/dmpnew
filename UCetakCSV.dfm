object Frm_DaftarCetakCSV: TFrm_DaftarCetakCSV
  Left = 396
  Top = 174
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Cetak CSV'
  ClientHeight = 636
  ClientWidth = 1289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 1289
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Daftar Transaksi Penjualan'
    Color = 16744448
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 1133
      Top = 0
      Width = 78
      ImageIndex = 1
      Images = DM.IL16
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alRight
      Caption = 'Update'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      OnClick = BtnUpdateClick
    end
    object BtnFilter: TRzToolButton
      Left = 1211
      Top = 0
      Width = 78
      ImageIndex = 2
      Images = DM.IL16
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alRight
      Caption = 'Filter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      OnClick = BtnFilterClick
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 595
    Width = 1289
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      1289
      41)
    object BtnSelesai: TRzBitBtn
      Left = 1201
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Selesai'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BtnSelesaiClick
    end
    object BtnPerincian: TRzBitBtn
      Left = 1112
      Top = 8
      Width = 84
      Anchors = [akTop, akRight]
      Caption = 'Detil Barang'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
      OnClick = BtnPerincianClick
    end
    object BtnCSV: TRzBitBtn
      Left = 1097
      Top = 8
      Width = 97
      Anchors = [akTop, akRight]
      Caption = 'Export CSV'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnCSVClick
    end
    object BtnCheck: TRzBitBtn
      Left = 7
      Top = 8
      Caption = 'Check All'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnCheckClick
    end
    object BtnUncheck: TRzBitBtn
      Left = 87
      Top = 8
      Width = 98
      Caption = 'Un-Check All'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnUncheckClick
    end
    object BtnVariabel: TRzBitBtn
      Left = 191
      Top = 8
      Width = 98
      Caption = 'Faktur Pajak'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnVariabelClick
    end
  end
  object dbgdata: TNextGrid
    Left = 0
    Top = 25
    Width = 1289
    Height = 570
    Align = alClient
    GridLinesColor = clSilver
    GridLinesStyle = lsActiveHorzOnly
    HeaderSize = 25
    HeaderStyle = hsOutlook
    InputSize = 26
    Options = [goGrid, goHeader]
    RowSize = 25
    TabOrder = 1
    TabStop = True
    WantTabs = True
    object NxCheckBoxColumn1: TNxCheckBoxColumn
      Alignment = taCenter
      DefaultWidth = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Alignment = taCenter
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coEditorAutoSelect, coPublicUsing]
      ParentFont = False
      Position = 0
      SortType = stBoolean
      Width = 30
    end
    object NxTextColumn1: TNxTextColumn
      Color = clYellow
      DefaultWidth = 150
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'No. Invoice'
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 150
    end
    object NxTextColumn6: TNxTextColumn
      Color = clYellow
      DefaultWidth = 150
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'No. DO'
      ParentFont = False
      Position = 2
      SortType = stAlphabetic
      Width = 150
    end
    object NxTextColumn4: TNxTextColumn
      Color = clYellow
      DefaultWidth = 182
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Tanggal'
      ParentFont = False
      Position = 3
      SortType = stAlphabetic
      Width = 182
    end
    object NxTextColumn2: TNxTextColumn
      DefaultWidth = 158
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Faktur Pajak'
      Options = [coAutoSize, coCanClick, coCanInput, coCanSort, coEditing, coEditorAutoSelect, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 4
      SortType = stAlphabetic
      Width = 158
    end
    object NxTextColumn3: TNxTextColumn
      Color = clYellow
      DefaultWidth = 417
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Customer'
      Options = [coAutoSize, coCanClick, coCanInput, coCanSort, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 5
      SortType = stAlphabetic
      Width = 417
    end
    object NxNumberColumn2: TNxNumberColumn
      Color = clYellow
      DefaultValue = '0'
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'DPP'
      Header.Alignment = taRightJustify
      Options = [coCanClick, coCanInput, coCanSort, coEditorAutoSelect, coPublicUsing]
      ParentFont = False
      Position = 6
      SortType = stNumeric
      Width = 100
      FormatMask = '#,#0.##'
      Increment = 1.000000000000000000
      Precision = 0
      SpinButtons = False
    end
    object NxNumberColumn1: TNxNumberColumn
      Color = clYellow
      DefaultValue = '0'
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'PPN'
      Header.Alignment = taRightJustify
      ParentFont = False
      Position = 7
      SortType = stNumeric
      Width = 100
      EditOptions = [eoAllowFloat, eoAllowSigns]
      FormatMask = '#,#0.##'
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn3: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Caption = 'nopenjualan'
      ParentFont = False
      Position = 8
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn4: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Caption = 'bulan'
      ParentFont = False
      Position = 9
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn5: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Caption = 'tahun'
      ParentFont = False
      Position = 10
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxTextColumn5: TNxTextColumn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Caption = 'tipe'
      ParentFont = False
      Position = 11
      SortType = stAlphabetic
      Visible = False
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT a.*,IFNULL(b.namakontak,'#39#39')AS namakontak FROM '
      
        '(SELECT a.*,IFNULL(b.kodepenjualanorder,'#39#39')AS kodepenjualanorder' +
        ',IFNULL(b.kodepenjualando,'#39#39')AS kodepenjualando FROM'
      
        '(SELECT a.*,IFNULL(b.kodepenjualankirim,'#39#39')AS kodepenjualankirim' +
        ',IFNULL(b.nopenjualanorder,'#39#39')AS nopenjualanorder FROM'
      '(SELECT a.* FROM'
      
        '(SELECT nopenjualaninvoice AS nopenjualan,kodepenjualaninvoice A' +
        'S kodepenjualan,kodefaktur,nopenjualankirim,'#39'SA'#39' AS tipe,tglpenj' +
        'ualaninvoice AS tgltransaksi,nokontak,totaldpp,totalppn FROM tbl' +
        '_penjualaninvoice'
      'UNION'
      
        'SELECT nopenjualantunai AS nopenjualan,kodepenjualantunai AS kod' +
        'epenjualan,kodefaktur,0 as nopenjualankirim,'#39'SP'#39' AS tipe,tgltran' +
        'saksi,nokontak,totaldpp,totalpajak AS totalppn FROM tbl_penjuala' +
        'ntunai)AS a '
      
        'WHERE a.tgltransaksi BETWEEN :tkd AND :tks and kodefaktur<>'#39#39')AS' +
        ' a'
      
        'LEFT JOIN tbl_penjualankirim AS b ON b.nopenjualankirim=a.nopenj' +
        'ualankirim)AS a'
      
        'LEFT JOIN tbl_penjualanorder AS b ON b.nopenjualanorder=a.nopenj' +
        'ualanorder)AS a'
      'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak'
      'ORDER BY a.tgltransaksi,a.kodepenjualan')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tkd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks'
        ParamType = ptUnknown
      end>
    Left = 840
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tkd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks'
        ParamType = ptUnknown
      end>
    object QDatanopenjualan: TLargeintField
      FieldName = 'nopenjualan'
      ReadOnly = True
    end
    object QDatakodepenjualan: TStringField
      FieldName = 'kodepenjualan'
      ReadOnly = True
    end
    object QDatakodefaktur: TStringField
      FieldName = 'kodefaktur'
      ReadOnly = True
    end
    object QDatatipe: TStringField
      FieldName = 'tipe'
      ReadOnly = True
      Size = 2
    end
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      ReadOnly = True
    end
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QDatatotaldpp: TFloatField
      FieldName = 'totaldpp'
      ReadOnly = True
    end
    object QDatatotalppn: TFloatField
      FieldName = 'totalppn'
      ReadOnly = True
    end
    object QDatanamakontak: TStringField
      FieldName = 'namakontak'
      ReadOnly = True
      Size = 50
    end
    object QDatanopenjualankirim: TLargeintField
      FieldName = 'nopenjualankirim'
      ReadOnly = True
    end
    object QDatakodepenjualankirim: TStringField
      FieldName = 'kodepenjualankirim'
      ReadOnly = True
      Size = 15
    end
    object QDatanopenjualanorder: TStringField
      FieldName = 'nopenjualanorder'
      ReadOnly = True
    end
    object QDatakodepenjualanorder: TStringField
      FieldName = 'kodepenjualanorder'
      ReadOnly = True
      Size = 15
    end
    object QDatakodepenjualando: TStringField
      FieldName = 'kodepenjualando'
      ReadOnly = True
      Size = 15
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 844
    Top = 88
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 320
    Top = 104
  end
end
