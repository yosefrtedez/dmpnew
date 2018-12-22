unit UMenuProduksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, frxpngimage, ExtCtrls, RzButton, RzPanel, cxPC;

type
  TFrm_MenuProduksi = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    BtnBarang: TRzToolButton;
    BtnKontak: TRzToolButton;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzGroupBox5: TRzGroupBox;
    Image3: TImage;
    RzPanel4: TRzPanel;
    RzLabel1: TRzLabel;
    BtnRekening: TRzToolButton;
    BtnMenu: TRzToolButton;
    RzLabel2: TRzLabel;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzLabel3: TRzLabel;
    procedure BtnRekeningClick(Sender: TObject);
    procedure BtnSatuanClick(Sender: TObject);
    procedure BtnKontakClick(Sender: TObject);
    procedure BtnBarangClick(Sender: TObject);
    procedure RzLabel1MouseEnter(Sender: TObject);
    procedure RzLabel1MouseLeave(Sender: TObject);
    procedure RzLabel1Click(Sender: TObject);
    procedure RzLabel2MouseEnter(Sender: TObject);
    procedure RzLabel2MouseLeave(Sender: TObject);
    procedure RzLabel2Click(Sender: TObject);
    procedure BtnMenuClick(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure RzLabel3MouseEnter(Sender: TObject);
    procedure RzLabel3MouseLeave(Sender: TObject);
    procedure RzLabel3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MenuProduksi: TFrm_MenuProduksi;

implementation

uses UDaftarAkun, UMain, UDM, UDaftarSatuan, UDaftarKontak, UDaftarBarang, UDaftarKelompokBarang, UDaftarGudang, UDaftarPajak, UDaftarPPh, UDaftarBarang1, UDaftarFooter;

{$R *.dfm}

procedure TFrm_MenuProduksi.BtnRekeningClick(Sender: TObject);
var
  f: TFrm_DaftarAkun;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;                   
  if not DM.CekTabOpen('Data Akun') then begin
    f := TFrm_DaftarAkun.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuProduksi.BtnSatuanClick(Sender: TObject);
var
  f: TFrm_DaftarSatuan;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data4')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Data Satuan Pengukuran') then begin
    f := TFrm_DaftarSatuan.Create(Self);
    f.RefreshQ;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuProduksi.BtnKontakClick(Sender: TObject);
var
  f: TFrm_DaftarKontak;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Data Kontak') then begin
    f := TFrm_DaftarKontak.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuProduksi.BtnBarangClick(Sender: TObject);
var
  f: TFrm_DaftarBarang;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data3')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Barang') then begin
    f := TFrm_DaftarBarang.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuProduksi.RzLabel1MouseEnter(Sender: TObject);
begin
  RzLabel1.Font.Style := [fsBold,fsUnderline];
  RzLabel1.Cursor := crHandPoint;
end;

procedure TFrm_MenuProduksi.RzLabel1MouseLeave(Sender: TObject);
begin
  RzLabel1.Font.Style := [];
  RzLabel1.Cursor := crDrag;
end;

procedure TFrm_MenuProduksi.RzLabel1Click(Sender: TObject);
var
  f: TFrm_DaftarKelompokBarang;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data8')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Data Kategori Produk') then begin
    f := TFrm_DaftarKelompokBarang.Create(Self);
    f.RefreshQ;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuProduksi.RzLabel2MouseEnter(Sender: TObject);
begin
  RzLabel2.Font.Style := [fsBold,fsUnderline];
  RzLabel2.Cursor := crHandPoint;
end;

procedure TFrm_MenuProduksi.RzLabel2MouseLeave(Sender: TObject);
begin
  RzLabel2.Font.Style := [];
  RzLabel2.Cursor := crDrag;
end;

procedure TFrm_MenuProduksi.RzLabel2Click(Sender: TObject);
var
  f: TFrm_DaftarGudang;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data9')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Data Lokasi / Gudang') then begin
    f := TFrm_DaftarGudang.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuProduksi.BtnMenuClick(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data5')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
end;

procedure TFrm_MenuProduksi.RzToolButton1Click(Sender: TObject);
var
  f: TFrm_DaftarPajak;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data6')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Data Pajak') then begin
    f := TFrm_DaftarPajak.Create(Self);
    f.RefreshQ;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuProduksi.RzToolButton2Click(Sender: TObject);
var
  f: TFrm_DaftarPPh;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data7')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Data Pajak Penghasilan') then begin
    f := TFrm_DaftarPPh.Create(Self);
    f.RefreshQ;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuProduksi.RzToolButton3Click(Sender: TObject);
var
  f: TFrm_DaftarBarang1;
  ts: TcxTabSheet;
begin
  if not DM.CekTabOpen('Data Barang') then begin
    f := TFrm_DaftarBarang1.Create(Self);
    f.RefreshQ;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuProduksi.RzLabel3MouseEnter(Sender: TObject);
begin
  RzLabel3.Font.Style := [fsBold,fsUnderline];
  RzLabel3.Cursor := crHandPoint;
end;

procedure TFrm_MenuProduksi.RzLabel3MouseLeave(Sender: TObject);
begin
  RzLabel3.Font.Style := [];
  RzLabel3.Cursor := crDrag;
end;

procedure TFrm_MenuProduksi.RzLabel3Click(Sender: TObject);
var
  f: TFrm_DaftarFooter;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data13')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Data Footer') then begin
    f := TFrm_DaftarFooter.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.RefreshQ;
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

end.
