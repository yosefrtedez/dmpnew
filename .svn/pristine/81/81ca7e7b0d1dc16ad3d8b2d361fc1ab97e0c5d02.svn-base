unit UDataKategori;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RzButton, ExtCtrls, RzPanel;

type
  TFrm_DataKategori = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    BtnBatal: TRzBitBtn;
    BtnOk: TRzBitBtn;
    BtnBaru: TRzBitBtn;
    BtnUbah: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1namakategori: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    BtnUpdate: TRzToolButton;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnBaruClick(Sender: TObject);
    procedure BtnUbahClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DataKategori: TFrm_DataKategori;

implementation

uses UDM, UInputKategori;

{$R *.dfm}

procedure TFrm_DataKategori.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataKategori.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataKategori.RefreshQ;
begin
  QData.Close;
  QData.Open;
end;

procedure TFrm_DataKategori.BtnBaruClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_InputKategori, Frm_InputKategori);
  Frm_InputKategori.ClearText;
  if Frm_InputKategori.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.Con;
      Close;
      SQL.Text := 'insert into tbl_kategori values (:a,:b)';
      ParamByName('a').Value := DM.GenerateNoMaster('kategoribarang');
      ParamByName('b').Value := Frm_InputKategori.txtnama.Text;
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DataKategori.BtnUbahClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_InputKategori, Frm_InputKategori);
  with Frm_InputKategori do begin
    ClearText;
    LID.Caption := QData.FieldValues['nokategori'];
    txtnama.Text := QData.FieldValues['kategoribarang'];
    if Frm_InputKategori.ShowModal = mrok then begin
      with TZQuery.Create(Self)do begin
        Connection := dm.Con;
        Close;
        SQL.Text := 'update tbl_kategori set kategoribarang=:b where nokategori=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('b').Value := txtnama.Text;
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DataKategori.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DataKategori.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnOkClick(nil);
end;

end.
