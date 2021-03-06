unit UInputJurnalUmum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, RzButton, ComCtrls, RzDTP, StdCtrls, Mask, RzLabel,
  RzPanel, ExtCtrls, cxPC, NxEdit, NxColumns6, NxGridView6, NxControls6,
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
  TFrm_InputJurnalUmum = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel4: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    txtreferensi: TRzEdit;
    txtketerangan: TRzEdit;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    BtnCari: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzPanel5: TRzPanel;
    ZQuery1: TZQuery;
    txtdebit: TRzNumericEdit;
    txtkredit: TRzNumericEdit;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    txtselisih: TRzNumericEdit;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    LID: TRzLabel;
    dbgpembayaran: TNextGrid6;
    NxReportGridView61: TNxReportGridView6;
    NxTextColumn61: TNxTextColumn6;
    NxTextColumn66: TNxTextColumn6;
    NxNumberColumn61: TNxNumberColumn6;
    NxNumberColumn63: TNxNumberColumn6;
    NxIconColumn61: TNxIconColumn6;
    NxNumberColumn67: TNxNumberColumn6;
    dtptanggal: TcxDateEdit;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnCariClick(Sender: TObject);
    procedure dbgpembayaranAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure dbgpembayaranCellDblClick(Sender: TObject; ACol,
      ARow: Integer);
    procedure BtnRekamClick(Sender: TObject);
    procedure dbgpembayaranExit(Sender: TObject);
    procedure dbgpembayaranKeyPress(Sender: TObject; var Key: Char);
    procedure dbgpembayaranSelectionChanged(Sender: TObject; ACol,
      ARow: Integer);
    procedure dbgpembayaranCellClick(Sender: TObject; ACol, ARow: Integer;
      Button: TMouseButton);
    procedure dtptanggalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure UpdateTotal;
  end;

var
  Frm_InputJurnalUmum: TFrm_InputJurnalUmum;

implementation

uses UDataAkun, NxCells, UDM, UMain, UDaftarJurnalUmum;

{$R *.dfm}

procedure TFrm_InputJurnalUmum.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_InputJurnalUmum.ClearText;
begin
  dtptanggal.Date := tanggalserver;
  txtreferensi.Text := DM.GenerateKodeTransaksi('GJ',dtptanggal.Date);
  dtptanggal.Enabled := True;
  txtketerangan.Text := 'Jurnal Umum';
  dbgpembayaran.ClearRows;
  UpdateTotal;
  LID.Caption := '0';
end;

procedure TFrm_InputJurnalUmum.UpdateTotal;
var
  i:Integer;
  debit,kredit:Double;
begin
  debit := 0;
  kredit := 0;
  with dbgpembayaran do begin
    for i:=0 to RowCount-1 do begin
      debit := debit+Cell[2,i].AsFloat;
      kredit := kredit+Cell[3,i].AsFloat;
    end;
  end;
  txtdebit.Value := debit;
  txtkredit.Value := kredit;
  txtselisih.Value := debit-kredit;
end;

procedure TFrm_InputJurnalUmum.BtnCariClick(Sender: TObject);
var
  i:Integer;
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    if Frm_DataAkun.QData.FieldValues['noakun'] = akunlababerjalan then begin
      MessageDlg('Anda tidak dibolehkan menggunakan rekening ini karena telah digunakan oleh Akun Default di Menu > Setting > Akun Default.',mtError,[mbOK],0);
      Exit;
    end;
    i := dbgpembayaran.SelectedRow;
    dbgpembayaran.Cell[0,i].AsString := Frm_DataAkun.QData.FieldValues['kodeakun'];
    dbgpembayaran.Cell[1,i].AsString := Frm_DataAkun.QData.FieldValues['namaakun'];
    dbgpembayaran.Cell[2,i].AsFloat := 0;
    dbgpembayaran.Cell[3,i].AsFloat := 0;
    dbgpembayaran.Cell[5,i].AsInteger := Frm_DataAkun.QData.FieldValues['noakun'];
    UpdateTotal;
  end;
end;

procedure TFrm_InputJurnalUmum.dbgpembayaranAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
begin
  if ACol = 0 then begin
    if dbgpembayaran.Cell[0,ARow].AsString = '' then begin
      dbgpembayaran.DeleteRow(ARow);
      if dbgpembayaran.RowCount = 0 then dbgpembayaran.AddRow();
    end else begin
      with TZQuery.Create(Self)do begin
        Connection := dm.con;
        Close;
        SQL.Text := 'select c.*,d.namaklasifikasi from ' +
                    '(select a.*,b.namasubklasifikasi from ' +
                    '(select * from tbl_akun where aktif=1 and kodeakun=:ka)as a ' +
                    'left join tbl_subklasifikasi as b on b.nosubklasifikasi=a.nosubklasifikasi and b.noklasifikasi=a.noklasifikasi)as c  ' +
                    'left join tbl_klasifikasi as d on d.noklasifikasi=c.noklasifikasi';
        ParamByName('ka').Value := dbgpembayaran.Cell[0,ARow].AsString;
        Open;
        if IsEmpty then begin
          BtnCariClick(nil);
        end else begin
          if FieldValues['noakun'] = akunlababerjalan then begin
            MessageDlg('Anda tidak dibolehkan menggunakan rekening ini karena telah digunakan oleh Akun Default di Menu > Setting > Akun Default.',mtError,[mbOK],0);
            Exit;
          end;
          dbgpembayaran.Cell[0,ARow].AsString := FieldValues['kodeakun'];
          dbgpembayaran.Cell[1,ARow].AsString := FieldValues['namaakun'];
          dbgpembayaran.Cell[2,ARow].AsFloat := 0;
          dbgpembayaran.Cell[3,ARow].AsFloat := 0;
          dbgpembayaran.Cell[5,ARow].AsInteger := FieldValues['noakun'];
        end;
        Free;
      end;
    end;
  end else if ACol = 2 then begin
    if dbgpembayaran.Cell[0,ARow].AsString = '' then begin
      dbgpembayaran.Cell[2,ARow].AsFloat := 0;
      Exit;
    end;
  end else if ACol = 3 then begin
    if dbgpembayaran.Cell[0,ARow].AsString = '' then begin
      dbgpembayaran.Cell[3,ARow].AsFloat := 0;
      Exit;
    end;
  end;
  UpdateTotal;
end;

procedure TFrm_InputJurnalUmum.dbgpembayaranCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if (ACol = 0) or (ACol = 1) then begin
    BtnCariClick(nil);
  end;
end;

procedure TFrm_InputJurnalUmum.BtnRekamClick(Sender: TObject);
var
  i,nojurnal:Integer;
begin
  if dbgpembayaran.RowCount <=1  then begin
    if dbgpembayaran.RowCount =1 then begin
      if dbgpembayaran.Cell[0,0].AsString = '' then begin
        MessageDlg('Tidak ada transaksi',mtError,[mbOK],0);
        Exit;
      end;
    end else begin
      MessageDlg('Tidak ada transaksi',mtError,[mbOK],0);
      Exit;
    end;
  end;
  if txtselisih.Value <> 0 then begin
    MessageDlg('Transaksi tidak benar. Mohon diperiksa kembali. Total nilai debit dan kredit harus sama',mtError,[mbOK],0);
    Exit;
  end;
  if DM.CekPeriode(dtptanggal.Date)= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    if LID.Caption = '0' then begin
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        txtreferensi.Text := DM.GenerateKodeTransaksi('GJ',dtptanggal.Date);
        nojurnal := DM.GenerateNoMaster('jurnalumum');
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
        ParamByName('a').Value := 'GJ';
        ParamByName('b').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
        ParamByName('c').Value := txtreferensi.Text;
        ExecSQL;
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          Close;
          // masuk ke tabel jurnal umum
          SQL.Clear;
          SQL.Text := 'insert into tbl_jurnalumum values (:a,:b,:c,:d,:e,:f)';
          ParamByName('a').Value := nojurnal;
          ParamByName('b').Value := txtreferensi.Text;
          ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('d').Value := txtketerangan.Text;
          ParamByName('e').Value := txtdebit.Value;
          ParamByName('f').Value := Frm_Main.txtuser.Caption;
          ExecSQL;

          with dbgpembayaran do begin
            for i:=0 to RowCount-1 do begin
              Close;
              SQL.Clear;
              //masuk tabel detil jurnal umum
              SQL.Text := 'insert into tbl_jurnalumumdetail values(:a,:b,:c,:d)';
              ParamByName('a').Value := nojurnal;
              ParamByName('b').Value := Cell[5,i].AsInteger;
              ParamByName('c').Value := Cell[2,i].AsFloat;
              ParamByName('d').Value := Cell[3,i].AsFloat;
              ExecSQL;

              //masuk buku besar
              DM.InsertBukuBesarAkun(Cell[5,i].AsInteger,dtptanggal.Date,'GJ',nojurnal,txtketerangan.Text,Cell[2,i].AsFloat,Cell[3,i].AsFloat);
            end;
          end;
          dm.con.Commit;
          Screen.Cursor := crDefault;
        except
          on E: Exception do begin
            dm.con.Rollback;
            MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
          end;
        end;
        if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := nojurnal;
          ParamByName('t').Value := 'GJ';
          Open;
          if IsEmpty then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
            ParamByName('a').Value := nojurnal;
            ParamByName('b').Value := 'GJ';
            ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txtdebit.Value));
            ExecSQL;
          end else begin
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := nojurnal;
            ParamByName('t').Value := 'SA';
            ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txtdebit.Value));
            ExecSQL;
          end;
          dm.Q_NotaJurnalUmum.Close;
          DM.Q_NotaJurnalUmum.ParamByName('np').Value := nojurnal;
          DM.Q_NotaJurnalUmum.Open;
          dm.Q_NotaTerbilang.Close;
          DM.Q_NotaTerbilang.ParamByName('np').Value := nojurnal;
          DM.Q_NotaTerbilang.ParamByName('t').Value := 'GJ';
          DM.Q_NotaTerbilang.Open;
          DM.Nota_JurnalUmum.ShowReport(True);
        end;
        ClearText;
        dbgpembayaran.AddRow();
      end;
    end else begin
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          Close;
          // update tabel jurnal umum
          SQL.Clear;
          SQL.Text := 'update tbl_jurnalumum set tgltransaksi=:b,keterangan=:c,nilai=:d where nojurnalumum=:a';
          ParamByName('a').Value := LID.Caption;
          ParamByName('b').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('c').Value := txtketerangan.Text;
          ParamByName('d').Value := txtdebit.Value;
          ExecSQL;
          //hapus detil jurnal umum
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_jurnalumumdetail where nojurnalumum=:np';
          ParamByName('np').Value := LID.Caption;
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'GJ';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'GJ';
          ExecSQL;
          with dbgpembayaran do begin
            for i:=0 to RowCount-1 do begin
              Close;
              SQL.Clear;
              //masuk tabel detil jurnal umum
              SQL.Text := 'insert into tbl_jurnalumumdetail values(:a,:b,:c,:d)';
              ParamByName('a').Value := LID.Caption;
              ParamByName('b').Value := Cell[5,i].AsInteger;
              ParamByName('c').Value := Cell[2,i].AsFloat;
              ParamByName('d').Value := Cell[3,i].AsFloat;
              ExecSQL;

              //masuk buku besar
              DM.InsertBukuBesarAkun(Cell[5,i].AsInteger,dtptanggal.Date,'GJ',StrToInt(LID.Caption),txtketerangan.Text,Cell[2,i].AsFloat,Cell[3,i].AsFloat);
            end;
          end;
          dm.con.Commit;
          Screen.Cursor := crDefault;
        except
          on E: Exception do begin
            dm.con.Rollback;
            MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
          end;
        end;
        if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'GJ';
          Open;
          if IsEmpty then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := 'GJ';
            ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txtdebit.Value));
            ExecSQL;
          end else begin
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'SA';
            ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txtdebit.Value));
            ExecSQL;
          end;
          dm.Q_NotaJurnalUmum.Close;
          DM.Q_NotaJurnalUmum.ParamByName('np').Value := LID.Caption;
          DM.Q_NotaJurnalUmum.Open;
          dm.Q_NotaTerbilang.Close;
          DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
          DM.Q_NotaTerbilang.ParamByName('t').Value := 'GJ';
          DM.Q_NotaTerbilang.Open;
          DM.Nota_JurnalUmum.ShowReport(True);
        end;
        ClearText;
        dbgpembayaran.AddRow();
      end;
    end;
    Free;
  end;
end;

procedure TFrm_InputJurnalUmum.dbgpembayaranExit(Sender: TObject);
var
  i : integer;
begin
  for i:=0 to dbgpembayaran.RowCount-1 do begin
    if dbgpembayaran.Cell[0,i].AsString = '' then begin
      dbgpembayaran.DeleteRow(i);
      if dbgpembayaran.RowCount = 0 then dbgpembayaran.AddRow();
      UpdateTotal;
    end;
  end;
end;

procedure TFrm_InputJurnalUmum.dbgpembayaranKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (dbgpembayaran.SelectedCol = 0) or (dbgpembayaran.SelectedCol = 1) then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      BtnCariClick(nil);
    end;
  end;
  UpdateTotal;
end;

procedure TFrm_InputJurnalUmum.dbgpembayaranSelectionChanged(
  Sender: TObject; ACol, ARow: Integer);
var
  i: Integer;
begin
  if ACol = 4 then begin
    if dbgpembayaran.Cell[0,ARow].AsString <> '' then begin
      if ARow = dbgpembayaran.RowCount-1 then begin
        dbgpembayaran.AddRow();
        i:=dbgpembayaran.RowCount;
        dbgpembayaran.ScrollToCell(0,i);
      end;
    end;
  end;
end;

procedure TFrm_InputJurnalUmum.dbgpembayaranCellClick(Sender: TObject;
  ACol, ARow: Integer; Button: TMouseButton);
begin
  if ACol = 4 then begin
    dbgpembayaran.DeleteRow(ARow);
    if dbgpembayaran.RowCount = 0 then dbgpembayaran.AddRow();
    UpdateTotal;
  end;
end;

procedure TFrm_InputJurnalUmum.dtptanggalExit(Sender: TObject);
begin
  if LID.Caption = '0' then txtreferensi.Text := DM.GenerateKodeTransaksi('GJ',dtptanggal.Date);
end;

end.
