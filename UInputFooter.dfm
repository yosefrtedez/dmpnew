object Frm_Footer: TFrm_Footer
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Footer'
  ClientHeight = 211
  ClientWidth = 461
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
    Width = 461
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Footer'
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
    Top = 174
    Width = 461
    Height = 37
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      461
      37)
    object BtSave: TRzBitBtn
      Left = 373
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
      Left = 293
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
  object RzPanel3: TRzPanel
    Left = 0
    Top = 25
    Width = 461
    Height = 149
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 1
    object LID: TRzLabel
      Left = 320
      Top = 15
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
    object RzLabel13: TRzLabel
      Left = 8
      Top = 41
      Width = 62
      Height = 15
      Caption = 'Keterangan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel14: TRzLabel
      Left = 96
      Top = 41
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
    object RzLabel8: TRzLabel
      Left = 8
      Top = 15
      Width = 41
      Height = 15
      Caption = 'Cabang'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel15: TRzLabel
      Left = 96
      Top = 15
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
    object txtketerangan: TRzMemo
      Left = 104
      Top = 38
      Width = 337
      Height = 89
      ScrollBars = ssVertical
      TabOrder = 1
      FrameHotTrack = True
      FrameVisible = True
    end
    object cxlCabang: TcxLookupComboBox
      Left = 104
      Top = 11
      Properties.KeyFieldNames = 'nocabang'
      Properties.ListColumns = <
        item
          Caption = 'Cabang'
          FieldName = 'namacabang'
        end>
      Properties.ListSource = dsCabang
      Properties.ReadOnly = False
      TabOrder = 0
      OnExit = cxlCabangExit
      Width = 211
    end
  end
  object zqrCabang: TZReadOnlyQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT nocabang, namacabang FROM tbl_cabang')
    Params = <>
    Left = 404
    Top = 8
  end
  object dsCabang: TDataSource
    DataSet = zqrCabang
    Left = 375
    Top = 8
  end
end
