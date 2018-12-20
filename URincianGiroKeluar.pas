unit URincianGiroKeluar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadChk, NxEdit, RzEdit, StdCtrls, Mask, RzButton, ExtCtrls,
  RzPanel, RzLabel, RzBtnEdt, cxGraphics, cxControls, cxLookAndFeels,
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
  TFrm_RincianGiroKeluar = class(TForm)
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    LID: TRzLabel;
    LTipe: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    txtnomor: TRzEdit;
    txtnilai: TRzNumericEdit;
    txttanggal: TRzEdit;
    cbposting: TRzCheckBox;
    txtkas: TRzButtonEdit;
    LKas: TRzLabel;
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
  Frm_RincianGiroKeluar: TFrm_RincianGiroKeluar;

implementation

uses UDM, UDataAkun;

{$R *.dfm}

{ TFrm_RincianGiroKeluar }

procedure TFrm_RincianGiroKeluar.Cleartext;
begin
  txtnomor.Clear;
  txtnilai.Value := 0;
  txttanggal.Clear;
  dtptempo.Clear;
  txtkas.Clear;
  LKas.Caption := '0';
  LTipe.Caption := '';
  LID.Caption := '0';    
end;

procedure TFrm_RincianGiroKeluar.BtnPerincianClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_RincianGiroKeluar.BtnSelesaiClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_RincianGiroKeluar.txtkasButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LKas.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    txtkas.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
  end;
end;

procedure TFrm_RincianGiroKeluar.txtkasKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtkasButtonClick(nil);
end;

end.
