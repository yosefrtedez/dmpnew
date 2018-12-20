unit UFTanggalCSV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, NxEdit, RzButton, ExtCtrls, RzPanel, RzLabel,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFTanggalCSV = class(TForm)
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    BtnSama: TRzButton;
    cbstatus: TRzComboBox;
    RzLabel1: TRzLabel;
    dtpdari: TcxDateEdit;
    dtpsampai: TcxDateEdit;
    procedure BtnSamaClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTanggalCSV: TFTanggalCSV;

implementation

uses UDM;

{$R *.dfm}

procedure TFTanggalCSV.BtnSamaClick(Sender: TObject);
begin
  dtpsampai.Date := dtpdari.Date;
end;

procedure TFTanggalCSV.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFTanggalCSV.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFTanggalCSV.FormShow(Sender: TObject);
begin
  dtpdari.Date := DM.FDOM(periodeaktif);
  dtpsampai.Date := DM.LastDayCurrMon(periodeaktif);
  cbstatus.ItemIndex := 0;
end;

end.
