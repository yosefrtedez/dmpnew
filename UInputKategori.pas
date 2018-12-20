unit UInputKategori;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzButton, ExtCtrls, RzPanel, RzLabel;

type
  TFrm_InputKategori = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    LID: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtnExit: TRzBitBtn;
    txtnama: TRzEdit;
    procedure BtnExitClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_InputKategori: TFrm_InputKategori;

implementation

{$R *.dfm}

{ TFrm_InputKategori }

procedure TFrm_InputKategori.ClearText;
begin
  LID.Caption := '0';
  txtnama.Clear;
end;

procedure TFrm_InputKategori.BtnExitClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputKategori.BtSaveClick(Sender: TObject);
begin
  if txtnama.Text = '' then begin
    MessageDlg('Nama harus diisi',mtError,[mbOK],0);
    txtnama.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
