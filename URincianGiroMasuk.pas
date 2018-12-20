unit URincianGiroMasuk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadChk, NxEdit, RzEdit, StdCtrls, Mask, RzLabel, RzButton,
  ExtCtrls, RzPanel, RzBtnEdt, cxGraphics, cxControls, cxLookAndFeels,
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
  TFrm_RincianGiroMasuk = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    txtbank: TRzEdit;
    txtnomor: TRzEdit;
    txtkontak: TRzEdit;
    txtnilai: TRzNumericEdit;
    txttanggal: TRzEdit;
    cbposting: TRzCheckBox;
    LID: TRzLabel;
    LTipe: TRzLabel;
    LKas: TRzLabel;
    txtkas: TRzButtonEdit;
    dtptempo: TcxDateEdit;
    procedure BtnPerincianClick(Sender: TObject);
    procedure BtnSelesaiClick(Sender: TObject);
    procedure txtkasButtonClick(Sender: TObject);
    procedure txtkasKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Cleartext;
  end;

var
  Frm_RincianGiroMasuk: TFrm_RincianGiroMasuk;

implementation

uses UDM, UDataAkun;

{$R *.dfm}

{ TFrm_RincianGiroMasuk }

procedure TFrm_RincianGiroMasuk.Cleartext;
begin
  txtbank.Clear;
  txtnomor.Clear;
  txtkontak.Clear;
  txtnilai.Value := 0;
  txttanggal.Clear;
  dtptempo.Clear;
  txtkas.Clear;
  LTipe.Caption := '';
  LID.Caption := '0';
  LKas.Caption := '0';
end;

procedure TFrm_RincianGiroMasuk.BtnPerincianClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_RincianGiroMasuk.BtnSelesaiClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_RincianGiroMasuk.txtkasButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LKas.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    txtkas.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
  end;
end;

procedure TFrm_RincianGiroMasuk.txtkasKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtkasButtonClick(nil);
end;

end.
