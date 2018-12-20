unit UAPInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, RzEdit, RzButton, NxEdit, StdCtrls, RzCmboBx,
  RzRadChk, Mask, RzBtnEdt, RzLabel, RzPanel, ExtCtrls, cxPC, NxColumns6,
  NxGridView6, NxControls6, NxCustomGrid6, NxVirtualGrid6, NxGrid6, RzTabs, frxClass,
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
  TFrm_APInvoice = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    LSupplier: TRzLabel;
    LID: TRzLabel;
    txtsupplier: TRzButtonEdit;
    txtreferensi: TRzEdit;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    LHutang: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    txttotal: TRzNumericEdit;
    txtbiaya: TRzNumericEdit;
    txtpajak: TRzNumericEdit;
    txtsubtotal: TRzNumericEdit;
    Q1: TZQuery;
    QKas: TZQuery;
    BtnPenerimaan: TRzBitBtn;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    txtpph: TRzNumericEdit;
    RzLabel9: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel18: TRzLabel;
    txtto: TRzButtonEdit;
    LTO: TRzLabel;
    RzLabel8: TRzLabel;
    txtterm: TRzEdit;
    dbgbarang: TNextGrid6;
    NxReportGridView62: TNxReportGridView6;
    NxTextColumn62: TNxTextColumn6;
    NxTextColumn63: TNxTextColumn6;
    NxNumberColumn65: TNxNumberColumn6;
    NxTextColumn64: TNxTextColumn6;
    NxNumberColumn66: TNxNumberColumn6;
    NxNumberColumn616: TNxNumberColumn6;
    NxNumberColumn617: TNxNumberColumn6;
    NxNumberColumn618: TNxNumberColumn6;
    NxTextColumn65: TNxTextColumn6;
    NxNumberColumn619: TNxNumberColumn6;
    NxNumberColumn620: TNxNumberColumn6;
    NxNumberColumn621: TNxNumberColumn6;
    NxNumberColumn622: TNxNumberColumn6;
    NxNumberColumn624: TNxNumberColumn6;
    NxNumberColumn625: TNxNumberColumn6;
    NxNumberColumn626: TNxNumberColumn6;
    NxNumberColumn627: TNxNumberColumn6;
    NxNumberColumn628: TNxNumberColumn6;
    NxNumberColumn629: TNxNumberColumn6;
    NxNumberColumn64: TNxNumberColumn6;
    NxNumberColumn68: TNxNumberColumn6;
    txtlatecharge: TRzNumericEdit;
    txtearlydiscount: TRzNumericEdit;
    txtduedate: TRzNumericEdit;
    txtdiskondays: TRzNumericEdit;
    LBiayaLain: TRzLabel;
    NxNumberColumn61: TNxNumberColumn6;
    NxNumberColumn62: TNxNumberColumn6;
    NxNumberColumn63: TNxNumberColumn6;
    NxNumberColumn67: TNxNumberColumn6;
    NxNumberColumn69: TNxNumberColumn6;
    NxTextColumn61: TNxTextColumn6;
    dtpfaktur: TcxDateEdit;
    dtpto: TcxDateEdit;
    procedure txtsupplierButtonClick(Sender: TObject);
    procedure txtsupplierKeyPress(Sender: TObject; var Key: Char);
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnRekamClick(Sender: TObject);
    procedure txttoButtonClick(Sender: TObject);
    procedure dtpfakturExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure UpdateTotal;
  end;

var
  Frm_APInvoice: TFrm_APInvoice;

implementation

uses UDM, NxCells, UMain, UDataKontak, USetAkun, UDataTO,
  NxIntf6;


{$R *.dfm}

{ TFrm_APInvoice }

procedure TFrm_APInvoice.ClearText;
begin
  LID.Caption := '0';
  txtsupplier.Clear;
  LSupplier.Caption := '0';
  dtpfaktur.Date := tanggalserver;
  dtpfaktur.Enabled := True;
  txtreferensi.Text := DM.GenerateKodeTransaksi('PU',dtpfaktur.Date);
  txtto.Clear;
  LTO.Caption := '0';
  txtterm.Clear;
  txtdiskondays.Value := 0;
  txtduedate.Value := 0;
  txtearlydiscount.Value := 0;
  txtlatecharge.Value := 0;
  dbgbarang.ClearRows;
  txtbiaya.Value := 0;
  txtpph.Value := 0;
  LHutang.Caption := '0';
  LBiayaLain.Caption := '0';
end;

procedure TFrm_APInvoice.UpdateTotal;
var
  dpp,ppn1,pph:Double;
  i:integer;
begin
  dpp := 0;
  ppn1 := 0;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      dpp:=dpp+Cell[16,i].AsFloat;
      ppn1 := ppn1+Cell[17,i].AsFloat;
      pph := pph+Cell[26,i].AsFloat;
    end;
    txtsubtotal.Value := dpp;
    txtpajak.Value := ppn1;
    txttotal.Value := txtsubtotal.Value+txtpajak.Value+txtbiaya.Value-txtpph.Value;
  end;
end;

procedure TFrm_APInvoice.txtsupplierButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 1;
  fungsiblok := 0;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    if LID.Caption <> '0' then begin
      if MessageDlg('Proses ini akan menghapus semua detil transaksi! Lanjutkan ?',mtConfirmation, [mbYes,mbNo],0)= mrno then begin
        Exit;
      end;
    end;
    ClearText;
    txtsupplier.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LSupplier.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
    LHutang.Caption := Frm_DataKontak.QData.FieldValues['noakun'];
  end;
end;

procedure TFrm_APInvoice.txtsupplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtsupplierButtonClick(nil);
end;

procedure TFrm_APInvoice.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_APInvoice.BtnRekamClick(Sender: TObject);
var
  i,notransaksi,nokaskeluar,pakaigiro:Integer;
  kodekaskeluar,kethutang,nogiro,ketpurchase:string;
  tempogiro:TDate;
  t:TfrxMemoView;
begin
  if DM.CekAkunPenting = False then begin
    MessageDlg('Transaksi tidak dapat diproses. Cek kembali Akun Default !!',mtError,[mbOK],0);
    Exit;
  end;
  if dbgbarang.RowCount <=0  then begin
    MessageDlg('Tidak ada transaksi !',mtError,[mbOK],0);
    Exit;
  end;
  if dtpfaktur.Date < dtpto.Date then begin
    MessageDlg('Tanggal invoice tidak boleh sebelum tanggal penerimaan pembelian !',mtError,[mbOK],0);
    dtpfaktur.Date := dtpto.Date;
    Exit;
  end;
  if DM.CekPeriode(dtpfaktur.Date)= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;
  if LHutang.Caption = '0' then begin
    MessageDlg('Akun Hutang Supplier '+txtsupplier.Text+' tidak tersedia!!',mtWarning,[mbOK],0);
    Exit;
  end;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    if LID.Caption = '0' then begin
      if LTO.Caption <> '0' then begin
        // cek sj
        Close;
        SQL.Clear;
        SQL.Text := 'SELECT * FROM tbl_pembelianinvoice WHERE nopembelianterima=:np';
        ParamByName('np').Value := LTO.Caption;
        Open;
        if not IsEmpty then begin
          MessageDlg('No. Penerimaan telah diproses menjadi invoice. Cek data kembali!',mtWarning,[mbOK],0);
          Free;
          Exit;
        end;
      end;
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          notransaksi := DM.GenerateNoMaster('pembelianinvoice');
          txtreferensi.Text := DM.GenerateKodeTransaksi('PU',dtpfaktur.Date);
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
          ParamByName('a').Value := 'PU';
          ParamByName('b').Value := dtpfaktur.Date;
          ParamByName('c').Value := txtreferensi.Text;
          ExecSQL;
          ketpurchase := 'Pembelian, '+txtsupplier.Text+' No. '+txtreferensi.Text;
          Close;
          SQL.Clear;
          // insert tabel pembelian invoice
          SQL.Text := 'insert into tbl_pembelianinvoice values (:a,:b,:c,:d,:e,:f,:h,:i,:j,:k,:l,:n,:o,:p,:q,:r,:s)';
          ParamByName('a').Value := notransaksi;
          ParamByName('b').Value := txtreferensi.Text;
          ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
          ParamByName('d').Value := LTO.Caption;
          ParamByName('e').Value := LSupplier.Caption;
          ParamByName('f').Value := LHutang.Caption;
          ParamByName('h').Value := txtsubtotal.Value;
          ParamByName('i').Value := txtpajak.Value;
          ParamByName('j').Value := txtbiaya.Value;
          ParamByName('k').Value := LBiayaLain.Caption;
          ParamByName('l').Value := txtpph.Value;
          ParamByName('n').Value := txttotal.Value;
          ParamByName('o').Value := Frm_Main.txtuser.Caption;
          ParamByName('p').Value := txtdiskondays.Value;
          ParamByName('q').Value := txtduedate.Value;
          ParamByName('r').Value := txtearlydiscount.Value;
          ParamByName('s').Value := txtlatecharge.Value;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              Close;
              SQL.Clear;
              //masuk tabel pembelian invoice detil barang
              SQL.Text := 'insert into tbl_pembelianinvoicedetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v,:w)';
              ParamByName('a').Value := notransaksi;
              ParamByName('b').Value := Cell[9,i].AsInteger;
              ParamByName('c').Value := Cell[2,i].AsFloat;
              ParamByName('d').Value := Cell[4,i].AsFloat;
              ParamByName('e').Value := Cell[5,i].AsFloat;
              ParamByName('f').Value := Cell[6,i].AsFloat;
              ParamByName('g').Value := Cell[7,i].AsFloat;
              ParamByName('h').Value := Cell[10,i].AsInteger;
              ParamByName('i').Value := Cell[11,i].AsFloat;
              ParamByName('j').Value := Cell[12,i].AsInteger;
              ParamByName('k').Value := Cell[16,i].AsFloat;
              ParamByName('l').Value := Cell[17,i].AsFloat;
              ParamByName('m').Value := Cell[13,i].AsInteger;
              ParamByName('n').Value := Cell[14,i].AsInteger;
              ParamByName('o').Value := Cell[15,i].AsFloat;
              ParamByName('p').Value := Cell[18,i].AsInteger;
              ParamByName('q').Value := Cell[19,i].AsInteger;
              ParamByName('r').Value := Cell[20,i].AsInteger;
              ParamByName('s').Value := Cell[22,i].AsInteger;
              ParamByName('t').Value := Cell[23,i].AsInteger;
              ParamByName('u').Value := Cell[24,i].AsFloat;
              ParamByName('v').Value := Cell[25,i].AsInteger;
              ParamByName('w').Value := Cell[26,i].AsFloat;
              ExecSQL;

              DM.InsertBukuBesarAkun(Cell[20,i].AsInteger,dtpfaktur.Date,'PU',notransaksi,ketpurchase,(Cell[16,i].AsFloat+Cell[17,i].AsFloat)-Cell[26,i].AsFloat,0);
              if Cell[17,i].AsFloat > 0 then begin
                DM.InsertBukuBesarAkun(Cell[18,i].AsInteger,dtpfaktur.Date,'PU',notransaksi,ketpurchase,Cell[17,i].AsFloat,0);
                DM.InsertBukuBesarAkun(Cell[22,i].AsInteger,dtpfaktur.Date,'PU',notransaksi,ketpurchase,0,Cell[17,i].AsFloat);
              end;
            end;
          end;
          if txtbiaya.Value > 0 then begin
            DM.InsertBukuBesarAkun(StrToInt(LBiayaLain.Caption),dtpfaktur.Date,'PU',notransaksi,ketpurchase,txtbiaya.Value,0);
          end;
          DM.InsertBukuBesarAkun(StrToInt(LHutang.Caption),dtpfaktur.Date,'PU',notransaksi,ketpurchase,0,txttotal.Value);

          DM.InsertBukuBesarKontak(StrToInt(LSupplier.Caption),dtpfaktur.Date,'PU',notransaksi,ketpurchase,txttotal.Value);
          dm.con.Commit;
          Screen.Cursor := crDefault;
          if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := notransaksi;
            ParamByName('t').Value := 'PU';
            Open;
            if IsEmpty then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
              ParamByName('a').Value := notransaksi;
              ParamByName('b').Value := 'PU';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.IntValue));
              ExecSQL;
            end else begin
              Close;
              SQL.Clear;
              SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
              ParamByName('np').Value := notransaksi;
              ParamByName('t').Value := 'PU';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.IntValue));
              ExecSQL;
            end;
            dm.Q_NotaPembelianInv.Close;
            DM.Q_NotaPembelianInv.ParamByName('np').Value := notransaksi;
            DM.Q_NotaPembelianInv.Open;
            dm.Q_NotaTerbilang.Close;
            DM.Q_NotaTerbilang.ParamByName('np').Value := notransaksi;
            DM.Q_NotaTerbilang.ParamByName('t').Value := 'PU';
            DM.Q_NotaTerbilang.Open;
            DM.Nota_PembelianInv.ShowReport(True);
          end;
          if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            dm.Q_JurnalVoucher.Close;
            DM.Q_JurnalVoucher.ParamByName('np').Value := notransaksi;
            DM.Q_JurnalVoucher.ParamByName('t').Value := 'PU';
            DM.Q_JurnalVoucher.Open;
            t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
            t.Memo.Text := 'Jurnal AP';
            DM.Rpt_JurnalVoucher.ShowReport(True);
          end;
        except
          on E: Exception do begin
            dm.con.Rollback;
            MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
          end;
        end;
        ClearText;
      end;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT IFNULL(SUM(a.total),0)AS total FROM ' +
                  '(SELECT nopembelianinvoice AS noref,IFNULL(SUM(jumlahbayar+selisih),0)AS total FROM tbl_pembayaranhutangdetail GROUP BY nopembelianinvoice ' +
                  'UNION ' +
                  'SELECT nopembelianinvoice AS noref,IFNULL(SUM(total),0)AS total FROM tbl_returpembelian GROUP BY nopembelianinvoice)AS a ' +
                  'WHERE a.noref=:np';
      ParamByName('np').Value := LID.Caption;
      Open;
      if FieldValues['total']>0 then begin
        MessageDlg('Invoice Pembelian tidak dapat diubah, karena barang telah terpakai oleh transaksi pembayaran / retur'#10#13'Hapus dulu transaksi pembayaran atau retur untuk Transaksi ini.',mtError,[mbOK],0);
        Free;
        Exit;
      end;
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_pembelianinvoicedetail where nopembelianinvoice=:np';
          ParamByName('np').Value := LID.Caption;
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'PU';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'PU';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'PU';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_pembelianinvoice where nopembelianinvoice=:np';
          ParamByName('np').Value := LID.Caption;
          ExecSQL;
          ketpurchase := 'Pembelian, '+txtsupplier.Text+' No. '+txtreferensi.Text;
          Close;
          SQL.Clear;
          // insert tabel pembelian invoice
          SQL.Text := 'insert into tbl_pembelianinvoice values (:a,:b,:c,:d,:e,:f,:h,:i,:j,:k,:l,:n,:o,:p,:q,:r,:s)';
          ParamByName('a').Value := LID.Caption;
          ParamByName('b').Value := txtreferensi.Text;
          ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
          ParamByName('d').Value := LTO.Caption;
          ParamByName('e').Value := LSupplier.Caption;
          ParamByName('f').Value := LHutang.Caption;
          ParamByName('h').Value := txtsubtotal.Value;
          ParamByName('i').Value := txtpajak.Value;
          ParamByName('j').Value := txtbiaya.Value;
          ParamByName('k').Value := LBiayaLain.Caption;
          ParamByName('l').Value := txtpph.Value;
          ParamByName('n').Value := txttotal.Value;
          ParamByName('o').Value := Frm_Main.txtuser.Caption;
          ParamByName('p').Value := txtdiskondays.Value;
          ParamByName('q').Value := txtduedate.Value;
          ParamByName('r').Value := txtearlydiscount.Value;
          ParamByName('s').Value := txtlatecharge.Value;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              Close;
              SQL.Clear;
              //masuk tabel pembelian invoice detil barang
              SQL.Text := 'insert into tbl_pembelianinvoicedetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v,:w)';
              ParamByName('a').Value := LID.Caption;
              ParamByName('b').Value := Cell[9,i].AsInteger;
              ParamByName('c').Value := Cell[2,i].AsFloat;
              ParamByName('d').Value := Cell[4,i].AsFloat;
              ParamByName('e').Value := Cell[5,i].AsFloat;
              ParamByName('f').Value := Cell[6,i].AsFloat;
              ParamByName('g').Value := Cell[7,i].AsFloat;
              ParamByName('h').Value := Cell[10,i].AsInteger;
              ParamByName('i').Value := Cell[11,i].AsFloat;
              ParamByName('j').Value := Cell[12,i].AsInteger;
              ParamByName('k').Value := Cell[16,i].AsFloat;
              ParamByName('l').Value := Cell[17,i].AsFloat;
              ParamByName('m').Value := Cell[13,i].AsInteger;
              ParamByName('n').Value := Cell[14,i].AsInteger;
              ParamByName('o').Value := Cell[15,i].AsFloat;
              ParamByName('p').Value := Cell[18,i].AsInteger;
              ParamByName('q').Value := Cell[19,i].AsInteger;
              ParamByName('r').Value := Cell[20,i].AsInteger;
              ParamByName('s').Value := Cell[22,i].AsInteger;
              ParamByName('t').Value := Cell[23,i].AsInteger;
              ParamByName('u').Value := Cell[24,i].AsFloat;
              ParamByName('v').Value := Cell[25,i].AsInteger;
              ParamByName('w').Value := Cell[26,i].AsFloat;
              ExecSQL;

              DM.InsertBukuBesarAkun(Cell[20,i].AsInteger,dtpfaktur.Date,'PU',StrtoInt(LID.Caption),ketpurchase,(Cell[16,i].AsFloat+Cell[17,i].AsFloat)-Cell[26,i].AsFloat,0);
              if Cell[17,i].AsFloat > 0 then begin
                DM.InsertBukuBesarAkun(Cell[18,i].AsInteger,dtpfaktur.Date,'PU',StrtoInt(LID.Caption),ketpurchase,Cell[17,i].AsFloat,0);
                DM.InsertBukuBesarAkun(Cell[22,i].AsInteger,dtpfaktur.Date,'PU',StrtoInt(LID.Caption),ketpurchase,0,Cell[17,i].AsFloat);
              end;
            end;
          end;
          if txtbiaya.Value > 0 then begin
            DM.InsertBukuBesarAkun(StrToInt(LBiayaLain.Caption),dtpfaktur.Date,'PU',strToInt(LID.Caption),ketpurchase,txtbiaya.Value,0);
          end;
          DM.InsertBukuBesarAkun(StrToInt(LHutang.Caption),dtpfaktur.Date,'PU',strToInt(LID.Caption),ketpurchase,0,txttotal.Value);

          DM.InsertBukuBesarKontak(StrToInt(LSupplier.Caption),dtpfaktur.Date,'PU',strToInt(LID.Caption),ketpurchase,txttotal.Value);
          dm.con.Commit;
          Screen.Cursor := crDefault;
          if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'PU';
            Open;
            if IsEmpty then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
              ParamByName('a').Value := LID.Caption;
              ParamByName('b').Value := 'PU';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.IntValue));
              ExecSQL;
            end else begin
              Close;
              SQL.Clear;
              SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
              ParamByName('np').Value := LID.Caption;
              ParamByName('t').Value := 'PU';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.IntValue));
              ExecSQL;
            end;
            dm.Q_NotaPembelianInv.Close;
            DM.Q_NotaPembelianInv.ParamByName('np').Value := LID.Caption;
            DM.Q_NotaPembelianInv.Open;
            dm.Q_NotaTerbilang.Close;
            DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
            DM.Q_NotaTerbilang.ParamByName('t').Value := 'PU';
            DM.Q_NotaTerbilang.Open;
            DM.Nota_PembelianInv.ShowReport(True);
          end;
          if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            dm.Q_JurnalVoucher.Close;
            DM.Q_JurnalVoucher.ParamByName('np').Value := LID.Caption;
            DM.Q_JurnalVoucher.ParamByName('t').Value := 'PU';
            DM.Q_JurnalVoucher.Open;
            t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
            t.Memo.Text := 'Jurnal AP';
            DM.Rpt_JurnalVoucher.ShowReport(True);
          end;
        except
          on E: Exception do begin
            dm.con.Rollback;
            MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
          end;
        end;
        ClearText;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_APInvoice.txttoButtonClick(Sender: TObject);
var
  j: Integer;
begin
  if LSupplier.Caption = '0' then begin
    MessageDlg('Supplier : harus diisi !',mtError,[mbOK],0);
    txtsupplier.SetFocus;
    Exit;
  end;
  Application.CreateForm(TFrm_DataTO, Frm_DataTO);
  supplierterima := StrToInt(LSupplier.Caption);
  Frm_DataTO.RefreshQ;
  if Frm_DataTO.ShowModal = mrok then begin
    if LTO.Caption = Frm_DataTO.QData.FieldValues['nopembelianterima'] then begin
      Exit;
    end else begin
      if LTO.Caption <> '0' then begin
        if MessageDlg('Proses ini akan menghapus semua detil transaksi! Lanjutkan ?',mtConfirmation, [mbYes,mbNo],0)= mrno then begin
          Exit;
        end;
      end;
      txtto.Text := Frm_DataTO.QData.FieldValues['kodepembelianterima'];
      LTO.Caption := Frm_DataTO.QData.FieldValues['nopembelianterima'];
      dtpto.Date := Frm_DataTO.QData.FieldValues['tglpembelianterima'];  
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_pembelianorder where nopembelianorder=:a';
        ParamByName('a').Value := Frm_DataTO.QData.FieldValues['nopembelianorder'];
        Open;
        txtbiaya.Value := FieldValues['biayalain'];
        txtpph.Value := FieldValues['pph'];
        txtdiskondays.Value := FieldValues['diskonday'];
        txtduedate.Value := FieldValues['duedate'];
        txtearlydiscount.Value := FieldValues['earlydiskon'];
        txtlatecharge.Value := FieldValues['latecharge'];
        txtterm.Text := DM.GetTerm(txtdiskondays.Value,txtduedate.Value,txtearlydiscount.Value,txtlatecharge.Value);
        LBiayaLain.Caption := FieldValues['noakunbiayalain'];
        Close;
        SQL.Clear;
        SQL.Text := 'select a.*,ifnull(b.kodepph,'+QuotedStr('-')+')as kodepph from ' +
                    '(select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                    '(select a.*,d.kodesatuan from ' +
                    '(select a.*,b.kodebarang,b.namabarang from ' +
                    '(select * from tbl_pembelianterimadetail where nopembelianterima=:ib) as a ' +
                    'left join tbl_barang as b on b.nobarang=a.nobarang)as a ' +
                    'left join tbl_satuan as d on d.nosatuan=a.nosatuan)as a ' +
                    'left join tbl_pajak as b on b.nopajak=a.nopajak)as a ' +
                    'left join tbl_pajakpenghasilan as b on b.nopph=a.nopph';
        ParamByName('ib').Value := LTO.Caption;
        Open;
        if not IsEmpty then begin
          dbgbarang.ClearRows;
          First;
          for j:= 0 to RecordCount -1 do begin
            dbgbarang.AddRow();
            dbgbarang.Cell[0,j].AsString := FieldValues['kodebarang'];
            dbgbarang.Cell[1,j].AsString := FieldValues['namabarang'];
            dbgbarang.Cell[2,j].AsFloat := FieldValues['qty'];
            dbgbarang.Cell[3,j].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
            dbgbarang.Cell[4,j].AsFloat := FieldValues['hargabeli'];
            dbgbarang.Cell[5,j].AsFloat := FieldValues['diskon1'];
            dbgbarang.Cell[6,j].AsFloat := FieldValues['diskon2'];
            dbgbarang.Cell[7,j].AsFloat := FieldValues['subtotal'];
            dbgbarang.Cell[8,j].AsString := FieldValues['kodepajak'];
            dbgbarang.Cell[9,j].AsInteger := FieldValues['nobarang'];
            dbgbarang.Cell[10,j].AsInteger := FieldValues['nosatuan'];
            dbgbarang.Cell[11,j].AsFloat := FieldValues['nilai'];
            dbgbarang.Cell[12,j].AsInteger := FieldValues['noakunpersediaan'];
            dbgbarang.Cell[13,j].AsInteger := FieldValues['nopajak'];
            dbgbarang.Cell[14,j].AsInteger := FieldValues['tipepajak'];
            dbgbarang.Cell[15,j].AsFloat := FieldValues['persenpajak'];
            dbgbarang.Cell[16,j].AsFloat := FieldValues['dppbarang'];
            dbgbarang.Cell[17,j].AsFloat := FieldValues['ppnbarang'];
            dbgbarang.Cell[18,j].AsInteger := FieldValues['noakunpajakpembelian'];
            dbgbarang.Cell[19,j].AsInteger := FieldValues['tipebarang'];
            dbgbarang.Cell[20,j].AsInteger := FieldValues['noakunbelumtertagih'];
            dbgbarang.Cell[21,j].AsString := FieldValues['kodepph'];
            dbgbarang.Cell[22,j].AsInteger := FieldValues['noakunpajakpembelianblm'];
            dbgbarang.Cell[23,j].AsInteger := FieldValues['nopph'];
            dbgbarang.Cell[24,j].AsInteger := FieldValues['persenpph'];
            dbgbarang.Cell[25,j].AsInteger := FieldValues['noakunpph'];
            dbgbarang.Cell[26,j].AsInteger := FieldValues['pphbarang'];
            Next;
          end;
        end;
        UpdateTotal;
        Free;
      end;
    end;
  end;

end;

procedure TFrm_APInvoice.dtpfakturExit(Sender: TObject);
begin
  if LID.Caption = '0' then txtreferensi.Text := DM.GenerateKodeTransaksi('PU',dtpfaktur.Date);
end;

end.
