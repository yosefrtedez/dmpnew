unit UDaftarTransferKas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPC, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RzButton, ExtCtrls, RzPanel, frxClass;

type
  TFrm_DaftarTransfer = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    BtnCetak: TRzBitBtn;
    BtnApprove: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1kodepenerimaan: TcxGridDBColumn;
    dbgdataDBTableView1total: TcxGridDBColumn;
    dbgdataDBTableView1approve: TcxGridDBColumn;
    dbgdataDBTableView1cair: TcxGridDBColumn;
    dbgdataDBTableView1iscancel: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    QDatanoreferensi: TLargeintField;
    QDatatgltransaksi: TDateField;
    QDataketerangan: TStringField;
    QDatanokasdari: TLargeintField;
    QDatanokastransit: TLargeintField;
    QDatanokaske: TLargeintField;
    QDatanilai: TFloatField;
    QDataapprove: TSmallintField;
    QDatacair: TSmallintField;
    QDataiscancel: TSmallintField;
    QDatanamauser: TStringField;
    QDatakasdari: TStringField;
    QDatakaske: TStringField;
    dbgdataDBTableView1Column1: TcxGridDBColumn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnApproveClick(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarTransfer: TFrm_DaftarTransfer;
  datedari,datesampai:string;

implementation

uses UDM, UFTanggal, UMain, RzStatus, UTransferKas, UTanggal;

{$R *.dfm}

procedure TFrm_DaftarTransfer.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarTransfer.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarTransfer.BtnFilterClick(Sender: TObject);
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

procedure TFrm_DaftarTransfer.BtnHapusClick(Sender: TObject);
var
  md :string;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas7')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;
  {if MessageDlg('Hapus transaksi ?'#10#13'Perhatian: Perubahan setelah dihapus tidak bisa dibatalkan/dikembalikan!',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.Con;
      if QData.FieldValues['giro'] = 1 then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_giro where noreferensi=:a and tipe=:b';
        ParamByName('a').Value := QData.FieldValues['nopenerimaan'];
        ParamByName('b').Value := 'CI';
        Open;
        if FieldValues['posting'] = 1 then begin
          md := 'Transaksi ini tidak dapat dihapus/diedit karena giro telah cair!';
          MessageDlg(md,mtWarning,[mbOK],0);
          Free;
          exit;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopenerimaan'];
      ParamByName('t').Value := 'CI';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopenerimaan'];
      ParamByName('t').Value := 'CI';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_giro where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopenerimaan'];
      ParamByName('t').Value := 'CI';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_penerimaanlain where nopenerimaan=:np';
      ParamByName('np').Value := QData.FieldValues['nopenerimaan'];
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_penerimaanlaindetail where nopenerimaan=:np';
      ParamByName('np').Value := QData.FieldValues['nopenerimaan'];
      ExecSQL;
      Free;
      RefreshQ;
    end;
  end;       }
  if MessageDlg('Transaksi dibatalkan ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    if QData.FieldValues['iscancel'] = 0 then begin
      if QData.FieldValues['approve'] = 0 then begin
        with TZQuery.Create(Self)do begin
          Connection := dm.Con;
          Close;
          SQL.Clear;
          SQL.Text := 'update tbl_transferkas set iscancel=:ic where noreferensi=:np';
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
          ParamByName('ic').Value := 1;
          ExecSQL;
          Free;
          RefreshQ;
        end;
      end else begin
        MessageDlg('Penerimaan pembayaran telah disetujui. Transaksi tidak dapat dibatalkan!',mtError,[mbOK],0);
      end;
    end;
  end;
end;

procedure TFrm_DaftarTransfer.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(periodeaktif));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(periodeaktif));
  RefreshQ;
end;

procedure TFrm_DaftarTransfer.BtnPerincianClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_TransferKas, Frm_TransferKas);
  Frm_TransferKas.ClearText;
  with Frm_TransferKas do begin
    ClearText;
    LID.Caption := QData.FieldValues['noreferensi'];
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT a.*,b.namaakun as kaske FROM ' +
                  '(SELECT a.*,b.namaakun as kasdari FROM ' +
                  '(SELECT * FROM tbl_transferkas where noreferensi=:np)AS a ' +
                  'LEFT JOIN tbl_akun AS b ON b.noakun=a.nokasdari)as a ' +
                  'LEFT JOIN tbl_akun AS b ON b.noakun=a.nokaske';
      ParamByName('np').Value := LID.Caption;
      Open;
      txtketerangan.Text := FieldValues['keterangan'];
      txtdari.Text := FieldValues['kasdari'];
      LKasDari.Caption := FieldValues['nokasdari'];
      LKasTransit.Caption := FieldValues['nokastransit'];
      txtke.Text := FieldValues['kasdari'];
      LKasKe.Caption := FieldValues['nokaske'];
      LKasKeTransit.Caption := FieldValues['nokasketransit'];
      dtptanggal.Date := FieldValues['tgltransaksi'];
      if DM.CekPeriode(FieldValues['tgltransaksi'])=0 then begin
        dtptanggal.Enabled := False;
      end;

      txtjumlah.Value := FieldValues['nilai'];
      if FieldValues['approve'] = 1 then
        cbapprove.Checked := True
      else cbapprove.Checked := False;
      if FieldValues['cair'] = 1 then
        cbcair.Checked := True
      else cbcair.Checked := False;
      if FieldValues['iscancel'] = 1 then
        cbcancel.Checked := True
      else cbcancel.Checked := False;
      if FieldValues['approve'] = 1 then BtnSimpan.Visible := False;

      if Frm_TransferKas.ShowModal = mrok then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_transferkas set tgltransaksi=:b,keterangan=:c,nokasdari=:d,nokaske=:f,nilai=:g,nokastransit=:h,nokasketransit=:i where noreferensi=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('b').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
        ParamByName('c').Value := txtketerangan.Text;
        ParamByName('d').Value := LKasDari.Caption;
        ParamByName('f').Value := LKasKe.Caption;
        ParamByName('g').Value := txtjumlah.Value;
        ParamByName('h').Value := LKasTransit.Caption;
        ParamByName('i').Value := LKasKeTransit.Caption;
        ExecSQL;
        if MessageDlg('Cetak ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'TR';
          Open;
          if IsEmpty then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := 'TR';
            ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(Frm_TransferKas.txtjumlah.Value));
            ExecSQL;
          end else begin
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'TR';
            ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(Frm_TransferKas.txtjumlah.Value));
            ExecSQL;
          end;
          dm.Q_NotaPenerimaanKas.Close;
          DM.Q_NotaPenerimaanKas.ParamByName('np').Value := LID.Caption;
          DM.Q_NotaPenerimaanKas.Open;
          dm.Q_NotaTerbilang.Close;
          DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
          DM.Q_NotaTerbilang.ParamByName('t').Value := 'TR';
          DM.Q_NotaTerbilang.Open;
          DM.Nota_PenerimaanKas.ShowReport(True);
        end;
      end;
      Free;
    end;
  end;

end;

procedure TFrm_DaftarTransfer.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnPerincianClick(nil);
end;

procedure TFrm_DaftarTransfer.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarTransfer.BtnApproveClick(Sender: TObject);
var
  i: Integer;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas6')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.FieldValues['iscancel'] = 0 then begin
    if QData.FieldValues['approve'] = 0 then begin
      if MessageDlg('Transfer Kas/Bank telah disetujui ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Application.CreateForm(TFrm_Tanggal, Frm_Tanggal);
        if Frm_Tanggal.ShowModal = mrok then begin
          with TZQuery.Create(Self)do begin
            Connection := dm.con;
            Screen.Cursor := crSQLWait;
            try
              dm.con.StartTransaction;
              Close;
              SQL.Clear;
              SQL.Text := 'select * from tbl_transferkas where noreferensi=:nk';
              ParamByName('nk').Value := QData.FieldValues['noreferensi'];
              Open;

              DM.InsertBukuBesarAkun(FieldValues['nokasketransit'],Frm_Tanggal.dtpdari.Date,'TR',QData.FieldValues['noreferensi'],'Transfer Kas/Bank',FieldValues['nilai'],0);
              DM.InsertBukuBesarAkun(FieldValues['nokastransit'],Frm_Tanggal.dtpdari.Date,'TR',QData.FieldValues['noreferensi'],'Transfer Kas/Bank',0,FieldValues['nilai']);

              Close;
              SQL.Clear;
              SQL.Text := 'update tbl_transferkas set approve=:ap where noreferensi=:a';
              ParamByName('a').Value := QData.FieldValues['noreferensi'];
              ParamByName('ap').Value := 1;
              ExecSQL;
              dm.con.Commit;
              Screen.Cursor := crDefault;     
            except
              on E: Exception do begin
                dm.con.Rollback;
                MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
              end;
            end;
            Free;
          end;
          RefreshQ;
        end;
      end;
    end;
  end;
end;

procedure TFrm_DaftarTransfer.BtnCetakClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if QData.IsEmpty then Exit;
  if QData.FieldValues['approve'] = 0 then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['noreferensi'];
      ParamByName('t').Value := 'TR';
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        ParamByName('b').Value := 'TR';
        ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QData.FieldValues['nilai']));
        ExecSQL;
      end else begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := QData.FieldValues['noreferensi'];
        ParamByName('t').Value := 'TR';
        ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QData.FieldValues['nilai']));
        ExecSQL;
      end;
      dm.Q_NotaTransferKas.Close;
      DM.Q_NotaTransferKas.ParamByName('np').Value := QData.FieldValues['noreferensi'];;
      DM.Q_NotaTransferKas.Open;
      dm.Q_NotaTerbilang.Close;
      DM.Q_NotaTerbilang.ParamByName('np').Value := QData.FieldValues['noreferensi'];;
      DM.Q_NotaTerbilang.ParamByName('t').Value := 'TR';
      DM.Q_NotaTerbilang.Open;
      DM.Nota_TransferKas.ShowReport(True);
      Free;
    end;
  end else begin
    if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      dm.Q_JurnalVoucher.Close;
      DM.Q_JurnalVoucher.ParamByName('np').Value := QData.FieldValues['noreferensi'];
      DM.Q_JurnalVoucher.ParamByName('t').Value := 'TR';
      DM.Q_JurnalVoucher.Open;
      t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
      t.Memo.Text := 'Jurnal Voucher';
      DM.Rpt_JurnalVoucher.ShowReport(True);
    end;
  end;
end;

end.
