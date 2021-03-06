object Frm_Reminder: TFrm_Reminder
  Left = 358
  Top = 240
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Reminder'
  ClientHeight = 593
  ClientWidth = 908
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object RzPanel5: TRzPanel
    Left = 0
    Top = 552
    Width = 908
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 0
    DesignSize = (
      908
      41)
    object BtnTutup: TRzBitBtn
      Left = 826
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
      TabOrder = 0
      OnClick = BtnTutupClick
    end
  end
  object Pnkiri: TRzPanel
    Left = 0
    Top = 0
    Width = 908
    Height = 552
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 1
    object RzPanel1: TRzPanel
      Left = 0
      Top = 0
      Width = 908
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BorderOuter = fsNone
      Color = 16744448
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object BtnUpdateStok: TRzBitBtn
        Left = 833
        Top = 0
        Align = alRight
        Caption = 'Update'
        Color = 12615680
        TabOrder = 0
        OnClick = BtnUpdateStokClick
      end
      object cbtipe: TRzComboBox
        Left = 0
        Top = 0
        Width = 217
        Height = 23
        Align = alLeft
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 1
        Items.Strings = (
          'Limit Stok Barang'
          'Hutang Jatuh Tempo'
          'Piutang Jatuh Tempo'
          'Order Pembelian Belum Disetujui')
      end
    end
    object dbgstok: TcxGrid
      Left = 256
      Top = 161
      Width = 561
      Height = 400
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
      object dbgstokDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DSStok
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
        object dbgstokDBTableView1kodebarang: TcxGridDBColumn
          Caption = 'Kode'
          DataBinding.FieldName = 'kodebarang'
          HeaderAlignmentHorz = taCenter
          Width = 216
        end
        object dbgstokDBTableView1namabarang: TcxGridDBColumn
          Caption = 'Nama'
          DataBinding.FieldName = 'namabarang'
          HeaderAlignmentHorz = taCenter
          Width = 429
        end
        object dbgstokDBTableView1total: TcxGridDBColumn
          Caption = 'Stok'
          DataBinding.FieldName = 'total'
          HeaderAlignmentHorz = taCenter
          Width = 138
        end
        object dbgstokDBTableView1kodesatuan: TcxGridDBColumn
          Caption = 'Satuan'
          DataBinding.FieldName = 'kodesatuan'
          HeaderAlignmentHorz = taCenter
          Width = 123
        end
      end
      object dbgstokLevel1: TcxGridLevel
        GridView = dbgstokDBTableView1
      end
    end
    object dbgpiutang: TcxGrid
      Left = 312
      Top = 25
      Width = 561
      Height = 400
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Blue'
      object cxGridDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DSPiutang
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
        object cxGridDBTableView1namacustomer: TcxGridDBColumn
          Caption = 'Customer'
          DataBinding.FieldName = 'namacustomer'
          HeaderAlignmentHorz = taCenter
          Width = 175
        end
        object cxGridDBTableView1kodepenjualaninvoice: TcxGridDBColumn
          Caption = 'No. Invoice'
          DataBinding.FieldName = 'kodepenjualaninvoice'
          HeaderAlignmentHorz = taCenter
          Width = 103
        end
        object cxGridDBTableView1tglpenjualaninvoice: TcxGridDBColumn
          Caption = 'Tgl. Invoice'
          DataBinding.FieldName = 'tglpenjualaninvoice'
          HeaderAlignmentHorz = taCenter
          Width = 93
        end
        object cxGridDBTableView1tgltempo: TcxGridDBColumn
          Caption = 'Tgl. Tempo'
          DataBinding.FieldName = 'tgltempo'
          HeaderAlignmentHorz = taCenter
          Width = 95
        end
        object cxGridDBTableView1sisapiutang: TcxGridDBColumn
          Caption = 'Saldo'
          DataBinding.FieldName = 'sisapiutang'
          HeaderAlignmentHorz = taCenter
          Width = 93
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object dbghutang: TcxGrid
      Left = 216
      Top = 121
      Width = 561
      Height = 400
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Blue'
      object cxGridDBTableView2: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DSHutang
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
        object cxGridDBTableView2namakontak: TcxGridDBColumn
          Caption = 'Vendor'
          DataBinding.FieldName = 'namakontak'
          HeaderAlignmentHorz = taCenter
          Width = 145
        end
        object cxGridDBTableView2kodepembelianinvoice: TcxGridDBColumn
          Caption = 'No. Invoice'
          DataBinding.FieldName = 'kodepembelianinvoice'
          HeaderAlignmentHorz = taCenter
          Width = 133
        end
        object cxGridDBTableView2tglpembelianinvoice: TcxGridDBColumn
          Caption = 'Tgl. Invoice'
          DataBinding.FieldName = 'tglpembelianinvoice'
          HeaderAlignmentHorz = taCenter
          Width = 100
        end
        object cxGridDBTableView2tgltempo: TcxGridDBColumn
          Caption = 'Tgl. Tempo'
          DataBinding.FieldName = 'tgltempo'
          HeaderAlignmentHorz = taCenter
          Width = 91
        end
        object cxGridDBTableView2sisahutang: TcxGridDBColumn
          Caption = 'Saldo'
          DataBinding.FieldName = 'sisahutang'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBTableView2
      end
    end
    object dbgorderpembelian: TcxGrid
      Left = 176
      Top = 120
      Width = 732
      Height = 432
      Align = alCustom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Blue'
      object dbgorderpembelianDBTableView1: TcxGridDBTableView
        PopupMenu = PopupMenu1
        OnDblClick = dbgorderpembelianDBTableView1DblClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DS_OrderPembelian
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
        object dbgorderpembelianDBTableView1kodepembelianorder: TcxGridDBColumn
          Caption = 'No. PO'
          DataBinding.FieldName = 'kodepembelianorder'
          HeaderAlignmentHorz = taCenter
          Width = 152
        end
        object dbgorderpembelianDBTableView1tgltransaksi: TcxGridDBColumn
          Caption = 'Tanggal'
          DataBinding.FieldName = 'tgltransaksi'
          HeaderAlignmentHorz = taCenter
          Width = 163
        end
        object dbgorderpembelianDBTableView1namakontak: TcxGridDBColumn
          Caption = 'Supplier'
          DataBinding.FieldName = 'namakontak'
          HeaderAlignmentHorz = taCenter
          Width = 556
        end
        object dbgorderpembelianDBTableView1hasilkali: TcxGridDBColumn
          Caption = 'Nilai'
          DataBinding.FieldName = 'total'
          HeaderAlignmentHorz = taCenter
          Width = 161
        end
      end
      object dbgorderpembelianLevel1: TcxGridLevel
        GridView = dbgorderpembelianDBTableView1
      end
    end
  end
  object DSStok: TDataSource
    DataSet = QStok
    Left = 25
    Top = 113
  end
  object QHutang: TZQuery
    Connection = DM.con
    CachedUpdates = True
    SQL.Strings = (
      
        'SELECT e.*,e.totalhutang-e.jumlahretur-e.jumlahbayar AS sisahuta' +
        'ng FROM'
      '(SELECT a.*,b.namakontak FROM'
      
        '(SELECT c.*,IFNULL(SUM(d.jumlahbayar+d.potonganhutang),0)AS juml' +
        'ahbayar FROM'
      '(SELECT a.*,IFNULL(SUM(b.total),0) AS jumlahretur FROM'
      
        '(SELECT nopembelianinvoice,kodepembelianinvoice,tglpembelianinvo' +
        'ice,nokontak,total AS totalhutang,noakunhutang,DATE_ADD(tglpembe' +
        'lianinvoice,INTERVAL duedate DAY) AS tgltempo FROM tbl_pembelian' +
        'invoice WHERE DATE_ADD(tglpembelianinvoice,INTERVAL duedate DAY)' +
        '<=CURDATE())AS a'
      
        'LEFT JOIN tbl_returpembelian AS b ON b.nopembelianinvoice=a.nope' +
        'mbelianinvoice GROUP BY a.nopembelianinvoice)AS c'
      
        'LEFT JOIN tbl_pembayaranhutangdetail AS d ON d.nopembelianinvoic' +
        'e=c.nopembelianinvoice GROUP BY c.nopembelianinvoice)AS a '
      'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak)AS e'
      
        'WHERE e.totalhutang-e.jumlahretur-e.jumlahbayar>0 ORDER BY e.tgl' +
        'pembelianinvoice')
    Params = <>
    Left = 593
    Top = 201
    object QHutangnopembelianinvoice: TLargeintField
      FieldName = 'nopembelianinvoice'
      ReadOnly = True
    end
    object QHutangkodepembelianinvoice: TStringField
      FieldName = 'kodepembelianinvoice'
      ReadOnly = True
      Size = 15
    end
    object QHutangtglpembelianinvoice: TDateField
      FieldName = 'tglpembelianinvoice'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QHutangnokontak: TLargeintField
      FieldName = 'nokontak'
      ReadOnly = True
    end
    object QHutangtotalhutang: TFloatField
      FieldName = 'totalhutang'
      ReadOnly = True
    end
    object QHutangnoakunhutang: TLargeintField
      FieldName = 'noakunhutang'
      ReadOnly = True
    end
    object QHutangjumlahretur: TFloatField
      FieldName = 'jumlahretur'
      ReadOnly = True
    end
    object QHutangjumlahbayar: TFloatField
      FieldName = 'jumlahbayar'
      ReadOnly = True
    end
    object QHutangsisahutang: TFloatField
      FieldName = 'sisahutang'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QHutangnamakontak: TStringField
      FieldName = 'namakontak'
      ReadOnly = True
      Size = 50
    end
    object QHutangtgltempo: TDateField
      FieldName = 'tgltempo'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
  end
  object DSHutang: TDataSource
    DataSet = QHutang
    Left = 593
    Top = 225
  end
  object QPiutang: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT f.*,g.namakontak AS namacustomer FROM'
      
        '(SELECT e.*,e.totalpiutang-e.jumlahretur-e.jumlahbayar AS sisapi' +
        'utang FROM'
      
        '(SELECT c.*,IFNULL(SUM(d.jumlahbayar+d.potonganpiutang),0)AS jum' +
        'lahbayar FROM'
      '(SELECT a.*,IFNULL(SUM(b.total),0) AS jumlahretur FROM'
      
        '(SELECT nopenjualaninvoice,kodepenjualaninvoice,tglpenjualaninvo' +
        'ice,tglpenjualaninvoice+duedate AS tgltempo,nokontak,total AS to' +
        'talpiutang FROM tbl_penjualaninvoice WHERE tunai=0 AND tglpenjua' +
        'laninvoice+duedate<=:tf)AS a'
      
        'LEFT JOIN tbl_returpenjualan AS b ON b.nopenjualaninvoice=a.nope' +
        'njualaninvoice GROUP BY a.nopenjualaninvoice)AS c'
      
        'LEFT JOIN tbl_pembayaranpiutangdetail AS d ON d.nopenjualaninvoi' +
        'ce=c.nopenjualaninvoice GROUP BY c.nopenjualaninvoice)AS e WHERE' +
        ' e.totalpiutang-e.jumlahretur-e.jumlahbayar>0 ORDER BY e.tglpenj' +
        'ualaninvoice)AS f'
      'LEFT JOIN tbl_kontak AS g ON g.nokontak=f.nokontak')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tf'
        ParamType = ptUnknown
      end>
    Left = 673
    Top = 377
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tf'
        ParamType = ptUnknown
      end>
    object QPiutangnopenjualaninvoice: TLargeintField
      FieldName = 'nopenjualaninvoice'
      ReadOnly = True
    end
    object QPiutangkodepenjualaninvoice: TStringField
      FieldName = 'kodepenjualaninvoice'
      ReadOnly = True
      Size = 15
    end
    object QPiutangtglpenjualaninvoice: TDateField
      FieldName = 'tglpenjualaninvoice'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QPiutangtgltempo: TFloatField
      FieldName = 'tgltempo'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QPiutangnokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QPiutangtotalpiutang: TFloatField
      FieldName = 'totalpiutang'
      ReadOnly = True
    end
    object QPiutangjumlahretur: TFloatField
      FieldName = 'jumlahretur'
      ReadOnly = True
    end
    object QPiutangjumlahbayar: TFloatField
      FieldName = 'jumlahbayar'
      ReadOnly = True
    end
    object QPiutangsisapiutang: TFloatField
      FieldName = 'sisapiutang'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QPiutangnamacustomer: TStringField
      FieldName = 'namacustomer'
      Size = 50
    end
  end
  object DSPiutang: TDataSource
    DataSet = QPiutang
    Left = 673
    Top = 425
  end
  object QStok: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select c.*,d.kodesatuan from'
      '(SELECT a.*,ifnull(SUM(b.masuk)-sum(b.keluar),0)AS total FROM'
      
        '(SELECT nobarang,kodebarang,namabarang,minstok,nosatuan FROM tbl' +
        '_barang WHERE aktif=1)AS a'
      'LEFT JOIN tbl_bukubesarbarang AS b ON b.nobarang=a.nobarang'
      'GROUP BY a.nobarang,a.minstok'
      'HAVING a.minstok >= total)as c'
      'left join tbl_satuan as d on d.nosatuan=c.nosatuan')
    Params = <>
    Left = 24
    Top = 80
    object QStoknobarang: TLargeintField
      FieldName = 'nobarang'
      ReadOnly = True
    end
    object QStokkodebarang: TStringField
      FieldName = 'kodebarang'
      ReadOnly = True
      Size = 50
    end
    object QStoknamabarang: TStringField
      FieldName = 'namabarang'
      ReadOnly = True
      Size = 100
    end
    object QStoknosatuan: TLargeintField
      FieldName = 'nosatuan'
      Required = True
    end
    object QStoktotal: TFloatField
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QStokkodesatuan: TStringField
      FieldName = 'kodesatuan'
      Size = 50
    end
    object QStokminstok: TFloatField
      FieldName = 'minstok'
      ReadOnly = True
    end
  end
  object QOrderPembelian: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT a.*,IFNULL(b.namakontak,'#39#39')AS namakontak FROM '
      
        '                  (SELECT * FROM tbl_pembelianorder where approv' +
        'e=0)AS a '
      
        '                  LEFT JOIN tbl_kontak AS b ON b.nokontak=a.noko' +
        'ntak ORDER BY a.tgltransaksi,a.kodepembelianorder')
    Params = <>
    Left = 400
    Top = 224
    object QOrderPembeliannopembelianorder: TLargeintField
      FieldName = 'nopembelianorder'
      ReadOnly = True
    end
    object QOrderPembeliankodepembelianorder: TStringField
      FieldName = 'kodepembelianorder'
      ReadOnly = True
      Size = 15
    end
    object QOrderPembeliannokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QOrderPembeliannopembelianrequest: TLargeintField
      FieldName = 'nopembelianrequest'
      ReadOnly = True
    end
    object QOrderPembeliantgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QOrderPembeliantotal: TFloatField
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QOrderPembeliannamauser: TStringField
      FieldName = 'namauser'
      ReadOnly = True
      Size = 50
    end
    object QOrderPembelianselesai: TSmallintField
      FieldName = 'selesai'
      ReadOnly = True
    end
    object QOrderPembeliannamakontak: TStringField
      FieldName = 'namakontak'
      ReadOnly = True
      Size = 50
    end
    object QOrderPembeliantotalpajak: TFloatField
      FieldName = 'totalpajak'
      ReadOnly = True
    end
    object QOrderPembeliantotaldpp: TFloatField
      FieldName = 'totaldpp'
      ReadOnly = True
    end
    object QOrderPembelianketerangan: TMemoField
      FieldName = 'keterangan'
      ReadOnly = True
      BlobType = ftMemo
    end
    object QOrderPembelianbiayalain: TFloatField
      FieldName = 'biayalain'
      ReadOnly = True
    end
    object QOrderPembelianpph: TFloatField
      FieldName = 'pph'
      ReadOnly = True
    end
    object QOrderPembelianapprove: TSmallintField
      FieldName = 'approve'
      ReadOnly = True
    end
    object QOrderPembeliantglapprove: TDateTimeField
      FieldName = 'tglapprove'
      ReadOnly = True
    end
    object QOrderPembeliandiskonday: TIntegerField
      FieldName = 'diskonday'
    end
    object QOrderPembelianduedate: TIntegerField
      FieldName = 'duedate'
    end
    object QOrderPembelianearlydiskon: TFloatField
      FieldName = 'earlydiskon'
    end
    object QOrderPembelianlatecharge: TFloatField
      FieldName = 'latecharge'
    end
  end
  object DS_OrderPembelian: TDataSource
    DataSet = QOrderPembelian
    Left = 404
    Top = 256
  end
  object PopupMenu1: TPopupMenu
    Left = 328
    Top = 360
    object Approve1: TMenuItem
      Caption = 'Approve'
      OnClick = Approve1Click
    end
  end
end
