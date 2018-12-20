unit UInputSaldoAwalHutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzEdit,
  ComCtrls, RzDTP, StdCtrls, Mask, RzBtnEdt, RzLabel, RzButton, ExtCtrls,
  RzPanel;

type
  TFrm_InputSaldoAwalHutang = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtClose: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel18: TRzLabel;
    txtpembelian: TRzEdit;
    txtnilai: TRzNumericEdit;
    RzLabel2: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    LKontak: TRzLabel;
    ZQuery1: TZQuery;
    dtpfaktur: TRzDateTimeEdit;
    LID: TRzLabel;
    txtkontak: TRzEdit;
    LHutang: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel12: TRzLabel;
    txtppn: TRzNumericEdit;
    txtdpp: TRzNumericEdit;
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
  Frm_InputSaldoAwalHutang: TFrm_InputSaldoAwalHutang;

implementation

uses UDM;

{$R *.dfm}

{ TFrm_InputSaldoAwalHutang }

procedure TFrm_InputSaldoAwalHutang.ClearText;
begin
  LID.Caption := '0';
  txtkontak.Clear;
  LKontak.Caption := '0';
  LHutang.Caption := '0';
  txtpembelian.Clear;
  txtdpp.Value := 0;
  txtppn.Value := 0;
  dtpfaktur.Date := tanggalserver;
end;

procedure TFrm_InputSaldoAwalHutang.BtCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputSaldoAwalHutang.BtSaveClick(Sender: TObject);
begin
  if LKontak.Caption = '0' then begin
    MessageDlg('Supplier : harus diisi',mtError,[mbOK],0);
    Exit;
  end;
  if txtpembelian.Text = '' then begin
    MessageDlg('No. Pembelian : harus diisi',mtError,[mbOK],0);
    Exit;
  end;
  if txtnilai.Value = 0 then begin
    MessageDlg('Nilai Hutang tidak boleh nol',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    ModalResult := mrOk;
  end;
end;

procedure TFrm_InputSaldoAwalHutang.UpdateTotal;
begin
  txtnilai.Value := txtdpp.Value + txtppn.Value;
end;

procedure TFrm_InputSaldoAwalHutang.txtdppChange(Sender: TObject);
begin
  UpdateTotal;
end;

procedure TFrm_InputSaldoAwalHutang.txtppnChange(Sender: TObject);
begin
  UpdateTotal;
end;

end.
