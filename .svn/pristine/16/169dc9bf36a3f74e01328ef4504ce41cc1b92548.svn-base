unit UTanggal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  RzButton, ExtCtrls, RzPanel, StdCtrls, RzLabel;

type
  TFrm_Tanggal = class(TForm)
    RzLabel2: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dtpdari: TcxDateEdit;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Tanggal: TFrm_Tanggal;

implementation

uses UDM;

{$R *.dfm}

procedure TFrm_Tanggal.BtnOkClick(Sender: TObject);
begin
  if DM.CekPeriode(dtpdari.Date)=0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TFrm_Tanggal.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_Tanggal.FormShow(Sender: TObject);
begin
  dtpdari.Date := tanggalserver;
end;

end.
