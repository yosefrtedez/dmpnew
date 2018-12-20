unit USaldoAwalAkun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, RzButton, StdCtrls, ExtCtrls, RzPanel, RzLabel,
  Mask, RzEdit;

type
  TFrm_SaldoAwalAkun = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    dbgakun: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxNumberColumn1: TNxNumberColumn;
    NxNumberColumn3: TNxNumberColumn;
    QAkun: TZQuery;
    NxNumberColumn2: TNxNumberColumn;
    RzNumericEdit1: TRzNumericEdit;
    procedure BtSaveClick(Sender: TObject);
    procedure dbgakunAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ(ANoped:Integer);
    function UpdateTotal:Boolean;
  end;

var
  Frm_SaldoAwalAkun: TFrm_SaldoAwalAkun;

implementation

uses UDM;

{$R *.dfm}

{ TForm1 }

procedure TFrm_SaldoAwalAkun.RefreshQ(ANoped:Integer);
var
  i:Integer;
begin
  with QAkun do begin
    Close;
    ParamByName('np').Value := ANoped;
    Open;
    First;
    with dbgakun do begin
      ClearRows;
      for i:= 0 to RecordCount-1 do begin
        AddRow();
        Cell[0,i].AsString := FieldValues['kodeakun'];
        Cell[1,i].AsString := FieldValues['namaakun'];
        Cell[2,i].AsFloat := FieldValues['debit'];
        Cell[3,i].AsFloat := FieldValues['kredit'];
        Cell[4,i].AsInteger := FieldValues['noakun'];
        Next;
      end;
    end;
    dbgakun.CalculateFooter(True);
  end;

end;

procedure TFrm_SaldoAwalAkun.BtSaveClick(Sender: TObject);
begin
  if MessageDlg('Pastikan data tersebut benar. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    if UpdateTotal = True then begin
      ModalResult := mrOk;
    end else begin
      MessageDlg('Total saldo awal yang tidak balance tidak dapat diproses. Mohon periksa kembali.',mtError,[mbYes],0);
    end;
  end;
end;

function TFrm_SaldoAwalAkun.UpdateTotal: Boolean;
var
  totaldebit,totalkredit:Double;
  j:integer;
begin
  totaldebit := 0;
  totalkredit := 0;
  with dbgakun do begin
    for j:=0 to RowCount-1 do begin
      totaldebit:=totaldebit+Cell[2,j].AsFloat;
      totalkredit:=totalkredit+Cell[3,j].AsFloat;
    end;
  end;
  RzNumericEdit1.Value := totaldebit-totalkredit;
  if totaldebit = totalkredit then
    Result := True
  else Result := False;
end;

procedure TFrm_SaldoAwalAkun.dbgakunAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
begin
  dbgakun.CalculateFooter(True);
end;

end.
