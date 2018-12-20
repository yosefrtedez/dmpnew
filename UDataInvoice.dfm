object Frm_DataInvoice: TFrm_DataInvoice
  Left = 786
  Top = 25
  Width = 484
  Height = 706
  BorderIcons = [biSystemMenu]
  Caption = 'Data Rincian Hutang Usaha'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 15
  object RzPanel2: TRzPanel
    Left = 0
    Top = 0
    Width = 468
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Rincian Hutang Usaha'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 626
    Width = 468
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      468
      41)
    object BtnOk: TRzBitBtn
      Left = 388
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
      Left = 308
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
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 468
    Height = 601
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    object dbgdataDBTableView1: TcxGridDBTableView
      OnDblClick = dbgdataDBTableView1DblClick
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DSData
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object dbgdataDBTableView1kodepembelian: TcxGridDBColumn
        Caption = 'No. Invoice'
        DataBinding.FieldName = 'kodepembelianinvoice'
        HeaderAlignmentHorz = taCenter
        Width = 105
      end
      object dbgdataDBTableView1tgltransaksi: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tglpembelianinvoice'
        HeaderAlignmentHorz = taCenter
        Width = 93
      end
      object dbgdataDBTableView1sisahutang: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'sisahutang'
        HeaderAlignmentHorz = taCenter
        Width = 146
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'SELECT e.*,e.totalhutang-e.jumlahretur-e.jumlahbayar AS sisahuta' +
        'ng FROM'
      
        '(SELECT c.*,IFNULL(SUM(d.jumlahbayar+d.selisih),0)AS jumlahbayar' +
        ' FROM'
      '(SELECT a.*,IFNULL(SUM(b.total),0) AS jumlahretur FROM'
      
        '(SELECT nopembelianinvoice,kodepembelianinvoice,tglpembelianinvo' +
        'ice,nokontak,total AS totalhutang,noakunhutang,DATE_ADD(tglpembe' +
        'lianinvoice,INTERVAL duedate DAY) AS tgltempo FROM tbl_pembelian' +
        'invoice WHERE nokontak=:isu)AS a'
      
        'LEFT JOIN tbl_returpembelian AS b ON b.nopembelianinvoice=a.nope' +
        'mbelianinvoice GROUP BY a.nopembelianinvoice)AS c'
      
        'LEFT JOIN (SELECT b.nopembelianinvoice,b.jumlahbayar,b.selisih F' +
        'ROM'
      '(SELECT * FROM tbl_pembayaranhutang where iscancel=0)AS a'
      
        'LEFT JOIN tbl_pembayaranhutangdetail AS b ON b.nopembayaranhutan' +
        'g=a.nopembayaranhutang) AS d ON d.nopembelianinvoice=c.nopembeli' +
        'aninvoice GROUP BY c.nopembelianinvoice)AS e '
      
        'where e.totalhutang-e.jumlahretur-e.jumlahbayar>0 ORDER BY e.tgl' +
        'pembelianinvoice')
    Params = <
      item
        DataType = ftUnknown
        Name = 'isu'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'isu'
        ParamType = ptUnknown
      end>
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      ReadOnly = True
    end
    object QDatatotalhutang: TFloatField
      FieldName = 'totalhutang'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatajumlahretur: TFloatField
      FieldName = 'jumlahretur'
      ReadOnly = True
    end
    object QDatajumlahbayar: TFloatField
      FieldName = 'jumlahbayar'
      ReadOnly = True
    end
    object QDatasisahutang: TFloatField
      FieldName = 'sisahutang'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanoakunhutang: TLargeintField
      FieldName = 'noakunhutang'
      ReadOnly = True
    end
    object QDatanopembelianinvoice: TLargeintField
      FieldName = 'nopembelianinvoice'
      ReadOnly = True
    end
    object QDatakodepembelianinvoice: TStringField
      FieldName = 'kodepembelianinvoice'
      ReadOnly = True
      Size = 15
    end
    object QDatatglpembelianinvoice: TDateField
      FieldName = 'tglpembelianinvoice'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatatgltempo: TDateField
      FieldName = 'tgltempo'
      ReadOnly = True
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
end
