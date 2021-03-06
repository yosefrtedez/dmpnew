unit UAkunPenting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, StdCtrls, ExtCtrls, RzPanel,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzButton, RzLabel;

type
  TFrm_AkunPenting = class(TForm)
    RzPanel1: TRzPanel;
    Label22: TLabel;
    RzPanel3: TRzPanel;
    dbgdata: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxNumberColumn1: TNxNumberColumn;
    NxTextColumn3: TNxTextColumn;
    BtnSimpan: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    ZQuery1: TZQuery;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
    procedure dbgdataCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure dbgdataKeyPress(Sender: TObject; var Key: Char);
    procedure dbgdataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_AkunPenting: TFrm_AkunPenting;

implementation

uses UDM, UDataAkun;

{$R *.dfm}

{ TFrm_AkunPenting }

procedure TFrm_AkunPenting.RefreshQ;
var
  i:Integer;
begin
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Text := 'SELECT a.*,IFNULL(b.kodeakun,'+QuotedStr('')+')AS kodeakun,IFNULL(b.namaakun,'+QuotedStr('')+')AS namaakun FROM ' +
                '(SELECT * FROM tbl_akundefault)AS a ' +
                'LEFT JOIN tbl_akun AS b ON b.noakun=a.noakun ORDER BY a.nama';
    Open;
    dbgdata.ClearRows;
    if not IsEmpty then begin
      First;
      for i:=0 to RecordCount-1 do begin
        dbgdata.AddRow();
        dbgdata.Cell[0,i].AsString := FieldValues['nama'];
        if FieldValues['noakun'] = 0 then
          dbgdata.Cell[1,i].AsString := ''
        else dbgdata.Cell[1,i].AsString := FieldValues['kodeakun']+' | '+FieldValues['namaakun'];
        dbgdata.Cell[2,i].AsString := FieldValues['jenis'];
        dbgdata.Cell[3,i].AsInteger := FieldValues['noakun'];
        Next;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_AkunPenting.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_AkunPenting.BtnSimpanClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_AkunPenting.dbgdataCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
var
  i:Integer;
begin
  if ACol = 1 then begin
    Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
    akunkas := -1;
    noklas := 0;
    nosubklas := 0;
    Frm_DataAkun.RefreshQ;
    if Frm_DataAkun.ShowModal = mrok then begin
      i := dbgdata.SelectedRow;
      dbgdata.Cell[1,i].AsString := Frm_DataAkun.QData.FieldValues['kodeakun']+' | '+Frm_DataAkun.QData.FieldValues['namaakun'];
      dbgdata.Cell[3,i].AsInteger := Frm_DataAkun.QData.FieldValues['noakun'];
    end;
  end;
end;

procedure TFrm_AkunPenting.dbgdataKeyPress(Sender: TObject; var Key: Char);
var
  i:Integer;
begin
  if dbgdata.SelectedColumn = 1 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
      akunkas := -1;
      noklas := 0;
      nosubklas := 0;
      Frm_DataAkun.RefreshQ;
      if Frm_DataAkun.ShowModal = mrok then begin
        i := dbgdata.SelectedRow;
        dbgdata.Cell[1,i].AsString := Frm_DataAkun.QData.FieldValues['kodeakun']+' | '+Frm_DataAkun.QData.FieldValues['namaakun'];
        dbgdata.Cell[3,i].AsInteger := Frm_DataAkun.QData.FieldValues['noakun'];
      end;
    end;
  end;
end;

procedure TFrm_AkunPenting.dbgdataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dbgdata.SelectedColumn = 1 then begin
    if Key = vk_delete then begin
      dbgdata.Cell[1,dbgdata.SelectedRow].AsString := '';
      dbgdata.Cell[3,dbgdata.SelectedRow].AsInteger := 0;
    end;
  end;
end;

end.
