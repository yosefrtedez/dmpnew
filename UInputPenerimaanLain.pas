unit UInputPenerimaanLain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzRadChk,
  ComCtrls, RzDTP, StdCtrls, Mask, RzEdit, RzButton, RzLabel, ExtCtrls,
  RzPanel, RzCmboBx, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, RzBtnEdt, NxEdit, cxPC,
  NxColumns6, NxGridView6, NxControls6, NxCustomGrid6, NxVirtualGrid6,
  NxGrid6, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  TFrm_InputPenerimaanLain = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    txtsebesar: TRzNumericEdit;
    txtreferensi: TRzEdit;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    BtnCari: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzPanel5: TRzPanel;
    ZQuery1: TZQuery;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    txtkas: TRzButtonEdit;
    LKas: TRzLabel;
    LID: TRzLabel;
    txtterbilang: TRzMemo;
    cbgiro: TRzCheckBox;
    dbgdata: TNextGrid6;
    NxReportGridView61: TNxReportGridView6;
    NxTextColumn61: TNxTextColumn6;
    NxTextColumn62: TNxTextColumn6;
    NxNumberColumn62: TNxNumberColumn6;
    NxTextColumn63: TNxTextColumn6;
    NxNumberColumn67: TNxNumberColumn6;
    NxIconColumn61: TNxIconColumn6;
    dtptanggal: TcxDateEdit;
    procedure BtnCariClick(Sender: TObject);
    procedure dbgdataAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure dbgdataCellDblClick(Sender: TObject; ACol,
      ARow: Integer);
    procedure BtnRekamClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure dbgdataExit(Sender: TObject);
    procedure dbgdataKeyPress(Sender: TObject; var Key: Char);
    procedure txtkasButtonClick(Sender: TObject);
    procedure txtkasKeyPress(Sender: TObject; var Key: Char);
    procedure dbgdataSelectionChanged(Sender: TObject; ACol,
      ARow: Integer);
    procedure dbgdataCellClick(Sender: TObject; ACol, ARow: Integer;
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
  Frm_InputPenerimaanLain: TFrm_InputPenerimaanLain;

implementation

uses UDM, UDataAkun, NxCells, UMain, UTransaksiGiro;

{$R *.dfm}

{ TFrm_KasMasuk }

procedure TFrm_InputPenerimaanLain.ClearText;
begin
  dtptanggal.Date := tanggalserver;
  txtreferensi.Text := DM.GenerateKodeTransaksi('CI',dtptanggal.Date);
  dtptanggal.Enabled := True;
  txtsebesar.Value := 0;
  txtterbilang.Clear;
  dbgdata.ClearRows;
  LKas.Caption := '0';
  txtkas.Clear;
  LID.Caption := '0';
  cbgiro.Enabled := True;
  cbgiro.Checked := False;
end;

procedure TFrm_InputPenerimaanLain.BtnCariClick(Sender: TObject);
var
  i:Integer;
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    i := dbgdata.SelectedRow;
    dbgdata.Cell[0,i].AsString := Frm_DataAkun.QData.FieldValues['kodeakun'];
    dbgdata.Cell[1,i].AsString := Frm_DataAkun.QData.FieldValues['namaakun'];
    dbgdata.Cell[2,i].AsFloat := 0;
    dbgdata.Cell[5,i].AsInteger := Frm_DataAkun.QData.FieldValues['noakun'];
    UpdateTotal;
    dbgdata.SelectCell(2,i);
  end;
end;

procedure TFrm_InputPenerimaanLain.UpdateTotal;
var
  total:Double;
  i:integer;
begin
  total := 0;
  with dbgdata do begin
    for i:=0 to RowCount-1 do begin
      total:=total+(Cell[2,i].AsFloat);
    end;
    txtsebesar.Value := total;
    if total = 0 then
      txtterbilang.Clear
    else txtterbilang.Text := DM.ConvKeHuruf(FloatToStr(txtsebesar.Value));
  end;
end;

procedure TFrm_InputPenerimaanLain.dbgdataAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
begin
  if ACol = 0 then begin
    if dbgdata.Cell[0,ARow].AsString = '' then begin
      dbgdata.DeleteRow(ARow);
      if dbgdata.RowCount = 0 then dbgdata.AddRow();
    end else begin
      with TZQuery.Create(Self)do begin
        Connection := dm.con;
        Close;
        SQL.Text := 'select c.*,d.namaklasifikasi from ' +
                    '(select a.*,b.namasubklasifikasi from ' +
                    '(select * from tbl_akun where aktif=1 and kodeakun=:ka)as a ' +
                    'left join tbl_subklasifikasi as b on b.nosubklasifikasi=a.nosubklasifikasi and b.noklasifikasi=a.noklasifikasi)as c  ' +
                    'left join tbl_klasifikasi as d on d.noklasifikasi=c.noklasifikasi';
        ParamByName('ka').Value := dbgdata.Cell[0,ARow].AsString;
        Open;
        if IsEmpty then begin
          BtnCariClick(nil);
        end else begin
          dbgdata.Cell[0,ARow].AsString := FieldValues['kodeakun'];
          dbgdata.Cell[1,ARow].AsString := FieldValues['namaakun'];
          dbgdata.Cell[2,ARow].AsFloat := 0;
          dbgdata.Cell[5,ARow].AsInteger := FieldValues['noakun'];
          UpdateTotal;
          dbgdata.SelectCell(2,ARow);
        end;
        Free;
      end;
    end;
  end else if ACol = 2 then begin
     if dbgdata.Cell[0,ARow].AsString = '' then begin
      dbgdata.Cell[2,ARow].AsFloat := 0;
      Exit;
    end;
    UpdateTotal;
  end;
end;

procedure TFrm_InputPenerimaanLain.dbgdataCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if (ACol = 0) or (ACol = 1) then begin
    BtnCariClick(nil)
  end;
end;

procedure TFrm_InputPenerimaanLain.BtnRekamClick(Sender: TObject);
var
  i,nopenerimaan,noakungiro,pakaigiro:Integer;
  md,nogiro,bankgiro:string;
  tempogiro: TDate;
  jumlahnilai: Double;
begin
  if DM.CekAkunPenting = False then begin
    MessageDlg('Transaksi tidak dapat diproses. Cek kembali Akun Default !!',mtError,[mbOK],0);
    Exit;
  end;
  if LKas.Caption = '0' then begin
    MessageDlg('Kas : harus diisi',mtError,[mbOK],0);
    txtkas.SetFocus;
    Exit;
  end;
  with dbgdata do begin
    for i:=0 to RowCount-1 do begin
      if Cell[2,i].AsFloat = 0 then begin
        MessageDlg('Nilai tidak boleh nol',mtError,[mbOK],0);
        Exit;
      end;
    end;
  end;
  with dbgdata do begin
    jumlahnilai := 0;
    for i:=0 to RowCount-1 do begin
      jumlahnilai := jumlahnilai+dbgdata.Cell[2,i].AsFloat;
    end;
    if jumlahnilai <= 0 then begin
      MessageDlg('Tidak ada transaksi !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  if DM.CekPeriode(dtptanggal.Date)= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;
  with TZQuery.Create(Self) do begin
    Connection := DM.con;
    if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      if LID.Caption = '0' then begin
        if cbgiro.Checked = True then begin
          Application.CreateForm(TFrm_TransaksiGiro, Frm_TransaksiGiro);
          Frm_TransaksiGiro.ClearText;
          if Frm_TransaksiGiro.ShowModal = mrok then begin
            pakaigiro := 1;
            tempogiro := Frm_TransaksiGiro.dtptanggal.Date;
            nogiro := Frm_TransaksiGiro.txtnomorgiro.Text;
            bankgiro := Frm_TransaksiGiro.txtbank.Text;
            noakungiro := StrToInt(Frm_TransaksiGiro.LAkunGiro.Caption);
          end else begin
            Free;
            Exit;
          end;
        end else begin
          pakaigiro := 0;
        end;
        txtreferensi.Text := DM.GenerateKodeTransaksi('CI',dtptanggal.Date);
        nopenerimaan := DM.GenerateNoMaster('penerimaanlain');
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
        ParamByName('a').Value := 'CI';
        ParamByName('b').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
        ParamByName('c').Value := txtreferensi.Text;
        ExecSQL;
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_penerimaanlain values (:a,:b,:c,:d,:e,:g,:h)';
          ParamByName('a').Value := nopenerimaan;
          ParamByName('b').Value := txtreferensi.Text;
          ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('d').Value := Frm_Main.txtuser.Caption;
          ParamByName('e').Value := LKas.Caption;
          ParamByName('g').Value := txtsebesar.Value;
          ParamByName('h').Value := pakaigiro;
          ExecSQL;
          for i:=0 to dbgdata.RowCount-1 do begin
            if dbgdata.Cell[2,i].AsFloat > 0 then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_penerimaanlaindetail values (:a,:b,:c,:d)';
              ParamByName('a').Value := nopenerimaan;
              ParamByName('b').Value := dbgdata.Cell[5,i].AsInteger;
              ParamByName('c').Value := dbgdata.Cell[2,i].AsFloat;
              ParamByName('d').Value := dbgdata.Cell[3,i].AsString;
              ExecSQL;
              DM.InsertBukuBesarAkun(dbgdata.Cell[5,i].AsInteger,dtptanggal.Date,'CI',nopenerimaan,'Kas Masuk '+txtreferensi.Text,0,dbgdata.Cell[2,i].AsFloat);
            end;
          end;
          DM.InsertBukuBesarAkun(StrToInt(LKas.Caption),dtptanggal.Date,'CI',nopenerimaan,'Kas Masuk '+txtreferensi.Text,txtsebesar.Value,0);
          {if cbgiro.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_giro values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
            ParamByName('a').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
            ParamByName('b').Value := nopenerimaan;
            ParamByName('c').Value := 'CI';
            ParamByName('d').Value := nogiro;
            ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',Frm_TransaksiGiro.dtptanggal.Date);
            ParamByName('f').Value := bankgiro;
            ParamByName('g').Value := noakungiro;
            ParamByName('h').Value := txtsebesar.Value;
            ParamByName('i').Value := 0;
            ParamByName('j').Value := 'in';
            ExecSQL;
            DM.InsertBukuBesarAkun(noakungiro,dtptanggal.Date,'CI',nopenerimaan,txtketerangan.Text,txtsebesar.Value,0);
          end else begin
            DM.InsertBukuBesarAkun(StrToInt(LKas.Caption),dtptanggal.Date,'CI',nopenerimaan,txtketerangan.Text,txtsebesar.Value,0);
          end;  }
          dm.con.Commit;
          Screen.Cursor := crDefault;
        except
          on E: Exception do begin
            dm.con.Rollback;
            MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
          end;
        end;
        if MessageDlg('Cetak ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := nopenerimaan;
          ParamByName('t').Value := 'CI';
          Open;
          if IsEmpty then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
            ParamByName('a').Value := nopenerimaan;
            ParamByName('b').Value := 'CI';
            ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txtsebesar.Value));
            ExecSQL;
          end else begin
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := nopenerimaan;
            ParamByName('t').Value := 'CI';
            ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txtsebesar.Value));
            ExecSQL;
          end;
          dm.Q_NotaPenerimaanKas.Close;
          DM.Q_NotaPenerimaanKas.ParamByName('np').Value := nopenerimaan;
          DM.Q_NotaPenerimaanKas.Open;
          dm.Q_NotaTerbilang.Close;
          DM.Q_NotaTerbilang.ParamByName('np').Value := nopenerimaan;
          DM.Q_NotaTerbilang.ParamByName('t').Value := 'CI';
          DM.Q_NotaTerbilang.Open;
          DM.Nota_PenerimaanKas.ShowReport(True);
        end;
        ClearText;
        dbgdata.AddRow();
      end else begin
        if cbgiro.Enabled = False then begin
          md := 'Transaksi ini tidak dapat dihapus/diedit karena giro telah cair!';
          MessageDlg(md,mtWarning,[mbOK],0);
          Free;
          exit;
        end;
        if cbgiro.Checked = True then begin
          Application.CreateForm(TFrm_TransaksiGiro, Frm_TransaksiGiro);
          Frm_TransaksiGiro.ClearText;
          if Frm_TransaksiGiro.ShowModal = mrok then begin
            pakaigiro := 1;
            tempogiro := Frm_TransaksiGiro.dtptanggal.Date;
            nogiro := Frm_TransaksiGiro.txtnomorgiro.Text;
            bankgiro := Frm_TransaksiGiro.txtbank.Text;
            noakungiro := StrToInt(Frm_TransaksiGiro.LAkunGiro.Caption);
          end else begin
            Free;
            Exit;
          end;
        end else begin
          pakaigiro := 0;
        end;
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'CI';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'CI';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_giro where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'CI';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'CI';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'update tbl_penerimaanlain set tgltransaksi=:c,noakun=:h,total=:i,giro=:l where nopenerimaan=:a';
          ParamByName('a').Value := LID.Caption;
          ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('h').Value := LKas.Caption;
          ParamByName('i').Value := txtsebesar.Value;
          ParamByName('l').Value := pakaigiro;
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_penerimaanlaindetail where nopenerimaan=:np';
          ParamByName('np').Value := LID.Caption;
          ExecSQL;
          for i:=0 to dbgdata.RowCount-1 do begin
            if dbgdata.Cell[2,i].AsFloat > 0 then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_penerimaanlaindetail values (:a,:b,:c,:d)';
              ParamByName('a').Value := LID.Caption;
              ParamByName('b').Value := dbgdata.Cell[5,i].AsInteger;
              ParamByName('c').Value := dbgdata.Cell[2,i].AsFloat;
              ParamByName('d').Value := dbgdata.Cell[3,i].AsString;
              ExecSQL;
              DM.InsertBukuBesarAkun(dbgdata.Cell[5,i].AsInteger,dtptanggal.Date,'CI',StrtoInt(LID.Caption),'Kas Masuk '+txtreferensi.Text,0,dbgdata.Cell[2,i].AsFloat);
            end;
          end;
          DM.InsertBukuBesarAkun(StrToInt(LKas.Caption),dtptanggal.Date,'CI',StrToInt(LID.Caption),'Kas Masuk '+txtreferensi.Text,txtsebesar.Value,0);
          {if cbgiro.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_giro values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
            ParamByName('a').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
            ParamByName('b').Value := LID.Caption;
            ParamByName('c').Value := 'CI';
            ParamByName('d').Value := nogiro;
            ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',Frm_TransaksiGiro.dtptanggal.Date);
            ParamByName('f').Value := bankgiro;
            ParamByName('g').Value := noakungiro;
            ParamByName('h').Value := txtsebesar.Value;
            ParamByName('i').Value := 0;
            ParamByName('j').Value := 'in';
            ExecSQL;
            DM.InsertBukuBesarAkun(noakungiro,dtptanggal.Date,'CI',StrToInt(LID.Caption),txtketerangan.Text,txtsebesar.Value,0);
          end else begin
            DM.InsertBukuBesarAkun(StrToInt(LKas.Caption),dtptanggal.Date,'CI',StrToInt(LID.Caption),txtketerangan.Text,txtsebesar.Value,0);
          end; }
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
          ParamByName('t').Value := 'CI';
          Open;
          if IsEmpty then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := 'CI';
            ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txtsebesar.Value));
            ExecSQL;
          end else begin
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'CI';
            ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txtsebesar.Value));
            ExecSQL;
          end;
          dm.Q_NotaPenerimaanKas.Close;
          DM.Q_NotaPenerimaanKas.ParamByName('np').Value := LID.Caption;
          DM.Q_NotaPenerimaanKas.Open;
          dm.Q_NotaTerbilang.Close;
          DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
          DM.Q_NotaTerbilang.ParamByName('t').Value := 'CI';
          DM.Q_NotaTerbilang.Open;
          DM.Nota_PenerimaanKas.ShowReport(True);
        end;
        ClearText;
        dbgdata.AddRow();
      end;
    end;
    Free;
  end;
end;

procedure TFrm_InputPenerimaanLain.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_InputPenerimaanLain.dbgdataExit(Sender: TObject);
var
  i : integer;
begin
  for i:=0 to dbgdata.RowCount-1 do begin
    if dbgdata.Cell[0,i].AsString = '' then begin
      dbgdata.DeleteRow(i);
      if dbgdata.RowCount = 0 then dbgdata.AddRow();
    end;
  end;
end;

procedure TFrm_InputPenerimaanLain.dbgdataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (dbgdata.SelectedCol = 0) or (dbgdata.SelectedCol = 1) then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      BtnCariClick(nil);
    end;
  end;
end;

procedure TFrm_InputPenerimaanLain.txtkasButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LKas.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    txtkas.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
  end;
end;

procedure TFrm_InputPenerimaanLain.txtkasKeyPress(Sender: TObject; var Key: Char);
begin
  txtkasButtonClick(nil);
end;


procedure TFrm_InputPenerimaanLain.dbgdataSelectionChanged(Sender: TObject;
  ACol, ARow: Integer);
var
  i:Integer;
begin
  if ACol = 4 then begin
    if dbgdata.Cell[0,ARow].AsString <> '' then begin
      if ARow = dbgdata.RowCount-1 then begin
        dbgdata.AddRow();
        i := dbgdata.RowCount;
        dbgdata.ScrollToCell(0,i);
      end;
    end;
  end;
end;

procedure TFrm_InputPenerimaanLain.dbgdataCellClick(Sender: TObject; ACol,
  ARow: Integer; Button: TMouseButton);
begin
  if ACol = 4 then begin
    dbgdata.DeleteRow(ARow);
    if dbgdata.RowCount = 0 then dbgdata.AddRow();
    UpdateTotal;
  end;
end;

procedure TFrm_InputPenerimaanLain.dtptanggalExit(Sender: TObject);
begin
  if LID.Caption = '0' then txtreferensi.Text := DM.GenerateKodeTransaksi('CI',dtptanggal.Date);
end;

end.
