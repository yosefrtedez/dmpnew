unit UTransferKas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzBtnEdt, ComCtrls, RzDTP, StdCtrls, Mask, RzEdit,
  RzLabel, ExtCtrls, RzPanel, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, NxEdit, RzRadChk, cxGraphics, cxControls, cxLookAndFeels,
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
  TFrm_TransferKas = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    txtjumlah: TRzNumericEdit;
    txtdari: TRzButtonEdit;
    txtke: TRzButtonEdit;
    txtketerangan: TRzEdit;
    BtnSimpan: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    LKasKe: TRzLabel;
    LKasDari: TRzLabel;
    ZQuery1: TZQuery;
    LKe: TRzLabel;
    LDari: TRzLabel;
    LKasTransit: TRzLabel;
    cbapprove: TRzCheckBox;
    cbcair: TRzCheckBox;
    cbcancel: TRzCheckBox;
    LID: TRzLabel;
    LKasKeTransit: TRzLabel;
    dtptanggal: TcxDateEdit;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
    procedure txtdariButtonClick(Sender: TObject);
    procedure txtkeButtonClick(Sender: TObject);
    procedure txtkeKeyPress(Sender: TObject; var Key: Char);
    procedure txtdariKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_TransferKas: TFrm_TransferKas;

implementation

uses UDM, UMain, UDataAkun;

{$R *.dfm}

procedure TFrm_TransferKas.BtnBatalClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_TransferKas.ClearText;
begin
  txtdari.Clear;
  LKasDari.Caption := '0';
  LKasTransit.Caption := '0';
  LDari.Caption := '';
  LDari.Visible := False;
  LID.Caption := '0';

  txtke.Clear;
  LKasKe.Caption := '0';
  LKe.Caption := '';
  LKe.Visible := False;
  LKasKeTransit.Caption := '0';

  dtptanggal.Date := tanggalserver;
  dtptanggal.Enabled := True;
  txtjumlah.Value := 0;
  txtketerangan.Clear;
  cbapprove.Checked := False;
  cbcair.Checked := False;
  cbcancel.Checked := False;
  BtnSimpan.Visible := True;
end;

procedure TFrm_TransferKas.BtnSimpanClick(Sender: TObject);
var
  referensi : Integer;
begin
  if LKasDari.Caption = '0' then begin
    MessageDlg('Sumber kas harus diisi',mtError,[mbOK],0);
    Exit;
  end;
  if LKasKe.Caption = '0' then begin
    MessageDlg('Tujuan kas harus diisi',mtError,[mbOK],0);
    Exit;
  end;
  if txtjumlah.Value = 0 then begin
    MessageDlg('Nilai tidak boleh nol',mtError,[mbOK],0);
    Exit;
  end;
  if LID.Caption = '0' then begin
    if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      ModalResult := mrOk;
    end;
  end else begin
    if cbcancel.Checked = False then begin
      if cbapprove.Checked = False then begin
        ModalResult := mrOk;
      end else begin
        MessageDlg('Transfer kas/bank telah disetujui. Transaksi tidak dapat diubah!',mtError,[mbOK],0);
      end;
    end else MessageDlg('Transfer kas/bank telah dibatalkan. Transaksi tidak dapat diubah!',mtError,[mbOK],0);
  end;
end;

procedure TFrm_TransferKas.txtdariButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LKasDari.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    txtdari.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
    txtketerangan.Text := 'Transfer '+txtdari.Text+' Ke '+txtke.Text;
    if (Frm_DataAkun.QData.FieldValues['noklasifikasi'] = 1) and (Frm_DataAkun.QData.FieldValues['nosubklasifikasi'] = 1) then begin
      LKasTransit.Caption := IntToStr(kasintransit);
    end else if (Frm_DataAkun.QData.FieldValues['noklasifikasi'] = 1) and (Frm_DataAkun.QData.FieldValues['nosubklasifikasi'] = 2) then begin
      LKasTransit.Caption := IntToStr(depositintransit);
    end;
  end;
end;

procedure TFrm_TransferKas.txtkeButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LKasKe.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    txtke.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
    txtketerangan.Text := 'Transfer '+txtdari.Text+' Ke '+txtke.Text;
    if (Frm_DataAkun.QData.FieldValues['noklasifikasi'] = 1) and (Frm_DataAkun.QData.FieldValues['nosubklasifikasi'] = 1) then begin
      LKasKeTransit.Caption := IntToStr(kasintransit);
    end else if (Frm_DataAkun.QData.FieldValues['noklasifikasi'] = 1) and (Frm_DataAkun.QData.FieldValues['nosubklasifikasi'] = 2) then begin
      LKasKeTransit.Caption := IntToStr(depositintransit);
    end;
  end;
end;

procedure TFrm_TransferKas.txtkeKeyPress(Sender: TObject; var Key: Char);
begin
  txtkeButtonClick(nil);
end;

procedure TFrm_TransferKas.txtdariKeyPress(Sender: TObject; var Key: Char);
begin
  txtdariButtonClick(nil);
end;

procedure TFrm_TransferKas.FormShow(Sender: TObject);
begin
  ClearText;
end;

end.
