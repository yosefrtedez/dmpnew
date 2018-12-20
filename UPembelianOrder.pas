unit UPembelianOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, RzRadChk, RzButton, StdCtrls, Mask, RzBtnEdt, RzLabel,
  RzPanel, ExtCtrls, ImgList, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, frxClass, frxDBSet, NxEdit, ComCtrls, RzDTP,
  RzLine, RzCmboBx, cxPC, NxGridView6, NxColumns6, NxControls6,
  NxCustomGrid6, NxVirtualGrid6, NxGrid6, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar;

type
  TFrm_PembelianOrder = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    txtsupplier: TRzButtonEdit;
    RzLabel2: TRzLabel;
    txtreferensi: TRzEdit;
    RzLabel4: TRzLabel;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzPanel3: TRzPanel;
    Q1: TZQuery;
    LSupplier: TRzLabel;
    RzPanel4: TRzPanel;
    cbselesai: TRzCheckBox;
    QKas: TZQuery;
    RzLabel18: TRzLabel;
    QMataUang: TZQuery;
    LID: TRzLabel;
    txtrequest: TRzButtonEdit;
    LRequest: TLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    txtppn: TRzNumericEdit;
    txtsubtotal: TRzNumericEdit;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    txtbiaya: TRzNumericEdit;
    RzLabel3: TRzLabel;
    RzLabel8: TRzLabel;
    txtpph: TRzNumericEdit;
    txttotal: TRzNumericEdit;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    cbapprove: TRzCheckBox;
    dbgbarang: TNextGrid6;
    NxTextColumn61: TNxTextColumn6;
    NxTextColumn62: TNxTextColumn6;
    NxNumberColumn61: TNxNumberColumn6;
    NxNumberColumn62: TNxNumberColumn6;
    NxTextColumn63: TNxTextColumn6;
    NxNumberColumn63: TNxNumberColumn6;
    NxNumberColumn64: TNxNumberColumn6;
    NxNumberColumn65: TNxNumberColumn6;
    NxNumberColumn66: TNxNumberColumn6;
    NxTextColumn64: TNxTextColumn6;
    NxNumberColumn67: TNxNumberColumn6;
    NxNumberColumn68: TNxNumberColumn6;
    NxNumberColumn69: TNxNumberColumn6;
    NxNumberColumn610: TNxNumberColumn6;
    NxNumberColumn611: TNxNumberColumn6;
    NxNumberColumn612: TNxNumberColumn6;
    NxNumberColumn613: TNxNumberColumn6;
    NxNumberColumn614: TNxNumberColumn6;
    NxReportGridView61: TNxReportGridView6;
    RzPanel5: TRzPanel;
    LTerima: TRzLabel;
    RzLabel9: TRzLabel;
    txtterm: TRzButtonEdit;
    txtdiskondays: TRzNumericEdit;
    txtduedate: TRzNumericEdit;
    txtearlydiscount: TRzNumericEdit;
    txtlatecharge: TRzNumericEdit;
    LBiayaLain: TRzLabel;
    BtnBiaya: TRzToolButton;
    NxTextColumn65: TNxTextColumn6;
    NxNumberColumn615: TNxNumberColumn6;
    NxNumberColumn616: TNxNumberColumn6;
    NxNumberColumn617: TNxNumberColumn6;
    dtpfaktur: TcxDateEdit;
    procedure txtsupplierButtonClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure dbgbarangAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure BtnRekamClick(Sender: TObject);
    procedure txtsupplierKeyPress(Sender: TObject; var Key: Char);
    procedure dbgbarangCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure dbgbarangExit(Sender: TObject);
    procedure dbgbarangKeyPress(Sender: TObject; var Key: Char);
    procedure txtrequestButtonClick(Sender: TObject);
    procedure txtrequestKeyPress(Sender: TObject; var Key: Char);
    procedure txtbiayaChange(Sender: TObject);
    procedure txttermButtonClick(Sender: TObject);
    procedure txttermKeyPress(Sender: TObject; var Key: Char);
    procedure BtnBiayaClick(Sender: TObject);
    procedure dtpfakturExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure UpdateTotal;
    function CekPR(ANoPR, ANoBarang, ANoSatuan:Integer):Double;
  end;

var
  Frm_PembelianOrder: TFrm_PembelianOrder;
  potsup: Double;

implementation

uses UDM, UMain, UDataKontak, UDataSatuan, UDataPembelianRequest, UDataPajak, USetAkun,
  NxCells, NxIntf6, UTermOfPayment, UDataPPh;

{$R *.dfm}

procedure TFrm_PembelianOrder.txtsupplierButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 1;
  fungsiblok := 0;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    if LRequest.Caption <> '0' then begin
      if MessageDlg('Proses ini akan menghapus semua detil transaksi! Lanjutkan ?',mtConfirmation, [mbYes,mbNo],0)= mrno then begin
        Exit;
      end;
    end;
    ClearText;
    dbgbarang.AddRow();
    txtsupplier.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LSupplier.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
    potsup := Frm_DataKontak.QData.FieldValues['diskon'];
    txtdiskondays.Value := Frm_DataKontak.QData.FieldValues['diskonday'];
    txtduedate.Value := Frm_DataKontak.QData.FieldValues['duedate'];
    txtearlydiscount.Value := Frm_DataKontak.QData.FieldValues['earlydiskon'];
    txtlatecharge.Value := Frm_DataKontak.QData.FieldValues['latecharge'];
    txtterm.Text := DM.GetTerm(txtdiskondays.Value,txtduedate.Value,txtearlydiscount.Value,txtlatecharge.Value);
  end;
end;

procedure TFrm_PembelianOrder.ClearText;
begin
  LID.Caption := '0';
  LTerima.Caption := '0';
  txtsupplier.Clear;
  LSupplier.Caption := '0';
  txtrequest.Clear;
  LRequest.Caption := '0';
  dtpfaktur.Date := tanggalserver;
  dtpfaktur.Enabled := True;
  txtreferensi.Text := DM.GenerateKodeTransaksi('PO',dtpfaktur.Date);
  dbgbarang.ClearRows;
  cbselesai.Checked := False;
  txtbiaya.Value := 0;
  txtpph.Value := 0;
  UpdateTotal;
  cbapprove.Checked := False;
  txtdiskondays.Value := 0;
  txtduedate.Value := 0;
  txtearlydiscount.Value := 0;
  txtlatecharge.Value := 0;
  txtterm.Clear;
  LBiayaLain.Caption := '0';
  txtbiaya.Value := 0;
  txtpph.Value :=0;
end;

procedure TFrm_PembelianOrder.UpdateTotal;
var
  dpp,ppn1,pph:Double;
  i:integer;
begin
  dpp := 0;
  ppn1 := 0;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      dpp := dpp+Cell[16,i].AsFloat;
      ppn1 := ppn1+Cell[17,i].AsFloat;
      pph := pph+Cell[21,i].AsFloat;
    end;
    txtsubtotal.Value := dpp;
    txtppn.Value := ppn1;
    txtpph.Value := pph;
    txttotal.Value := txtsubtotal.Value + txtppn.Value + txtbiaya.Value - txtpph.Value;
  end;
end;

procedure TFrm_PembelianOrder.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_PembelianOrder.dbgbarangAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  total:Double;
begin
  if ACol = 3 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[3,ARow].AsFloat := 0;
      Exit;
    end;
    if dbgbarang.Cell[3,ARow].AsFloat > dbgbarang.Cell[2,ARow].AsFloat then begin
      dbgbarang.Cell[3,ARow].AsFloat := dbgbarang.Cell[2,ARow].AsFloat;
    end;
  end else if ACol = 5 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[5,ARow].AsFloat := 0;
      Exit;
    end;
  end else if ACol = 6 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[6,ARow].AsFloat := 0;
      Exit;
    end;
  end else if ACol = 7 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[7,ARow].AsFloat := 0;
      Exit;
    end;
  end;
  total := dbgbarang.Cell[3,ARow].AsFloat*dbgbarang.Cell[5,ARow].AsFloat;
  total := total-((total*dbgbarang.Cell[6,ARow].AsFloat)/100);
  total := total-dbgbarang.Cell[7,ARow].AsFloat;
  if total < 0 then begin
    dbgbarang.Cell[6,ARow].AsFloat := 100;
    dbgbarang.Cell[7,ARow].AsFloat := 0;
    total := 0;
  end;
  dbgbarang.Cell[8,ARow].AsFloat := total;
  if dbgbarang.Cell[13,ARow].AsInteger = 0 then begin
    dbgbarang.Cell[16,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
    dbgbarang.Cell[17,ARow].AsFloat := 0;
  end else begin
    if dbgbarang.Cell[14,ARow].AsInteger = 0 then begin
      dbgbarang.Cell[16,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
      dbgbarang.Cell[17,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat*dbgbarang.Cell[15,ARow].AsFloat/100)*100)/100;
    end else if dbgbarang.Cell[14,ARow].AsInteger = 1 then begin
      dbgbarang.Cell[16,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat/(1+(dbgbarang.Cell[15,ARow].AsFloat/100)))*100)/100;
      dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat-dbgbarang.Cell[16,ARow].AsFloat;
    end;
  end;
  if dbgbarang.Cell[19,ARow].AsInteger = 0 then begin
    dbgbarang.Cell[21,ARow].AsFloat := 0;
  end else begin
    dbgbarang.Cell[21,ARow].AsFloat := Int((dbgbarang.Cell[16,ARow].AsFloat*dbgbarang.Cell[20,ARow].AsFloat/100)*100)/100;
  end;
  UpdateTotal;
end;

procedure TFrm_PembelianOrder.BtnRekamClick(Sender: TObject);
var
  i,notransaksi,jumlahbarang:Integer;
  t:TfrxMemoView;
begin
  if txtsupplier.Text = '' then begin
    MessageDlg('Supplier: harus diisi !',mtError,[mbOK],0);
    txtsupplier.SetFocus;
    Exit;
  end;
  if LRequest.Caption = '0' then begin
    MessageDlg('Permintaan Barang: harus diisi !',mtError,[mbOK],0);
    txtrequest.SetFocus;
    Exit;
  end;
  if LBiayaLain.Caption = '0' then begin
    if txtbiaya.Value > 0 then begin
      MessageDlg('Akun Biaya Lain: harus dipilih !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  with dbgbarang do begin
    jumlahbarang := 0;
    for i:=0 to RowCount-1 do begin
      jumlahbarang := jumlahbarang+dbgbarang.Cell[3,i].AsInteger;
    end;
    if jumlahbarang <= 0 then begin
      MessageDlg('Tidak ada transaksi !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  {if DM.CekPlafon(StrToInt(LSupplier.Caption),txttotal.Value)=False then begin
    if MessageDlg('Transaksi ini melebihi batas kredit supplier. Diperlukan Persetujuan!'#10#13'Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)=mrno then begin
      Exit;
    end else cbapprove.Checked := False;
  end else cbapprove.Checked := True; }
  if DM.CekPeriode(dtpfaktur.Date)= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    if LID.Caption = '0' then begin
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          notransaksi := DM.GenerateNoMaster('pembelianorder');
          txtreferensi.Text := DM.GenerateKodeTransaksi('PO',dtpfaktur.Date);
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
          ParamByName('a').Value := 'PO';
          ParamByName('b').Value := dtpfaktur.Date;
          ParamByName('c').Value := txtreferensi.Text;
          ExecSQL;
          Close;
          SQL.Clear;
          // masuk ke tabel pembelian
          SQL.Text := 'insert into tbl_pembelianorder values (:a,:b,:c,:d,:e,:g,:h,:i,:j,:k,:l,:n,:p,:q,:r,:s,:t,:u,:v)';
          ParamByName('a').Value := notransaksi;
          ParamByName('b').Value := txtreferensi.Text;
          ParamByName('c').Value := LSupplier.Caption;
          ParamByName('d').Value := LRequest.Caption;
          ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
          ParamByName('g').Value := txttotal.Value;
          ParamByName('h').Value := txtsubtotal.Value;
          ParamByName('i').Value := txtppn.Value;
          ParamByName('j').Value := Frm_Main.txtuser.Caption;
          if cbselesai.Checked = True then
            ParamByName('k').Value := 1
          else ParamByName('k').Value := 0;
          ParamByName('l').Value := txtbiaya.Value;
          ParamByName('n').Value := txtpph.Value;
          ParamByName('p').Value := 0;
          ParamByName('q').Value := null;
          ParamByName('r').Value := txtdiskondays.Value;
          ParamByName('s').Value := txtduedate.Value;
          ParamByName('t').Value := txtearlydiscount.Value;
          ParamByName('u').Value := txtlatecharge.Value;
          ParamByName('v').Value := LBiayaLain.Caption;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              if Cell[3,i].AsFloat > 0 then begin
                Close;
                SQL.Clear;
                //masuk tabel pembelian order detil
                SQL.Text := 'insert into tbl_pembelianorderdetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q)';
                ParamByName('a').Value := notransaksi;
                ParamByName('b').Value := Cell[10,i].AsInteger;
                ParamByName('c').Value := Cell[3,i].AsFloat;
                ParamByName('d').Value := Cell[5,i].AsFloat;
                ParamByName('e').Value := Cell[6,i].AsFloat;
                ParamByName('f').Value := Cell[7,i].AsFloat;
                ParamByName('g').Value := Cell[8,i].AsFloat;
                ParamByName('h').Value := Cell[11,i].AsInteger;
                ParamByName('i').Value := Cell[12,i].AsFloat;
                ParamByName('j').Value := Cell[16,i].AsFloat;
                ParamByName('k').Value := Cell[17,i].AsFloat;
                ParamByName('l').Value := Cell[13,i].AsInteger;
                ParamByName('m').Value := Cell[14,i].AsInteger;
                ParamByName('n').Value := Cell[15,i].AsFloat;
                ParamByName('o').Value := Cell[19,i].AsFloat;
                ParamByName('p').Value := Cell[20,i].AsFloat;
                ParamByName('q').Value := Cell[21,i].AsFloat;
                ExecSQL;
              end;
            end;
          end;
          dm.con.Commit;
          Screen.Cursor := crDefault;
          if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := notransaksi;
            ParamByName('t').Value := 'PO';
            Open;
            if IsEmpty then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
              ParamByName('a').Value := notransaksi;
              ParamByName('b').Value := 'PO';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
              ExecSQL;
            end else begin
              Close;
              SQL.Clear;
              SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
              ParamByName('np').Value := notransaksi;
              ParamByName('t').Value := 'PO';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
              ExecSQL;
            end;
            dm.Q_NotaPembelianPO.Close;
            DM.Q_NotaPembelianPO.ParamByName('np').Value := notransaksi;
            DM.Q_NotaPembelianPO.Open;
            dm.Q_NotaTerbilang.Close;
            DM.Q_NotaTerbilang.ParamByName('np').Value := notransaksi;
            DM.Q_NotaTerbilang.ParamByName('t').Value := 'PO';
            DM.Q_NotaTerbilang.Open;
            t := TfrxMemoView(DM.Nota_PembelianPO.FindObject('Memo1'));
            if cbapprove.Checked = True then begin
              t.Memo.Text := 'Order Pembelian';
              t.Font.Size := 18;
            end else begin
              t.Memo.Text := 'Order Pembelian Proforma';
              t.Font.Size := 14;
            end;
            t := TfrxMemoView(DM.Nota_PembelianPO.FindObject('Memo40'));
            if cbapprove.Checked = True then begin
              t.Memo.Text := 'Purchasing';
            end else begin
              t.Memo.Text := 'Dibuat Oleh';
            end;
            t := TfrxMemoView(DM.Nota_PembelianPO.FindObject('Memo33'));
            if cbapprove.Checked = True then begin
              t.Memo.Text := 'Supplier';
            end else begin
              t.Memo.Text := 'Disetujui Oleh';
            end;
            DM.Nota_PembelianPO.ShowReport(True);
          end;
        except
          on E: Exception do begin
            dm.con.Rollback;
            MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
          end;
        end;
        ClearText;
        dbgbarang.AddRow();
      end;
    end else begin
      if LTerima.Caption = '0' then begin
        if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Screen.Cursor := crSQLWait;
          try
            dm.con.StartTransaction;
            Close;
            SQL.Clear;
            // update ke tabel pembelian order
            SQL.Text := 'update tbl_pembelianorder set nokontak=:b,nopembelianrequest=:c,tgltransaksi=:d,total=:f,totaldpp=:g,totalpajak=:h,selesai=:i,biayalain=:j,pph=:l, ' +
                        'diskonday=:r,duedate=:s,earlydiskon=:t,latecharge=:u,noakunbiayalain=:k where nopembelianorder=:a';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := LSupplier.Caption;
            ParamByName('c').Value := LRequest.Caption;
            ParamByName('d').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
            ParamByName('f').Value := txttotal.Value;
            ParamByName('g').Value := txtsubtotal.Value;
            ParamByName('h').Value := txtppn.Value;
            if cbselesai.Checked = True then
              ParamByName('i').Value := 1
            else ParamByName('i').Value := 0;
            ParamByName('j').Value := txtbiaya.Value;
            ParamByName('l').Value := txtpph.Value;
            ParamByName('r').Value := txtdiskondays.Value;
            ParamByName('s').Value := txtduedate.Value;
            ParamByName('t').Value := txtearlydiscount.Value;
            ParamByName('u').Value := txtlatecharge.Value;
            ParamByName('k').Value := LBiayaLain.Caption;
            ExecSQL;
            //hapus detil pembelian order
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_pembelianorderdetail where nopembelianorder=:np';
            ParamByName('np').Value := LID.Caption;
            ExecSQL;
            with dbgbarang do begin
              for i:=0 to RowCount-1 do begin
                if Cell[3,i].AsFloat > 0 then begin
                  Close;
                  SQL.Clear;
                  //masuk tabel pembelian order detil
                  SQL.Text := 'insert into tbl_pembelianorderdetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q)';
                  ParamByName('a').Value := LID.Caption;
                  ParamByName('b').Value := Cell[10,i].AsInteger;
                  ParamByName('c').Value := Cell[3,i].AsFloat;
                  ParamByName('d').Value := Cell[5,i].AsFloat;
                  ParamByName('e').Value := Cell[6,i].AsFloat;
                  ParamByName('f').Value := Cell[7,i].AsFloat;
                  ParamByName('g').Value := Cell[8,i].AsFloat;
                  ParamByName('h').Value := Cell[11,i].AsInteger;
                  ParamByName('i').Value := Cell[12,i].AsFloat;
                  ParamByName('j').Value := Cell[16,i].AsFloat;
                  ParamByName('k').Value := Cell[17,i].AsFloat;
                  ParamByName('l').Value := Cell[13,i].AsInteger;
                  ParamByName('m').Value := Cell[14,i].AsInteger;
                  ParamByName('n').Value := Cell[15,i].AsFloat;
                  ParamByName('o').Value := Cell[19,i].AsFloat;
                  ParamByName('p').Value := Cell[20,i].AsFloat;
                  ParamByName('q').Value := Cell[21,i].AsFloat;
                  ExecSQL;
                end;
              end;
            end;
            dm.con.Commit;
            Screen.Cursor := crDefault;
            if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
              Close;
              SQL.Clear;
              SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
              ParamByName('np').Value := LID.Caption;
              ParamByName('t').Value := 'PO';
              Open;
              if IsEmpty then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
                ParamByName('a').Value := LID.Caption;
                ParamByName('b').Value := 'PO';
                ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
                ExecSQL;
              end else begin
                Close;
                SQL.Clear;
                SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
                ParamByName('np').Value := LID.Caption;
                ParamByName('t').Value := 'PO';
                ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
                ExecSQL;
              end;
              dm.Q_NotaPembelianPO.Close;
              DM.Q_NotaPembelianPO.ParamByName('np').Value := LID.Caption;
              DM.Q_NotaPembelianPO.Open;
              dm.Q_NotaTerbilang.Close;
              DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
              DM.Q_NotaTerbilang.ParamByName('t').Value := 'PO';
              DM.Q_NotaTerbilang.Open;
              t := TfrxMemoView(DM.Nota_PembelianPO.FindObject('Memo1'));
              if cbapprove.Checked = True then begin
                t.Memo.Text := 'Order Pembelian';
                t.Font.Size := 18;
              end else begin
                t.Memo.Text := 'Order Pembelian Proforma';
                t.Font.Size := 14;
              end;
              t := TfrxMemoView(DM.Nota_PembelianPO.FindObject('Memo40'));
              if cbapprove.Checked = True then begin
                t.Memo.Text := 'Purchasing';
              end else begin
                t.Memo.Text := 'Dibuat Oleh';
              end;
              t := TfrxMemoView(DM.Nota_PembelianPO.FindObject('Memo33'));
              if cbapprove.Checked = True then begin
                t.Memo.Text := 'Supplier';
              end else begin
                t.Memo.Text := 'Disetujui Oleh';
              end;
              DM.Nota_PembelianPO.ShowReport(True);
            end;
          except
            on E: Exception do begin
              dm.con.Rollback;
              MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
            end;
          end;
          ClearText;
          dbgbarang.AddRow();
        end;
      end else begin
        MessageDlg('Pembelian Order tidak dapat diubah, karena sebagian barang telah diterima!',mtError,[mbOK],0);
      end;
    end;
    Free;
  end;
end;

procedure TFrm_PembelianOrder.txtsupplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtsupplierButtonClick(nil);
end;

procedure TFrm_PembelianOrder.dbgbarangCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ACol = 9 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then Exit;
    Application.CreateForm(TFrm_DataPajak, Frm_DataPajak);
    Frm_DataPajak.RefreshQ;
    if Frm_DataPajak.ShowModal = mrok then begin
      dbgbarang.Cell[13,ARow].AsInteger := Frm_DataPajak.QData.FieldValues['nopajak'];
      dbgbarang.Cell[9,ARow].AsString := Frm_DataPajak.QData.FieldValues['kodepajak'];
      dbgbarang.Cell[14,ARow].AsInteger := Frm_DataPajak.QData.FieldValues['tipepajak'];
      dbgbarang.Cell[15,ARow].AsFloat := Frm_DataPajak.QData.FieldValues['persen'];
      if dbgbarang.Cell[13,ARow].AsInteger = 0 then begin
        dbgbarang.Cell[16,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
        dbgbarang.Cell[17,ARow].AsFloat := 0;
      end else begin
        if dbgbarang.Cell[14,ARow].AsInteger = 0 then begin
          dbgbarang.Cell[16,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
          dbgbarang.Cell[17,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat*dbgbarang.Cell[15,ARow].AsFloat/100)*100)/100;
        end else if dbgbarang.Cell[14,ARow].AsInteger = 1 then begin
          dbgbarang.Cell[16,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat/(1+(dbgbarang.Cell[15,ARow].AsFloat/100)))*100)/100;
          dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat-dbgbarang.Cell[16,ARow].AsFloat;
        end;
      end;
      UpdateTotal;
    end;
  end else if ACol = 18 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then Exit;
    Application.CreateForm(TFrm_DataPPh, Frm_DataPPh);
    Frm_DataPPh.RefreshQ;
    if Frm_DataPPh.ShowModal = mrok then begin
      dbgbarang.Cell[19,ARow].AsInteger := Frm_DataPPh.QData.FieldValues['nopph'];
      dbgbarang.Cell[18,ARow].AsString := Frm_DataPPh.QData.FieldValues['kodepph'];
      dbgbarang.Cell[20,ARow].AsFloat := Frm_DataPPh.QData.FieldValues['persen'];
      if dbgbarang.Cell[19,ARow].AsInteger = 0 then begin
        dbgbarang.Cell[21,ARow].AsFloat := 0;
      end else begin
        dbgbarang.Cell[21,ARow].AsFloat := Int((dbgbarang.Cell[16,ARow].AsFloat*dbgbarang.Cell[20,ARow].AsFloat/100)*100)/100;
      end;
      UpdateTotal;
    end;
  end;
end;

procedure TFrm_PembelianOrder.dbgbarangExit(Sender: TObject);
var
  i : integer;
begin
  for i:=0 to dbgbarang.RowCount-1 do begin
    if dbgbarang.Cell[0,i].AsString = '' then begin
      dbgbarang.DeleteRow(i);
      if dbgbarang.RowCount = 0 then dbgbarang.AddRow();
    end;
  end;
end;

procedure TFrm_PembelianOrder.dbgbarangKeyPress(Sender: TObject; var Key: Char);
begin
  if dbgbarang.SelectedCol = 9 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[0,dbgbarang.SelectedRow].AsString = '' then Exit;
      Application.CreateForm(TFrm_DataPajak, Frm_DataPajak);
      Frm_DataPajak.RefreshQ;
      if Frm_DataPajak.ShowModal = mrok then begin
        dbgbarang.Cell[13,dbgbarang.SelectedRow].AsInteger := Frm_DataPajak.QData.FieldValues['nopajak'];
        dbgbarang.Cell[9,dbgbarang.SelectedRow].AsString := Frm_DataPajak.QData.FieldValues['kodepajak'];
        dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger := Frm_DataPajak.QData.FieldValues['tipepajak'];
        dbgbarang.Cell[15,dbgbarang.SelectedRow].AsFloat := Frm_DataPajak.QData.FieldValues['persen'];
        if dbgbarang.Cell[13,dbgbarang.SelectedRow].AsInteger = 0 then begin
          dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
          dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := 0;
        end else begin
          if dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger = 0 then begin
            dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[15,dbgbarang.SelectedRow].AsFloat/100)*100)/100;
          end else if dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger = 1 then begin
            dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat/(1+(dbgbarang.Cell[15,dbgbarang.SelectedRow].AsFloat/100)))*100)/100;
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat-dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat;
          end;
        end;
        UpdateTotal;
      end;
    end;
  end else if dbgbarang.SelectedCol = 18 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[0,dbgbarang.SelectedRow].AsString = '' then Exit;
      Application.CreateForm(TFrm_DataPPh, Frm_DataPPh);
      Frm_DataPPh.RefreshQ;
      if Frm_DataPPh.ShowModal = mrok then begin
        dbgbarang.Cell[19,dbgbarang.SelectedRow].AsInteger := Frm_DataPPh.QData.FieldValues['nopph'];
        dbgbarang.Cell[18,dbgbarang.SelectedRow].AsString := Frm_DataPPh.QData.FieldValues['kodepph'];
        dbgbarang.Cell[20,dbgbarang.SelectedRow].AsFloat := Frm_DataPPh.QData.FieldValues['persen'];
        if dbgbarang.Cell[19,dbgbarang.SelectedRow].AsInteger = 0 then begin
          dbgbarang.Cell[21,dbgbarang.SelectedRow].AsFloat := 0;
        end else begin
          dbgbarang.Cell[21,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[20,dbgbarang.SelectedRow].AsFloat/100)*100)/100;
        end;
        UpdateTotal;
      end;
    end;
  end;
end;

procedure TFrm_PembelianOrder.txtrequestButtonClick(Sender: TObject);
var
  i: Integer;
  total: Double;
begin
  Application.CreateForm(TFrm_DataPembelianRequest, Frm_DataPembelianRequest);
  Frm_DataPembelianRequest.RefreshQ;
  if Frm_DataPembelianRequest.ShowModal = mrok then begin
    if LRequest.Caption = Frm_DataPembelianRequest.QData.FieldValues['nopembelianrequest'] then begin
      Exit;
    end else begin
      if LRequest.Caption <> '0' then begin
        if MessageDlg('Proses ini akan menghapus semua detil transaksi! Lanjutkan ?',mtConfirmation, [mbYes,mbNo],0)= mrno then begin
          Exit;
        end;
      end;
      txtrequest.Text := Frm_DataPembelianRequest.QData.FieldValues['kodepembelianrequest'];
      LRequest.Caption := Frm_DataPembelianRequest.QData.FieldValues['nopembelianrequest'];
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Text := 'select a.*,d.kodesatuan from ' +
                    '(select a.*,b.kodebarang,b.namabarang from ' +
                    '(select * from tbl_pembelianrequestdetail where nopembelianrequest=:ib) as a ' +
                    'left join tbl_barang as b on b.nobarang=a.nobarang)as a ' +
                    'left join tbl_satuan as d on d.nosatuan=a.nosatuan';
        ParamByName('ib').Value := LRequest.Caption;
        Open;
        if not IsEmpty then begin
          dbgbarang.ClearRows;
          First;
          for i:= 0 to RecordCount-1 do begin
            dbgbarang.AddRow();
            dbgbarang.Cell[0,i].AsString := FieldValues['kodebarang'];
            dbgbarang.Cell[1,i].AsString := FieldValues['namabarang'];
            dbgbarang.Cell[2,i].AsFloat := CekPR(StrToInt(LRequest.Caption),FieldValues['nobarang'],FieldValues['nosatuan']);
            dbgbarang.Cell[3,i].AsFloat := dbgbarang.Cell[2,i].AsFloat;
            dbgbarang.Cell[4,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
            dbgbarang.Cell[5,i].AsFloat := dm.CekHargaBeli(FieldValues['nobarang']);
            total := dbgbarang.Cell[3,i].AsFloat*dbgbarang.Cell[5,i].AsFloat;
            dbgbarang.Cell[6,i].AsFloat := potsup;
            total := total-((total*dbgbarang.Cell[6,i].AsFloat)/100);
            dbgbarang.Cell[7,i].AsFloat := 0;
            total := total-dbgbarang.Cell[7,i].AsFloat;
            dbgbarang.Cell[8,i].AsFloat := total;
            dbgbarang.Cell[10,i].AsInteger := FieldValues['nobarang'];
            dbgbarang.Cell[11,i].AsInteger := FieldValues['nosatuan'];
            dbgbarang.Cell[12,i].AsFloat := FieldValues['nilai'];
            dbgbarang.Cell[13,i].AsInteger := DM.CekPajak(dbgbarang.Cell[11,i].AsInteger,'pembelian');
            dbgbarang.Cell[9,i].AsString := dm.CekKodePajak(dbgbarang.Cell[13,i].AsInteger);
            dbgbarang.Cell[14,i].AsInteger := dm.CekTipePajak(dbgbarang.Cell[13,i].AsInteger);
            dbgbarang.Cell[15,i].AsFloat := dm.CekPersenPajak(dbgbarang.Cell[13,i].AsInteger);
            if dbgbarang.Cell[13,i].AsInteger = 0 then begin
              dbgbarang.Cell[16,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
              dbgbarang.Cell[17,i].AsFloat := 0;
            end else begin
              if dbgbarang.Cell[14,i].AsInteger = 0 then begin
                dbgbarang.Cell[16,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
                dbgbarang.Cell[17,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat*dbgbarang.Cell[15,i].AsFloat/100)*100)/100;
              end else if dbgbarang.Cell[14,i].AsInteger = 1 then begin
                dbgbarang.Cell[16,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat/(1+(dbgbarang.Cell[15,i].AsFloat/100)))*100)/100;
                dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[8,i].AsFloat-dbgbarang.Cell[16,i].AsFloat;
              end;
            end;
            dbgbarang.Cell[18,i].AsString := '-';
            dbgbarang.Cell[19,i].AsInteger := 0;
            dbgbarang.Cell[20,i].AsFloat := 0;
            dbgbarang.Cell[21,i].AsFloat := 0;
            Next;
          end;
          UpdateTotal;
        end;
        Free;
      end;
    end;
  end;
end;

procedure TFrm_PembelianOrder.txtrequestKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtrequestButtonClick(nil);
end;

procedure TFrm_PembelianOrder.txtbiayaChange(Sender: TObject);
begin
  UpdateTotal;
end;

function TFrm_PembelianOrder.CekPR(ANoPR, ANoBarang,
  ANoSatuan: Integer): Double;
var
  diminta,diorder: Double;
begin
  if ANoPR = 0 then begin
    Result := 0;
  end else begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select qty,nilai from tbl_pembelianrequestdetail where nopembelianrequest=:np and nobarang=:nb and nosatuan=:nu';
      ParamByName('np').Value := ANoPR;
      ParamByName('nb').Value := ANoBarang;
      ParamByName('nu').Value := ANoSatuan;
      Open;
      if IsEmpty then
        diminta := 0
      else diminta := FieldValues['qty'];
      Close;
      SQL.Clear;
      SQL.Text := 'select ifnull(sum(b.qty),0)as qty from ' +
                  '(select b.nobarang, ifnull(b.qty,0)as qty, b.nosatuan from ' +
                  '(select nopembelianorder from tbl_pembelianorder where nopembelianrequest=:np and approve=1)as a ' +
                  'left join tbl_pembelianorderdetail as b on b.nopembelianorder=a.nopembelianorder)as b where b.nobarang=:nb and b.nosatuan=:nu group by nobarang,nosatuan';
      ParamByName('np').Value := ANoPR;
      ParamByName('nb').Value := ANoBarang;
      ParamByName('nu').Value := ANoSatuan;
      Open;
      if IsEmpty then
        diorder := 0
      else diorder := FieldValues['qty'];

      Result := diminta-diorder;
      Free;
    end;
  end;
end;

procedure TFrm_PembelianOrder.txttermButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_TermOfPayment, Frm_TermOfPayment);
  Frm_TermOfPayment.ClearText;
  Frm_TermOfPayment.txtdiskonday.Value := txtdiskondays.Value;
  Frm_TermOfPayment.txtduedate.Value := txtduedate.Value;
  Frm_TermOfPayment.txtlatecharge.Value := txtlatecharge.Value;
  Frm_TermOfPayment.txtearlydiskon.Value := txtearlydiscount.Value;
  if Frm_TermOfPayment.ShowModal = mrok then begin
    txtdiskondays.Value := Frm_TermOfPayment.txtdiskonday.Value;
    txtduedate.Value := Frm_TermOfPayment.txtduedate.Value;
    txtlatecharge.Value := Frm_TermOfPayment.txtlatecharge.Value;
    txtearlydiscount.Value := Frm_TermOfPayment.txtearlydiskon.Value;
    txtterm.Text := DM.GetTerm(txtdiskondays.Value,txtduedate.Value,txtearlydiscount.Value,txtlatecharge.Value);
  end;
end;

procedure TFrm_PembelianOrder.txttermKeyPress(Sender: TObject;
  var Key: Char);
begin
  txttermButtonClick(nil);
end;

procedure TFrm_PembelianOrder.BtnBiayaClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_SetAkun, Frm_SetAkun);
  JudulAkun := 'Biaya Lain Pembelian';
  with TZQuery.Create(Self)do begin
    Connection := DM.Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_akun where noakun=:na';
    ParamByName('na').Value := LBiayaLain.Caption;
    Open;
    if not IsEmpty then begin
      Frm_SetAkun.LNoAkun.Caption := FieldValues['noakun'];
      Frm_SetAkun.txtke.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
    end else begin
      Frm_SetAkun.LNoAkun.Caption := '0';
      Frm_SetAkun.txtke.Clear;
    end;
    if Frm_SetAkun.ShowModal = mrok then begin
      LBiayaLain.Caption := Frm_SetAkun.LNoAkun.Caption;
    end;
    Free;
  end;
end;

procedure TFrm_PembelianOrder.dtpfakturExit(Sender: TObject);
begin
  if LID.Caption = '0' then txtreferensi.Text := DM.GenerateKodeTransaksi('PO',dtpfaktur.Date);
end;

end.
