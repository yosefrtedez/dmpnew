unit UDaftarFooter;

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
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, RzButton,
  ExtCtrls, RzPanel, cxPC;

type
  TFrm_DaftarFooter = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnBaru: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    dbgdataDBTableView1namacabang: TcxGridDBColumn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnBaruClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarFooter: TFrm_DaftarFooter;

implementation

uses UDM, UMain, UInputFooter;

{$R *.dfm}

procedure TFrm_DaftarFooter.BtnSelesaiClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarFooter.RefreshQ;
begin
  QData.Close;
  QData.Open;
end;

procedure TFrm_DaftarFooter.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarFooter.BtnHapusClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data10')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  with TZQuery.Create(Self)do begin
    Connection := DM.Con;
    Close;
    SQL.Clear;
    SQL.Text := 'delete from tbl_footer where nocabang=:na';
    ParamByName('na').Value := QData.FieldValues['nocabang'];
    ExecSQL;

    Free;
    RefreshQ;
  end;
end;

procedure TFrm_DaftarFooter.BtnBaruClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_Footer, Frm_Footer);
  with Frm_Footer do begin
    zqrCabang.Close;
    zqrCabang.Open;
    cxlCabangExit(nil);
    if ShowModal = mrok then begin
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_footer where nocabang=:na';
        ParamByName('na').Value := cxlCabang.EditValue;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_footer values (:a,:b)';
        ParamByName('a').Value := cxlCabang.EditValue;
        ParamByName('b').Value := txtketerangan.Text;
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarFooter.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_Footer, Frm_Footer);
  with TZQuery.Create(Self)do begin
    Connection := DM.Con;
    with Frm_Footer do begin
      zqrCabang.Close;
      zqrCabang.Open;
      cxlCabangExit(nil);
      cxlCabang.EditValue := Qdata.FieldValues['nocabang'];
      txtketerangan.Text := Qdata.FieldValues['footerfakturpenjualan'];
      if Frm_Footer.ShowModal = mrok then begin
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_footer where nocabang=:na';
        ParamByName('na').Value := cxlCabang.EditValue;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_footer values (:a,:b)';
        ParamByName('a').Value := cxlCabang.EditValue;
        ParamByName('b').Value := txtketerangan.Text;
        ExecSQL;
        RefreshQ;
      end;
    end;
    Free;
  end;
end;

end.
