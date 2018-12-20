unit UPemindahanBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, RzButton, NxEdit, RzRadChk, StdCtrls, Mask, RzEdit,
  RzLabel, RzPanel, ExtCtrls, cxPC, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFrm_Pemindahan = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel17: TRzLabel;
    LID: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    LGudang: TRzLabel;
    txtref: TRzEdit;
    txtketerangan: TRzEdit;
    cbposting: TRzCheckBox;
    RzPanel2: TRzPanel;
    BtnBatal: TRzBitBtn;
    BtnCari: TRzBitBtn;
    RzPanel3: TRzPanel;
    dbgbarang: TNextGrid;
    NxTextColumn4: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxNumberColumn1: TNxNumberColumn;
    NxTextColumn3: TNxTextColumn;
    NxImageColumn1: TNxImageColumn;
    NxNumberColumn6: TNxNumberColumn;
    NxNumberColumn5: TNxNumberColumn;
    RzPanel4: TRzPanel;
    LMessage: TRzLabel;
    Q1: TZQuery;
    txtgudang: TRzEdit;
    NxTextColumn1: TNxNumberColumn;
    NxTextColumn5: TNxNumberColumn;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    txtselisih: TRzNumericEdit;
    dtptanggal: TcxDateEdit;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnCariClick(Sender: TObject);
    procedure dtptanggalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure UpdateTotal;
  end;

var
  Frm_Pemindahan: TFrm_Pemindahan;
  tipe:Integer;

implementation

uses UDM, UMain, NxCells, UDataBarang;

{$R *.dfm}

procedure TFrm_Pemindahan.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_Pemindahan.ClearText;
begin
  dtptanggal.Date := tanggalserver;
  dtptanggal.Enabled := True;
  txtref.Text := DM.GenerateKodeTransaksi('MV',dtptanggal.Date);
  dbgbarang.ClearRows;
  cbposting.Checked := False;
  cbposting.Enabled := True;
  LID.Caption := '0';
  txtgudang.Text := 'Gudang Utama';
  LGudang.Caption := '0';
  txtketerangan.Clear;
  txtselisih.Value := 0;
end;

procedure TFrm_Pemindahan.UpdateTotal;
var
  total:Double;
  i:integer;
begin
  total := 0;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      total:=total+Cell[5,i].AsFloat;
    end;
    txtselisih.Value := total;
  end;
end;

procedure TFrm_Pemindahan.BtnCariClick(Sender: TObject);
var
  i:Integer;
begin
  Application.CreateForm(TFrm_DataBarang, Frm_DataBarang);
  //AGudang := StrToInt(LGudang.Caption);
  //Frm_DataBarang.RefreshQ;
  if Frm_DataBarang.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select a.*,b.kodesatuan from ' +
                  '(select * from tbl_barang where nobarang=:ib)as a ' +
                  'left join tbl_satuan as b on b.nosatuan=a.nosatuan';
      ParamByName('ib').Value := Frm_DataBarang.QData.FieldValues['nobarang'];
      Open;
      i := dbgbarang.SelectedRow;
      dbgbarang.Cell[0,i].AsString := FieldValues['kodebarang'];
      dbgbarang.Cell[1,i].AsString := FieldValues['namabarang'];
      dbgbarang.Cell[2,i].AsFloat := 1;
      dbgbarang.Cell[3,i].AsString := FieldValues['kodesatuan'];
      dbgbarang.Cell[4,i].AsFloat := dm.HitungHPPPenjualan(Frm_DataBarang.QData.FieldValues['nobarang'],dbgbarang.Cell[2,i].AsFloat);
      dbgbarang.Cell[5,i].AsFloat := dbgbarang.Cell[2,i].AsFloat*dbgbarang.Cell[4,i].AsFloat;
      dbgbarang.Cell[7,i].AsInteger := FieldValues['nobarang'];
      dbgbarang.Cell[8,i].AsInteger := FieldValues['noakunpersediaan'];
      Free;
      dbgbarang.SelectCell(2,i);
      UpdateTotal;
    end;
  end;
end;

procedure TFrm_Pemindahan.dtptanggalExit(Sender: TObject);
begin
  if LID.Caption = '0' then txtref.Text := DM.GenerateKodeTransaksi('MV',dtptanggal.Date); 
end;

end.
