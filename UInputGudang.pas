unit UInputGudang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadChk, StdCtrls, RzEdit, Mask, RzLabel, RzButton, ExtCtrls,
  RzPanel, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, DB, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ZAbstractRODataset,
  ZDataset;

type
  TFrm_InputGudang = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtnExit: TRzBitBtn;
    RzPanel3: TRzPanel;
    LID: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    txtketerangan: TRzMemo;
    zqrCabang: TZReadOnlyQuery;
    RzLabel8: TRzLabel;
    RzLabel15: TRzLabel;
    cxlCabang: TcxLookupComboBox;
    dsCabang: TDataSource;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel11: TRzLabel;
    txtnegara: TRzEdit;
    txtkota: TRzEdit;
    RzLabel7: TRzLabel;
    txtkodepos: TRzEdit;
    txtalamat2: TRzEdit;
    txtalamat1: TRzEdit;
    txtnama: TRzEdit;
    txtkode: TRzEdit;
    cbaktif: TRzCheckBox;
    procedure BtnExitClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_InputGudang: TFrm_InputGudang;

implementation

{$R *.dfm}

procedure TFrm_InputGudang.BtnExitClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputGudang.ClearText;
begin
  LID.Caption := '0';
  txtkode.Clear;
  txtnama.Clear;
  txtalamat1.Clear;
  txtalamat2.Clear;
  txtkota.Clear;
  txtkodepos.Clear;
  txtnegara.Clear;
  txtketerangan.Clear;
  cbaktif.Checked := False;
end;

procedure TFrm_InputGudang.BtSaveClick(Sender: TObject);
begin
  if txtkode.Text = '' then begin
    MessageDlg('Kode: harus diisi!',mtError,[mbOK],0);
    Exit;
  end;
  if txtnama.Text = '' then begin
    MessageDlg('Nama: harus diisi!',mtError,[mbOK],0);
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TFrm_InputGudang.FormCreate(Sender: TObject);
begin
  zqrCabang.Open;
end;

end.
