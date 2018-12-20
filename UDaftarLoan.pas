unit UDaftarLoan;

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
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RzButton, ExtCtrls, RzPanel, cxPC, cxCheckBox, Menus;

type
  TFrm_DaftarKasbon = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    Q1: TZQuery;
    QDatanoloan: TLargeintField;
    QDatakodeloan: TStringField;
    QDatatgltransaksi: TDateField;
    QDatanokontak: TLargeintField;
    QDatanamauser: TStringField;
    QDatatotal: TFloatField;
    QDatabayar: TFloatField;
    QDatasisa: TFloatField;
    dbgdataDBTableView1kodeloan: TcxGridDBColumn;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1total: TcxGridDBColumn;
    dbgdataDBTableView1bayar: TcxGridDBColumn;
    dbgdataDBTableView1sisa: TcxGridDBColumn;
    QDatanamakontak: TStringField;
    BtnEdit: TRzBitBtn;
    dbgdetail: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1tanggal: TcxGridDBColumn;
    cxGridDBTableView1koderef: TcxGridDBColumn;
    cxGridDBTableView1jumlah: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    QDatanoakunca: TLargeintField;
    QDatanokas: TLargeintField;
    QDatanokastransit: TLargeintField;
    QDataapprove: TSmallintField;
    QDatacair: TSmallintField;
    QDataiscancel: TSmallintField;
    dbgdataDBTableView1approve: TcxGridDBColumn;
    dbgdataDBTableView1iscancel: TcxGridDBColumn;
    BtnApprove: TRzBitBtn;
    QPembayaran: TZQuery;
    DS_Pembayaran: TDataSource;
    QPembayarannopembayaranloan: TLargeintField;
    QPembayarannoloan: TLargeintField;
    QPembayarantgltransaksi: TDateField;
    QPembayarantotal: TFloatField;
    dbgdataDBTableView1Column1: TcxGridDBColumn;
    QDatakeperluan: TStringField;
    BtnKontak: TRzToolButton;
    QPembayarannamauser: TStringField;
    BtnPembayaran: TRzBitBtn;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    Ubah1: TMenuItem;
    Hapus1: TMenuItem;
    Hapus2: TMenuItem;
    QPembayarannokontak: TLargeintField;
    QPembayarannoakunca: TLargeintField;
    QPembayarannokas: TLargeintField;
    dbgdataDBTableView1Column2: TcxGridDBColumn;
    BtnBaru: TRzBitBtn;
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnSelesaiClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure dbgdataDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnApproveClick(Sender: TObject);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnKontakClick(Sender: TObject);
    procedure BtnPembayaranClick(Sender: TObject);
    procedure Hapus2Click(Sender: TObject);
    procedure Hapus1Click(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure Ubah1Click(Sender: TObject);
    procedure BtnBaruClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarKasbon: TFrm_DaftarKasbon;
  nogrid,notabel,staffid : Integer;

implementation

uses UDM, UMain, UInputLoan, UDataKontak, UPembayaranLoan;

{$R *.dfm}

procedure TFrm_DaftarKasbon.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarKasbon.RefreshQ;
begin
  QData.Close;
  QPembayaran.Close;
  //QData.ParamByName('nk').Value := staffid;
  QData.Open;
  QPembayaran.Open;
end;

procedure TFrm_DaftarKasbon.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarKasbon.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnEditClick(nil);
end;

procedure TFrm_DaftarKasbon.dbgdataDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  notabel := 0;
end;

procedure TFrm_DaftarKasbon.BtnApproveClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas6')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if notabel = 0 then begin
    if QData.FieldValues['iscancel'] = 0 then begin
      if QData.FieldValues['approve'] = 0 then begin
        if MessageDlg('Permohonan Cash Advance telah disetujui ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          with TZQuery.Create(Self)do begin
            Connection := dm.con;
            DM.InsertBukuBesarAkun(QData.FieldValues['noakunca'],Date,'CA',QData.FieldValues['noloan'],'Cash Advance,'+QData.FieldValues['namakontak'],QData.FieldValues['total'],0);
            DM.InsertBukuBesarAkun(QData.FieldValues['nokastransit'],Date,'CA',QData.FieldValues['noloan'],'Cash Advance, '+QData.FieldValues['namakontak'],0,QData.FieldValues['total']);
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_loan set approve=:ap where noloan=:a';
            ParamByName('a').Value := QData.FieldValues['noloan'];
            ParamByName('ap').Value := 1;
            ExecSQL;
            Free;
          end;
          RefreshQ;
        end;
      end;
    end;
  end;
end;

procedure TFrm_DaftarKasbon.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  notabel := 1;
end;

procedure TFrm_DaftarKasbon.BtnKontakClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 2;
  fungsiblok := 0;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    staffid := Frm_DataKontak.QData.FieldValues['nokontak'];
    RzPanel1.Caption := '             Rincian Cash Advance '+Frm_DataKontak.QData.FieldValues['namakontak'];
    RefreshQ;
  end;
end;

procedure TFrm_DaftarKasbon.BtnPembayaranClick(Sender: TObject);
var
  nobayarloan: Integer;
begin
  if QData.IsEmpty then Exit;
  if (QData.FieldValues['approve'] = 1) and (QData.FieldValues['cair'] = 1) then begin
    Application.CreateForm(TFrm_PembayaranCA, Frm_PembayaranCA);
    Frm_PembayaranCA.ClearText;
    Frm_PembayaranCA.LLoan.Caption := QData.FieldValues['noloan'];
    Frm_PembayaranCA.LAkunCA.Caption := QData.FieldValues['noakunca'];
    Frm_PembayaranCA.LKontak.Caption := QData.FieldValues['nokontak'];
    Frm_PembayaranCA.txtkontak.Text := QData.FieldValues['namakontak'];
    Frm_PembayaranCA.txtnomorgiro.Text := QData.FieldValues['kodeloan'];
    Frm_PembayaranCA.txtkeperluan.Text := QData.FieldValues['keperluan'];
    Frm_PembayaranCA.txtsaldo.Value := QData.FieldValues['sisa'];
    Frm_PembayaranCA.txtbayar.Value := QData.FieldValues['sisa'];
    if Frm_PembayaranCA.ShowModal = mrok then begin
      nobayarloan := dm.GenerateNoMaster('pembayaranloan');
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_pembayaranloan values (:a,:b,:c,:d,:e,:f,:g,:h)';
        ParamByName('a').Value := nobayarloan;
        ParamByName('b').Value := Frm_PembayaranCA.LLoan.Caption;
        ParamByName('c').Value := Frm_PembayaranCA.LKontak.Caption;
        ParamByName('d').Value := Frm_PembayaranCA.LAkunCA.Caption;
        ParamByName('e').Value := Frm_PembayaranCA.LKas.Caption;
        ParamByName('f').Value := FormatDateTime('yyyy-mm-dd',Frm_PembayaranCA.dtptanggal.Date);
        ParamByName('g').Value := Frm_PembayaranCA.txtbayar.Value;
        ParamByName('h').Value := Frm_Main.txtuser.Caption;
        ExecSQL;
        DM.InsertBukuBesarAkun(StrToInt(Frm_PembayaranCA.LAkunCA.Caption),Date,'AC',nobayarloan,'Pembayaran Cash Advance,'+Frm_PembayaranCA.txtkontak.Text,0,Frm_PembayaranCA.txtbayar.Value);
        DM.InsertBukuBesarAkun(StrToInt(Frm_PembayaranCA.LKas.Caption),Date,'AC',nobayarloan,'Pembayaran Cash Advance,'+Frm_PembayaranCA.txtkontak.Text,Frm_PembayaranCA.txtbayar.Value,0);

        Free;
      end;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarKasbon.Hapus2Click(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas7')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QPembayaran.IsEmpty then Exit;
  if DM.CekPeriode(QPembayaran.FieldValues['tgltransaksi'])= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Hapus transaksi pembayaran ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_pembayaranloan where nopembayaranloan=:a';
      ParamByName('a').Value := QPembayaran.FieldValues['nopembayaranloan'];
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:a and tipe=:t';
      ParamByName('a').Value := QPembayaran.FieldValues['nopembayaranloan'];
      ParamByName('t').Value := 'AC';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_laba where noreferensi=:a and tipe=:t';
      ParamByName('a').Value := QPembayaran.FieldValues['nopembayaranloan'];
      ParamByName('t').Value := 'AC';
      ExecSQL;
      RefreshQ;
      Free;
    end;
  end;
end;

procedure TFrm_DaftarKasbon.Hapus1Click(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas7')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if DM.CekPeriode(QData.FieldValues['tgltransaksi'])= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;
  if QData.IsEmpty then Exit;
  with TZQuery.Create(Self)do begin
    Connection := dm.con;
    if QData.FieldValues['approve']=0 then begin
      if MessageDlg('Hapus transaksi ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_loan set iscancel=1 where noloan=:a';
        ParamByName('a').Value := QData.FieldValues['noloan'];
        ExecSQL;
        RefreshQ;
      end;
    end else MessageDlg('Transaksi sudah disetujui. Data tidak dapat dihapus!',mtError,[mbOK],0);   
    Free;
  end;
end;

procedure TFrm_DaftarKasbon.BtnEditClick(Sender: TObject);
begin
  {if DM.CekAkses(Frm_Main.txtuser.Caption,'Data2')=False then begin
  MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
  Exit;
  end;                   }
  Application.CreateForm(TFrm_InputLoan, Frm_InputLoan);
  Frm_InputLoan.ClearText;
  Frm_InputLoan.LID.Caption := QData.FieldValues['noloan'];
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                '(SELECT a.*,IFNULL(b.namaakun,'+QuotedStr('')+')AS namaakun FROM ' +
                '(SELECT * FROM tbl_loan where noloan=:np)AS a ' +
                'LEFT JOIN tbl_akun AS b ON b.noakun=a.nokas)AS a ' +
                'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak';
    ParamByName('np').Value := Frm_InputLoan.LID.Caption;
    Open;
    Frm_InputLoan.txtreferensi.Text := QData.FieldValues['kodeloan'];
    Frm_InputLoan.txtkas.Text := FieldValues['namaakun'];
    Frm_InputLoan.LKas.Caption := FieldValues['nokas'];
    Frm_InputLoan.LKasTransir.Caption := FieldValues['nokastransit'];
    Frm_InputLoan.LAkunCA.Caption := FieldValues['noakunca'];
    Frm_InputLoan.dtptanggal.Date := FieldValues['tgltransaksi'];
    Frm_InputLoan.txtkontak.Text := FieldValues['namakontak'];
    Frm_InputLoan.LKontak.Caption := FieldValues['nokontak'];
    Frm_InputLoan.txtsebesar.Value := FieldValues['total'];
    Frm_InputLoan.txtsebesarExit(nil);
    Frm_InputLoan.txtkeperluan.Text := FieldValues['keperluan'];
    if FieldValues['approve']=1 then begin
      Frm_InputLoan.cbapprove.Checked := True;
      Frm_InputLoan.txtsebesar.ReadOnly := True;
      Frm_InputLoan.txtkontak.ReadOnly := True;
      Frm_InputLoan.txtkas.ReadOnly := True;
    end else begin
      Frm_InputLoan.cbapprove.Checked := False;
      Frm_InputLoan.txtsebesar.ReadOnly := False;
      Frm_InputLoan.txtkontak.ReadOnly := False;
      Frm_InputLoan.txtkas.ReadOnly := False;
    end;
    if FieldValues['cair']=1 then
      Frm_InputLoan.cbcair.Checked := True
    else Frm_InputLoan.cbcair.Checked := False;
    if FieldValues['iscancel']=1 then
      Frm_InputLoan.cbcancel.Checked := True
    else Frm_InputLoan.cbcancel.Checked := False;
    if Frm_InputLoan.ShowModal = mrok then begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_loan set tgltransaksi=:c,nokontak=:d,noakunca=:e,nokas=:f,nokastransit=:g,total=:i,keperluan=:m where noloan=:a';
      ParamByName('a').Value := Frm_InputLoan.LID.Caption;
      ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',Frm_InputLoan.dtptanggal.Date);
      ParamByName('d').Value := Frm_InputLoan.LKontak.Caption;
      ParamByName('e').Value := Frm_InputLoan.LAkunCA.Caption;
      ParamByName('f').Value := Frm_InputLoan.LKas.Caption;
      ParamByName('g').Value := Frm_InputLoan.LKasTransir.Caption;
      ParamByName('i').Value := Frm_InputLoan.txtsebesar.Value;
      ParamByName('m').Value := Frm_InputLoan.txtkeperluan.Text;
      ExecSQL;
      RefreshQ;
    end;
    Free;
  end;
end;

procedure TFrm_DaftarKasbon.Ubah1Click(Sender: TObject);
begin
  BtnEditClick(nil);
end;

procedure TFrm_DaftarKasbon.BtnBaruClick(Sender: TObject);
var
  refloan: string;
  noloan: Integer;
begin
  {if DM.CekAkses(Frm_Main.txtuser.Caption,'Data2')=False then begin
  MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
  Exit;
  end;                   }
  Application.CreateForm(TFrm_InputLoan, Frm_InputLoan);
  Frm_InputLoan.ClearText;
  if Frm_InputLoan.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      refloan := DM.GenerateKodeTransaksi('CA',Frm_InputLoan.dtptanggal.Date);
      noloan := DM.GenerateNoMaster('cashadvance');
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
      ParamByName('a').Value := 'CA';
      ParamByName('b').Value := Frm_InputLoan.dtptanggal.Date;
      ParamByName('c').Value := refloan;
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_loan values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m)';
      ParamByName('a').Value := noloan;
      ParamByName('b').Value := refloan;
      ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',Frm_InputLoan.dtptanggal.Date);
      ParamByName('d').Value := Frm_InputLoan.LKontak.Caption;
      ParamByName('e').Value := Frm_InputLoan.LAkunCA.Caption;
      ParamByName('f').Value := Frm_Main.txtuser.Caption;
      ParamByName('g').Value := Frm_InputLoan.LKas.Caption;
      ParamByName('h').Value := Frm_InputLoan.LKasTransir.Caption;
      ParamByName('i').Value := Frm_InputLoan.txtsebesar.Value;
      ParamByName('j').Value := 0;
      ParamByName('k').Value := 0;
      ParamByName('l').Value := 0;
      ParamByName('m').Value := Frm_InputLoan.txtkeperluan.Text;
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

end.
