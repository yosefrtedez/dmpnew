object Frm_LokasiBarang: TFrm_LokasiBarang
  Left = 349
  Top = 235
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lokasi Barang'
  ClientHeight = 636
  ClientWidth = 845
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
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 845
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Lokasi Barang'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 767
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
  end
  object PnBarang: TRzPanel
    Left = 0
    Top = 25
    Width = 845
    Height = 570
    Align = alClient
    BorderOuter = fsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsCustom
    ParentFont = False
    TabOrder = 1
    VisualStyle = vsGradient
    object dbgdata: TcxGrid
      Left = 0
      Top = 0
      Width = 845
      Height = 570
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Blue'
      object dbgdataDBTableView1: TcxGridDBTableView
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
        object dbgdataDBTableView1namagudang: TcxGridDBColumn
          Caption = 'Gudang'
          DataBinding.FieldName = 'namagudang'
          HeaderAlignmentHorz = taCenter
        end
        object dbgdataDBTableView1tersedia: TcxGridDBColumn
          Caption = 'Tersedia'
          DataBinding.FieldName = 'tersedia'
          HeaderAlignmentHorz = taCenter
        end
        object dbgdataDBTableView1kodesatuan: TcxGridDBColumn
          Caption = 'Satuan'
          DataBinding.FieldName = 'kodesatuan'
          HeaderAlignmentHorz = taCenter
        end
      end
      object dbgdataLevel1: TcxGridLevel
        GridView = dbgdataDBTableView1
      end
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 595
    Width = 845
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      845
      41)
    object BtnSelesai: TRzBitBtn
      Left = 757
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
      OnClick = BtnSelesaiClick
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 424
    Top = 264
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT a.*,IFNULL(b.namagudang,'#39'Gudang Utama'#39')AS namagudang FROM'
      '(SELECT a.*,b.kodesatuan FROM'
      '(SELECT a.*,b.nosatuan FROM'
      
        '(SELECT nobarang,IFNULL(SUM(masuk)-SUM(keluar),0)AS tersedia,nog' +
        'udang FROM tbl_bukubesarbarang WHERE nobarang=:nb GROUP BY nobar' +
        'ang,nogudang)AS a'
      'LEFT JOIN tbl_barang AS b ON b.nobarang=a.nobarang)AS a'
      'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan)AS a'
      
        'LEFT JOIN tbl_gudang AS b ON b.nogudang=a.nogudang having a.ters' +
        'edia>0')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nb'
        ParamType = ptUnknown
      end>
    Left = 384
    Top = 260
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nb'
        ParamType = ptUnknown
      end>
    object QDatanobarang: TLargeintField
      FieldName = 'nobarang'
      ReadOnly = True
    end
    object QDatatersedia: TFloatField
      FieldName = 'tersedia'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanogudang: TLargeintField
      FieldName = 'nogudang'
    end
    object QDatanosatuan: TLargeintField
      FieldName = 'nosatuan'
      ReadOnly = True
    end
    object QDatakodesatuan: TStringField
      FieldName = 'kodesatuan'
      ReadOnly = True
      Size = 50
    end
    object QDatanamagudang: TStringField
      FieldName = 'namagudang'
      ReadOnly = True
      Size = 50
    end
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 176
    Top = 265
  end
end
