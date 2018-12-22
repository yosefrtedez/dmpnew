unit UInputMesin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzEdit,
  Grids, DBGrids, SMDBGrid, RzButton, RzPanel, RzTabs, StdCtrls, RzCmboBx,
  Mask, ExtCtrls, RzLabel, RzRadChk, NxColumnClasses, NxColumns,
  NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid, ImgList,
  ComCtrls, RzDTP, frxExportXLS, frxExportMail, frxClass, frxExportPDF,
  frxDBSet, NxDBColumns, NxDBGrid, RzBtnEdt, RzRadGrp;

type
  TFrm_InputMesin = class(TForm)
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtClose: TRzBitBtn;
    RzPanel1: TRzPanel;
    RzPageControl1: TRzPageControl;
    RzPanel3: TRzPanel;
    Label2: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label27: TLabel;
    txtkode: TRzEdit;
    txtnama: TRzEdit;
    TabSheet1: TRzTabSheet;
    Label6: TLabel;
    Label4: TLabel;
    Label28: TLabel;
    txtStok: TRzNumericEdit;
    txtMin: TRzNumericEdit;
    Label20: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    txtbeli: TRzNumericEdit;
    txtjual: TRzNumericEdit;
    Label5: TLabel;
    txthpp: TRzNumericEdit;
    Label11: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txtpo: TRzNumericEdit;
    Label9: TLabel;
    Label16: TLabel;
    txtso: TRzNumericEdit;
    txtkelompokbarang: TRzButtonEdit;
    Label22: TLabel;
    txtpajakbeli: TRzButtonEdit;
    Label24: TLabel;
    txtpajakjual: TRzButtonEdit;
    LPajakPembelian: TRzLabel;
    LPajakPenjualan: TRzLabel;
    Label29: TLabel;
    Label30: TLabel;
    txtfield1: TRzEdit;
    cbaktif: TRzCheckBox;
    Label17: TLabel;
    Label18: TLabel;
    txtsupcode: TRzEdit;
    procedure BtCloseClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure CekSO;
    procedure CekPO;
  end;

var
  Frm_InputMesin: TFrm_InputMesin;

implementation

uses UDM, NxCells, UDataSatuan, UDataAkun, UDataKelompokBarang, UDataPajak, UMain, UDataKategori;

{$R *.dfm}

{ TFrm_InputMesin }

procedure TFrm_InputMesin.ClearText;
begin
  
end;

procedure TFrm_InputMesin.BtCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputMesin.BtSaveClick(Sender: TObject);
begin
  {
  if txtNama.Text = '' then begin
    MessageDlg('Nama : harus diisi',mtError,[mbOK],0);
    txtNama.SetFocus;
    Exit;
  end;
  if LSatuan.Caption = '0' then begin
    MessageDlg('Satuan : harus diisi',mtError,[mbOK],0);
    txtsatuan.SetFocus;
    Exit;
  end;
  if LAkunPersediaan.Caption = '0' then begin
    MessageDlg('Kode Akun untuk '+RzLabel15.Caption+' Tidak ada atau tidak benar !!'#10#13'Mohon periksa kembali kode akun yang diperlukan.',mtError,[mbOK],0);
    Exit;
  end;
  if GBTipe.ItemIndex = 0 then begin
    if LAkunHpp.Caption = '0' then begin
      MessageDlg('Kode Akun untuk '+RzLabel11.Caption+' Tidak ada atau tidak benar !!'#10#13'Mohon periksa kembali kode akun yang diperlukan.',mtError,[mbOK],0);
      Exit;
    end;
  end;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_barang where kodebarang=:kb';
    ParamByName('kb').Value := txtkode.Text;
    Open;
    if not IsEmpty then begin
      if LID.Caption <> IntToStr(FieldValues['nobarang']) then begin
        MessageDlg('Kode barang sudah terdaftar',mtError,[mbOK],0);
        txtkode.SetFocus;
        Free;
        Exit;
      end;
    end;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_barang where namabarang=:kb';
    ParamByName('kb').Value := txtnama.Text;
    Open;
    if not IsEmpty then begin
      if LID.Caption <> IntToStr(FieldValues['nobarang']) then begin
        MessageDlg('Nama barang sudah terdaftar',mtError,[mbOK],0);
        txtnama.SetFocus;
        Free;
        Exit;
      end;
    end;
    Free;
  end;
  ModalResult := mrOk;
  }
end;

procedure TFrm_InputMesin.CekPO;
begin
  //
end;

procedure TFrm_InputMesin.CekSO;
begin
  //
end;

end.
