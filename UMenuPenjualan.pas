unit UMenuPenjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, frxpngimage, ExtCtrls, RzButton, RzPanel, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, cxPC;

type
  TFrm_MenuPenjualan = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzPanel3: TRzPanel;
    RzGroupBox5: TRzGroupBox;
    Image3: TImage;
    RzPanel4: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    BtnPenjualan: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnPiutang: TRzToolButton;
    BtnPembayaran: TRzToolButton;
    RzLabel5: TRzLabel;
    ZQuery1: TZQuery;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    BtnReturPenjualan: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzToolButton4: TRzToolButton;
    RzLabel3: TRzLabel;
    BtneFaktur: TRzToolButton;
    procedure RzLabel2MouseEnter(Sender: TObject);
    procedure RzLabel2MouseLeave(Sender: TObject);
    procedure RzLabel1MouseEnter(Sender: TObject);
    procedure RzLabel1MouseLeave(Sender: TObject);
    procedure RzLabel5MouseEnter(Sender: TObject);
    procedure RzLabel5MouseLeave(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure BtnPenjualanClick(Sender: TObject);
    procedure RzLabel2Click(Sender: TObject);
    procedure BtnPiutangClick(Sender: TObject);
    procedure BtnPembayaranClick(Sender: TObject);
    procedure RzLabel5Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure BtnReturPenjualanClick(Sender: TObject);
    procedure RzLabel1Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure RzToolButton4Click(Sender: TObject);
    procedure RzLabel3MouseEnter(Sender: TObject);
    procedure RzLabel3MouseLeave(Sender: TObject);
    procedure RzLabel3Click(Sender: TObject);
    procedure BtneFakturClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MenuPenjualan: TFrm_MenuPenjualan;

implementation

uses UDM, UMain, USalesQuotation, UPenjualanOrder, UPenjualan, UDaftarPenjualan, UDaftarPiutang, UDaftarPenjualanTunai, UCetakCSV,
      UPembayaranPiutang, UDaftarPembayaranPiutang, UPenjualanDelivery, UReturPenjualan, UDaftarReturPenjualan, UPenjualanDO, UPenjualanTunai;

{$R *.dfm}

procedure TFrm_MenuPenjualan.RzLabel2MouseEnter(Sender: TObject);
begin
  RzLabel2.Font.Style := [fsBold,fsUnderline];
  RzLabel2.Cursor := crHandPoint;
end;

procedure TFrm_MenuPenjualan.RzLabel2MouseLeave(Sender: TObject);
begin
  RzLabel2.Font.Style := [];
  RzLabel2.Cursor := crDrag;
end;

procedure TFrm_MenuPenjualan.RzLabel1MouseEnter(Sender: TObject);
begin
  RzLabel1.Font.Style := [fsBold,fsUnderline];
  RzLabel1.Cursor := crHandPoint;
end;

procedure TFrm_MenuPenjualan.RzLabel1MouseLeave(Sender: TObject);
begin
  RzLabel1.Font.Style := [];
  RzLabel1.Cursor := crDrag;
end;

procedure TFrm_MenuPenjualan.RzLabel5MouseEnter(Sender: TObject);
begin
  RzLabel5.Font.Style := [fsBold,fsUnderline];
  RzLabel5.Cursor := crHandPoint;
end;

procedure TFrm_MenuPenjualan.RzLabel5MouseLeave(Sender: TObject);
begin
  RzLabel5.Font.Style := [];
  RzLabel5.Cursor := crDrag;
end;

procedure TFrm_MenuPenjualan.RzToolButton1Click(Sender: TObject);
var
  f: TFrm_SalesOrder;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Order Penjualan') then begin
    f := TFrm_SalesOrder.Create(Self);
    f.ClearText;
    f.dbgbarang.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.BtnPenjualanClick(Sender: TObject);
var
  f: TFrm_PenjualanPengiriman;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan3')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Pengiriman Barang (Trucking)') then begin
    f := TFrm_PenjualanPengiriman.Create(Self);
    f.ClearText;
    f.dbgbarang.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.RzLabel2Click(Sender: TObject);
var
  f: TFrm_DaftarPengirimanBarang;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan9')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Penjualan') then begin
    f := TFrm_DaftarPengirimanBarang.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.BtnPiutangClick(Sender: TObject);
var
  f: TFrm_DaftarPiutang;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan7')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Piutang Usaha') then begin
    f := TFrm_DaftarPiutang.Create(Self);
    f.RefreshQ;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.BtnPembayaranClick(Sender: TObject);
var
  f: TFrm_PembayaranPiutang;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan8')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Pembayaran Piutang Usaha') then begin
    f := TFrm_PembayaranPiutang.Create(Self);
    f.ClearText;
    f.dbgpembayaran.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.RzLabel5Click(Sender: TObject);
var
  f: TFrm_DaftarReturPenjualan;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan6')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Retur Penjualan') then begin
    f := TFrm_DaftarReturPenjualan.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.RzToolButton2Click(Sender: TObject);
var
  f: TFrm_Penjualan;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan4')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('AR Invoice') then begin
    f := TFrm_Penjualan.Create(Self);
    f.ClearText;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.BtnReturPenjualanClick(Sender: TObject);
var
  f: TFrm_ReturPenjualan;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan6')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Retur Penjualan') then begin
    f := TFrm_ReturPenjualan.Create(Self);
    f.ClearText;
    f.dbgbarang.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.RzLabel1Click(Sender: TObject);
var
  f: TFrm_DaftarPembayaranPiutang;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan8')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Pembayaran Piutang Usaha') then begin
    f := TFrm_DaftarPembayaranPiutang.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.RzToolButton3Click(Sender: TObject);
var
  f: TFrm_DeliveryOrder;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Delivery Order') then begin
    f := TFrm_DeliveryOrder.Create(Self);
    f.ClearText;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.RzToolButton4Click(Sender: TObject);
var
  f: TFrm_PenjualanTunai;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan5')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('AR Invoice + Payment') then begin
    f := TFrm_PenjualanTunai.Create(Self);
    f.ClearText;
    f.dbgbarang.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.RzLabel3MouseEnter(Sender: TObject);
begin
  RzLabel3.Font.Style := [fsBold,fsUnderline];
  RzLabel3.Cursor := crHandPoint;
end;

procedure TFrm_MenuPenjualan.RzLabel3MouseLeave(Sender: TObject);
begin
  RzLabel3.Font.Style := [];
  RzLabel3.Cursor := crDrag;
end;

procedure TFrm_MenuPenjualan.RzLabel3Click(Sender: TObject);
var
  f: TFrm_DaftarPenjualanTunai;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan5')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Penjualan Tunai') then begin
    f := TFrm_DaftarPenjualanTunai.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPenjualan.BtneFakturClick(Sender: TObject);
var
  f: TFrm_DaftarCetakCSV;
  ts: TcxTabSheet;
begin
  if not DM.CekTabOpen('Cetak CSV') then begin
    f := TFrm_DaftarCetakCSV.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

end.
