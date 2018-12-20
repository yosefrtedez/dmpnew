unit UInputFooter;

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
  dxSkinXmas2008Blue, DB, ZAbstractRODataset, ZDataset, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, StdCtrls, RzEdit, RzLabel, RzButton, ExtCtrls,
  RzPanel;

type
  TFrm_Footer = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtnExit: TRzBitBtn;
    RzPanel3: TRzPanel;
    LID: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel15: TRzLabel;
    txtketerangan: TRzMemo;
    cxlCabang: TcxLookupComboBox;
    zqrCabang: TZReadOnlyQuery;
    dsCabang: TDataSource;
    procedure BtnExitClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure cxlCabangExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Footer: TFrm_Footer;

implementation

uses UDM;

{$R *.dfm}

procedure TFrm_Footer.BtnExitClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_Footer.BtSaveClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_Footer.cxlCabangExit(Sender: TObject);
begin
  with TZQuery.Create(Self)do begin
    Connection := dm.con;
    Close;
    SQL.Text := 'select * from tbl_footer where nocabang=:a';
    ParamByName('a').Value := cxlCabang.EditValue;
    Open;
    if IsEmpty then
      txtketerangan.Clear
    else txtketerangan.Text := FieldValues['footerfakturpenjualan'];
    Free;
  end;
end;

end.
