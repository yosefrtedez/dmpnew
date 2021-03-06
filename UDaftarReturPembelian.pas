unit UDaftarReturPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit,
  RzLabel, ExtCtrls, RzPanel, cxPC, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid;

type
  TFrm_DaftarReturPembelian = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    QDatatotal: TFloatField;
    QDatatgltransaksi: TDateField;
    BtnPerincian: TRzBitBtn;
    QDatanokontak: TLargeintField;
    QDatanamakontak: TStringField;
    QDatanoreturpembelian: TLargeintField;
    QDatakodereturpembelian: TStringField;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1kodepenjualan: TcxGridDBColumn;
    dbgdataDBTableView1namakontak: TcxGridDBColumn;
    dbgdataDBTableView1totalpajak: TcxGridDBColumn;
    dbgdataDBTableView1total: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    BtnFilter: TRzToolButton;
    BtnUpdate: TRzToolButton;
    QDatatotalpajak: TFloatField;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarReturPembelian: TFrm_DaftarReturPembelian;
  datedari,datesampai:string;

implementation

uses UReturPembelian, UDM, UFTanggal, UMain;

{$R *.dfm}

procedure TFrm_DaftarReturPembelian.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarReturPembelian.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarReturPembelian.BtnHapusClick(Sender: TObject);
var
  i: Integer;
begin
  if QData.IsEmpty then Exit;
  if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;         
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian9')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Hapus transaksi ?'#10#13'Perhatian: Perubahan setelah dihapus tidak bisa dibatalkan/dikembalikan!',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
      ParamByName('t').Value := 'PR';
      Open;
      First;
      for i:=0 to RecordCount-1 do begin
        DM.HitungHPPAverage(FieldValues['nobarang'],FieldValues['keluar'],FieldValues['hpp']);
        Next;
      end;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
      ParamByName('t').Value := 'PR';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarbarangdetail where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
      ParamByName('t').Value := 'PR';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
      ParamByName('t').Value := 'PR';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
      ParamByName('t').Value := 'PR';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
      ParamByName('t').Value := 'PR';
      ExecSQL;
      Close;
      SQL.Text := 'delete from tbl_returpembelian where noreturpembelian=:np';
      ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_returpembeliandetail where noreturpembelian=:np';
      ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DaftarReturPembelian.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(periodeaktif));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(periodeaktif));
  RefreshQ;
end;

procedure TFrm_DaftarReturPembelian.BtnFilterClick(Sender: TObject);
begin
  Application.CreateForm(TFTanggal, FTanggal);
  with FTanggal do begin
    if ShowModal=mrok then begin
      datedari := FormatDateTime('yyyy-mm-dd',FTanggal.dtpdari.Date);
      datesampai := FormatDateTime('yyyy-mm-dd',FTanggal.dtpsampai.Date);
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarReturPembelian.BtnPerincianClick(Sender: TObject);
var
  i:Integer;
  f: TFrm_ReturPembelian;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian5')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Retur Pembelian') then begin
    f := TFrm_ReturPembelian.Create(Self);
    with f do begin
      ClearText;
      dbgbarang.AddRow();      
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Text := 'select c.*,ifnull(d.kodepembelianinvoice,'+QuotedStr('')+')as kodepembelianinvoice from ' +
                    '(select a.*,ifnull(b.namakontak,'+QuotedStr('')+')as namakontak from ' +
                    '(select * from tbl_returpembelian where noreturpembelian=:np) as a ' +
                    'left join tbl_kontak as b on b.nokontak=a.nokontak)as c ' +
                    'left join tbl_pembelianinvoice as d on d.nopembelianinvoice=c.nopembelianinvoice';
        ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
        Open;
        LID.Caption := FieldValues['noreturpembelian'];
        txtreferensi.Text := FieldValues['kodereturpembelian'];
        txtsupplier.Text := FieldValues['namakontak'];
        LSupplier.Caption := FieldValues['nokontak'];
        dtpfaktur.Date := FieldValues['tgltransaksi'];
        if DM.CekPeriode(FieldValues['tgltransaksi'])=0 then begin
          dtpfaktur.Enabled := False;
        end;
        txtpembelian.Text := FieldValues['kodepembelianinvoice'];
        LNoPembelian.Caption := FieldValues['nopembelianinvoice'];
        LHutang.Caption := FieldValues['noakunhutang'];
        txtketerangan.Text := FieldValues['keterangan'];
        Close;
        SQL.Clear;
        SQL.Text := 'select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                    '(select a.*,ifnull(b.kodegudang,'+QuotedStr('Gudang Utama')+')as kodegudang from ' +
                    '(select c.*,d.kodesatuan from ' +
                    '(select a.*,b.kodebarang,b.namabarang from ' +
                    '(select * from tbl_returpembeliandetail where noreturpembelian=:np) as a ' +
                    'left join tbl_barang as b on b.nobarang=a.nobarang)as c ' +
                    'left join tbl_satuan as d on d.nosatuan=c.nosatuan)as a ' +
                    'left join tbl_gudang as b on b.nogudang=a.nogudang)as a ' +
                    'left join tbl_pajak as b on b.nopajak=a.nopajak';
        ParamByName('np').Value := LID.Caption;
        Open;
        if not IsEmpty then begin
          dbgbarang.ClearRows;
          First;
          for i:=0 to RecordCount-1 do begin
            with dbgbarang do begin
              AddRow();
              Cell[0,i].AsString := FieldValues['kodebarang'];
              Cell[1,i].AsString := FieldValues['namabarang'];
              Cell[2,i].AsFloat := FieldValues['qty'];
              Cell[3,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
              Cell[4,i].AsFloat := FieldValues['hargaretur'];
              Cell[5,i].AsFloat := FieldValues['diskon1'];
              Cell[6,i].AsFloat := FieldValues['diskon2'];
              Cell[7,i].AsFloat := FieldValues['subtotal'];
              Cell[8,i].AsString := FieldValues['kodepajak'];
              Cell[9,i].AsString := FieldValues['kodegudang'];
              Cell[11,i].AsInteger := FieldValues['nobarang'];
              Cell[12,i].AsInteger := FieldValues['nosatuan'];
              Cell[13,i].AsFloat := FieldValues['nilai'];
              Cell[14,i].AsInteger := FieldValues['noakunpersediaan'];
              Cell[15,i].AsInteger := FieldValues['nogudang'];
              Cell[16,i].AsInteger := FieldValues['nopajak'];
              Cell[17,i].AsInteger := FieldValues['tipepajak'];
              Cell[18,i].AsFloat := FieldValues['persenpajak'];
              Cell[19,i].AsFloat := FieldValues['dppbarang'];
              Cell[20,i].AsFloat := FieldValues['ppnbarang'];
              Cell[21,i].AsInteger := FieldValues['noakunpajakpembelian'];
              Cell[22,i].AsInteger := FieldValues['tipebarang'];
            end;
            Next;
          end;
        end;
        UpdateTotal;
      end;
    end;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_DaftarReturPembelian.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnPerincianClick(nil);
end;

procedure TFrm_DaftarReturPembelian.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarReturPembelian.RzBitBtn2Click(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    dm.Q_JurnalVoucher.Close;
    DM.Q_JurnalVoucher.ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
    DM.Q_JurnalVoucher.ParamByName('t').Value := 'PR';
    DM.Q_JurnalVoucher.Open;
    t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
    t.Memo.Text := 'Jurnal Retur Pembelian';
    DM.Rpt_JurnalVoucher.ShowReport(True);
  end;
end;

procedure TFrm_DaftarReturPembelian.RzBitBtn1Click(Sender: TObject);
begin
  with TZQuery.Create(Self) do begin
    Connection := dm.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
    ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
    ParamByName('t').Value := 'PR';
    Open;
    if IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
      ParamByName('a').Value := QData.FieldValues['noreturpembelian'];
      ParamByName('b').Value := 'PR';
      ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QData.FieldValues['total']));
      ExecSQL;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
      ParamByName('t').Value := 'PR';
      ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QData.FieldValues['total']));
      ExecSQL;
    end;
    Free;
    dm.Q_NotaReturPembelian.Close;
    DM.Q_NotaReturPembelian.ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
    DM.Q_NotaReturPembelian.Open;
    dm.Q_NotaTerbilang.Close;
    DM.Q_NotaTerbilang.ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
    DM.Q_NotaTerbilang.ParamByName('t').Value := 'PR';
    DM.Q_NotaTerbilang.Open;
    DM.Nota_ReturPembelian.ShowReport(True);
  end;
end;

end.
