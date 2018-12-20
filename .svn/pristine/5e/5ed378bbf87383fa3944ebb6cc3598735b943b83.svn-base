unit UFilterKeuangan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, RzButton, ExtCtrls, RzPanel, RzLabel;

type
  TFrm_FilterKeuangan = class(TForm)
    RzLabel2: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    QBarang: TZQuery;
    cbtahun1: TRzComboBox;
    cbbulandari: TRzComboBox;
    RzLabel3: TRzLabel;
    cbtahunhingga: TRzComboBox;
    cbbulanhingga: TRzComboBox;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure IsiCBTahun;
    procedure ClearText;
  end;

var
  Frm_FilterKeuangan: TFrm_FilterKeuangan;

implementation

uses DateUtils, UDM;

{$R *.dfm}

procedure TFrm_FilterKeuangan.IsiCBTahun;
var
  i:Integer;
  tahun,tahun1:string;
begin
  cbtahun1.Items.Clear;
  cbtahun1.Clear;
  cbtahunhingga.Items.Clear;
  cbtahunhingga.Clear;
  with TZQuery.Create(Self) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_periode where noperiode=:np';
    ParamByName('np').Value := periodeaktif;
    Open;
    tahun := FieldValues['tahun'];
    Free;
  end;
  for i:=-4 to 5 do begin
    tahun1 := IntToStr(StrToInt(tahun)+i);
    cbtahun1.Items.Add(tahun1);
    cbtahunhingga.Items.Add(tahun1);
  end;
end;

procedure TFrm_FilterKeuangan.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_FilterKeuangan.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_FilterKeuangan.ClearText;
begin
  IsiCBTahun;
  cbtahun1.ItemIndex := 4;
  cbtahunhingga.ItemIndex := 4;
  with TZQuery.Create(Self) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_periode where noperiode=:np';
    ParamByName('np').Value := periodeaktif;
    Open;
    cbbulandari.ItemIndex := StrToInt(FieldValues['bulan'])-1;
    cbbulanhingga.ItemIndex := StrToInt(FieldValues['bulan'])-1;
    Free;
  end;
  cbtahunhingga.Enabled := True;
  cbbulanhingga.Enabled := True;
end;

end.
