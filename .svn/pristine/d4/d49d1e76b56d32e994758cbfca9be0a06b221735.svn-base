unit USetupPerusahaan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzEdit, Mask, RzLabel, frxpngimage, ExtCtrls,
  RzButton, RzPanel, ComCtrls, RzDTP, RzTabs, RzCmboBx, RzShellDialogs, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrm_InfoPerusahaan = class(TForm)
    RzPanel1: TRzPanel;
    BtnSimpan: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    RzLabel1: TRzLabel;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    RzPanel8: TRzPanel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    txtperusahaan: TRzEdit;
    txtalamat: TRzMemo;
    txtkota: TRzEdit;
    txtkodepos: TRzEdit;
    txttelp: TRzEdit;
    RzGroupBox1: TRzGroupBox;
    RzLabel12: TRzLabel;
    RzLabel14: TRzLabel;
    txtnpwp: TRzEdit;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    txtpkp: TRzEdit;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel24: TRzLabel;
    RzLabel29: TRzLabel;
    RzLabel31: TRzLabel;
    txtkotapkp: TRzEdit;
    txtkodepospkp: TRzEdit;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    dtppkp: TRzDateTimePicker;
    TabSheet3: TRzTabSheet;
    txtalamatpkp: TRzMemo;
    RzLabel17: TRzLabel;
    RzLabel22: TRzLabel;
    txtnamapkp: TRzEdit;
    RzLabel23: TRzLabel;
    RzLabel25: TRzLabel;
    cbhpp: TRzComboBox;
    RzLabel6: TRzLabel;
    RzLabel9: TRzLabel;
    txtkode: TRzEdit;
    RzPanel2: TRzPanel;
    RzPanel5: TRzPanel;
    Image1: TImage;
    BtnHapusGambar: TRzBitBtn;
    BtnCari: TRzBitBtn;
    LFoto: TRzLabel;
    RzOpenDialog1: TRzOpenDialog;
    TabSheet4: TRzTabSheet;
    RzLabel26: TRzLabel;
    RzLabel27: TRzLabel;
    txtfooterpenjualan: TRzMemo;
    TabSheet5: TRzTabSheet;
    RzLabel28: TRzLabel;
    RzLabel30: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel35: TRzLabel;
    txttahun: TRzEdit;
    cbbulan: TRzComboBox;
    RzLabel36: TRzLabel;
    RzLabel37: TRzLabel;
    BtnProses: TRzBitBtn;
    txtblnperiode: TRzNumericEdit;
    ZQuery1: TZQuery;
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnHapusGambarClick(Sender: TObject);
    procedure BtnCariClick(Sender: TObject);
    procedure BtnProsesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbulanChange(Sender: TObject);
    procedure cbbulanExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Cleartext;
  end;

var
  Frm_InfoPerusahaan: TFrm_InfoPerusahaan;

implementation

uses UDM, UMain;

{$R *.dfm}

{ TFrm_InfoPerusahaan }

procedure TFrm_InfoPerusahaan.Cleartext;
begin
  txtkode.Clear;
  txtperusahaan.Clear;
  txtalamat.Clear;
  txtkota.Clear;
  txtkodepos.Clear;
  txttelp.Clear;
  cbhpp.ItemIndex := 0;
  cbhpp.Enabled := True;
  txtnpwp.Clear;
  txtpkp.Clear;
  dtppkp.Date := Date;
  txtnamapkp.Clear;
  txtalamatpkp.Clear;
  txtkotapkp.Clear;
  txtkodepospkp.Clear;
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\images\no-image.jpg');
  LFoto.Caption := '';
  txtfooterpenjualan.Clear;
end;

procedure TFrm_InfoPerusahaan.BtnSimpanClick(Sender: TObject);
begin
  if txtperusahaan.Text = '' then begin
    txtperusahaan.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TFrm_InfoPerusahaan.BtnHapusGambarClick(Sender: TObject);
begin
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\images\no-image.jpg');
  LFoto.Caption := '';
end;

procedure TFrm_InfoPerusahaan.BtnCariClick(Sender: TObject);
begin
  if RzOpenDialog1.Execute then begin
    Image1.Picture.LoadFromFile(RzOpenDialog1.FileName);
    LFoto.Caption := RzOpenDialog1.FileName;
  end;
end;

procedure TFrm_InfoPerusahaan.BtnProsesClick(Sender: TObject);
var
  periodesebelum, periodesekarang: Integer;
begin
  with TZQuery.Create(Self)do begin
    Connection := dm.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_periode where bulan=:a and tahun=:b';
    ParamByName('a').Value := cbbulan.ItemIndex+1;
    ParamByName('b').Value := txttahun.Text;
    Open;
    if not IsEmpty then begin
      periodesebelum := FieldValues['noperiode'];
    end else begin
      MessageDlg('Periode '+cbbulan.Text+' '+txttahun.Text+' tidak ada!',mtError,[mbOK],0);
      Free;
      Exit;
    end;
    if MessageDlg('Proses periode '+cbbulan.Text+' '+txttahun.Text+' ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      Close;
      SQL.Clear;
      SQL.text:='select * from tbl_periode where statusperiode=1';
      Open;
      periodesekarang := FieldValues['noperiode'];
      Screen.Cursor := crSQLWait;
      try
        dm.con.StartTransaction;
        //hapus saldo awal periode
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_saldoawalperiodeakun where noperiode=:a';
        ParamByName('a').Value := periodesekarang;
        ExecSQL;

        //hapus periode
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_periode where noperiode=:a';
        ParamByName('a').Value := periodesekarang;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_periode set statusperiode=1 where noperiode=:a';
        ParamByName('a').Value := periodesebelum;
        ExecSQL;
        dm.con.Commit;
        Screen.Cursor := crDefault;
      except
        on E: Exception do begin
          dm.con.Rollback;
          Screen.Cursor := crDefault;
          MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
        end;
      end;
      Close;
      SQL.Clear;
      SQL.text := 'select * from tbl_periode where statusperiode=1';
      Open;
      cbbulan.ItemIndex := FieldValues['bulan']-1;
      txtblnperiode.IntValue := FieldValues['bulan']-1;
      txttahun.Text := FieldValues['tahun'];
      BtnProses.Visible := False;
      Frm_Main.Caption := namaperusahaan+' - '+host+' - Periode '+periode;
      Frm_Main.utupPeriode1.Caption := 'Tutup Periode '+periode;
      MessageDlg('Periode '+periode+' telah aktif.',mtInformation,[mbOK],0);
    end;
    Free;
  end;
end;

procedure TFrm_InfoPerusahaan.FormShow(Sender: TObject);
begin
  with TZQuery.Create(Self) do begin
    Connection := DM.Con;
    Close;
    SQL.Clear;
    SQL.text:='select * from tbl_periode where statusperiode=1';
    Open;
    cbbulan.ItemIndex := FieldValues['bulan']-1;
    txtblnperiode.IntValue := FieldValues['bulan']-1;
    txttahun.Text := FieldValues['tahun'];
    BtnProses.Visible := False;
    Free;
  end;
end;

procedure TFrm_InfoPerusahaan.cbbulanChange(Sender: TObject);
begin
  BtnProses.Visible := False;
  if cbbulan.ItemIndex > txtblnperiode.IntValue then begin
    MessageDlg('Periode tidak dapat dimajukan! Lakukan proses Tutup Buku Periode.',mtWarning,[mbOK],0);
    cbbulan.ItemIndex := txtblnperiode.IntValue;
  end else if cbbulan.ItemIndex < txtblnperiode.IntValue then begin
    if cbbulan.ItemIndex = txtblnperiode.IntValue-1 then begin
      BtnProses.Visible := True;
    end else begin
      MessageDlg('Lakukan proses perubahan periode satu per satu!',mtWarning,[mbOK],0);
      cbbulan.ItemIndex := txtblnperiode.IntValue;
    end;
  end;
end;

procedure TFrm_InfoPerusahaan.cbbulanExit(Sender: TObject);
begin
  BtnProses.Visible := False;
  if cbbulan.ItemIndex > txtblnperiode.IntValue then begin
    MessageDlg('Periode tidak dapat dimajukan! Lakukan proses Tutup Buku Periode.',mtWarning,[mbOK],0);
    cbbulan.ItemIndex := txtblnperiode.IntValue;
  end else if cbbulan.ItemIndex < txtblnperiode.IntValue then begin
    if cbbulan.ItemIndex = txtblnperiode.IntValue-1 then begin
      BtnProses.Visible := True;
    end else begin
      MessageDlg('Lakukan proses perubahan periode satu per satu!',mtWarning,[mbOK],0);
      cbbulan.ItemIndex := txtblnperiode.IntValue;
    end;
  end;
end;

end.
