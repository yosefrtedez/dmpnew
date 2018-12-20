unit UInputSaldoAwalPiutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, ComCtrls, RzDTP, StdCtrls, Mask, RzBtnEdt, RzLabel,
  RzButton, ExtCtrls, RzPanel, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFrm_InputSaldoAwalPiutang = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtClose: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    txtnilai: TRzNumericEdit;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    txtpenjualan: TRzEdit;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel9: TRzLabel;
    LKontak: TRzLabel;
    ZQuery1: TZQuery;
    dtpfaktur: TRzDateTimeEdit;
    LID: TRzLabel;
    txtkontak: TRzEdit;
    LPiutang: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel10: TRzLabel;
    txtdpp: TRzNumericEdit;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    txtppn: TRzNumericEdit;
    procedure BtCloseClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure txtdppChange(Sender: TObject);
    procedure txtppnChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure UpdateTotal;
  end;

var
  Frm_InputSaldoAwalPiutang: TFrm_InputSaldoAwalPiutang;

implementation

uses UDM;

{$R *.dfm}

{ TFrm_InputSaldoAwalPiutang }

procedure TFrm_InputSaldoAwalPiutang.ClearText;
begin
  LID.Caption := '0';
  txtkontak.Clear;
  LKontak.Caption := '0';
  LPiutang.Caption := '0';
  txtpenjualan.Clear;
  txtdpp.Value := 0;
  txtppn.Value := 0;
  UpdateTotal;
  dtpfaktur.Date := tanggalserver;
end;

procedure TFrm_InputSaldoAwalPiutang.BtCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputSaldoAwalPiutang.BtSaveClick(Sender: TObject);
begin
  if txtnilai.Value = 0 then begin
    MessageDlg('Nilai Piutang tidak boleh nol',mtError,[mbOK],0);
    Exit;
  end;
  if txtpenjualan.Text = '' then begin
    MessageDlg('No. Invoice : harus diisi',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    ModalResult := mrOk;
  end;
end;

procedure TFrm_InputSaldoAwalPiutang.UpdateTotal;
begin
  txtnilai.Value := txtdpp.Value + txtppn.Value;
end;

procedure TFrm_InputSaldoAwalPiutang.txtdppChange(Sender: TObject);
begin
  UpdateTotal;
end;

procedure TFrm_InputSaldoAwalPiutang.txtppnChange(Sender: TObject);
begin
  UpdateTotal;
end;

end.
