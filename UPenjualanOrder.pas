unit UPenjualanOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzLine,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, RzButton, RzEdit, StdCtrls, RzCmboBx, RzBtnEdt,
  NxEdit, RzRadChk, Mask, RzLabel, RzPanel, ExtCtrls, cxPC, NxColumns6,
  NxGridView6, NxControls6, NxCustomGrid6, NxVirtualGrid6, NxGrid6,
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
  TFrm_SalesOrder = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    LID: TRzLabel;
    RzLabel10: TRzLabel;
    LCustomer: TRzLabel;
    txtreferensi: TRzEdit;
    txtcustomer: TRzButtonEdit;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    RzLabel27: TRzLabel;
    RzLabel12: TRzLabel;
    txttotal: TRzNumericEdit;
    Q1: TZQuery;
    RzLabel18: TRzLabel;
    txtpenawaran: TRzButtonEdit;
    LPenawaran: TRzLabel;
    txtsubtotal: TRzNumericEdit;
    RzLabel1: TRzLabel;
    RzLabel6: TRzLabel;
    txtpajak: TRzNumericEdit;
    BtnCari: TRzBitBtn;
    cbselesai: TRzCheckBox;
    dbgbarang: TNextGrid6;
    NxReportGridView61: TNxReportGridView6;
    NxTextColumn61: TNxTextColumn6;
    NxTextColumn62: TNxTextColumn6;
    NxNumberColumn62: TNxNumberColumn6;
    NxTextColumn63: TNxTextColumn6;
    NxNumberColumn63: TNxNumberColumn6;
    NxNumberColumn64: TNxNumberColumn6;
    NxNumberColumn65: TNxNumberColumn6;
    NxNumberColumn66: TNxNumberColumn6;
    NxTextColumn64: TNxTextColumn6;
    NxIconColumn61: TNxIconColumn6;
    NxNumberColumn67: TNxNumberColumn6;
    NxNumberColumn68: TNxNumberColumn6;
    NxNumberColumn69: TNxNumberColumn6;
    NxNumberColumn610: TNxNumberColumn6;
    NxNumberColumn611: TNxNumberColumn6;
    NxNumberColumn612: TNxNumberColumn6;
    NxNumberColumn613: TNxNumberColumn6;
    NxNumberColumn614: TNxNumberColumn6;
    NxNumberColumn61: TNxNumberColumn6;
    RzLabel3: TRzLabel;
    RzLabel13: TRzLabel;
    txtpo: TRzEdit;
    txtdiskondays: TRzNumericEdit;
    txtduedate: TRzNumericEdit;
    txtearlydiscount: TRzNumericEdit;
    txtlatecharge: TRzNumericEdit;
    RzLabel8: TRzLabel;
    LSalesman: TRzLabel;
    txtsalesman: TRzButtonEdit;
    cbapprove: TRzCheckBox;
    txtbiaya: TRzNumericEdit;
    BtnBiaya: TRzToolButton;
    RzLabel9: TRzLabel;
    RzLabel11: TRzLabel;
    LBiayaLain: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    LKirim: TRzLabel;
    RzLabel7: TRzLabel;
    txtterm: TRzButtonEdit;
    NxNumberColumn615: TNxNumberColumn6;
    NxTextColumn65: TNxTextColumn6;
    RzLabel5: TRzLabel;
    txtcoa: TRzButtonEdit;
    LCoa: TRzLabel;
    dtpkirim: TcxDateEdit;
    dtptanggal: TcxDateEdit;
    RzLabel16: TRzLabel;
    txtketerangan: TRzMemo;
    procedure txtcustomerButtonClick(Sender: TObject);
    procedure txtcustomerKeyPress(Sender: TObject; var Key: Char);
    procedure dbgbarangCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure dbgbarangKeyPress(Sender: TObject; var Key: Char);
    procedure txtpenawaranButtonClick(Sender: TObject);
    procedure BtnRekamClick(Sender: TObject);
    procedure txtpenawaranKeyPress(Sender: TObject; var Key: Char);
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnCariClick(Sender: TObject);
    procedure dbgbarangAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure dbgbarangExit(Sender: TObject);
    procedure txttermButtonClick(Sender: TObject);
    procedure txttermKeyPress(Sender: TObject; var Key: Char);
    procedure dbgbarangSelectionChanged(Sender: TObject; ACol,
      ARow: Integer);
    procedure dbgbarangCellClick(Sender: TObject; ACol, ARow: Integer;
      Button: TMouseButton);
    procedure BtnBiayaClick(Sender: TObject);
    procedure txtsalesmanButtonClick(Sender: TObject);
    procedure txtsalesmanKeyPress(Sender: TObject; var Key: Char);
    procedure txtbiayaChange(Sender: TObject);
    procedure txtcoaButtonClick(Sender: TObject);
    procedure txtcoaKeyPress(Sender: TObject; var Key: Char);
    procedure dtptanggalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure UpdateTotal;
  end;

var
  Frm_SalesOrder: TFrm_SalesOrder;
  potcust: Double;

implementation

uses UDM, UMain, UDataBarang, UDataKontak, UDataSatuan, UDataPenawaranHarga, UDataPajak, UTermOfPayment,
  NxCells, USetAkun, UDataAkun;

{$R *.dfm}

{ TFrm_SalesOrder }

procedure TFrm_SalesOrder.ClearText;
begin
  LID.Caption := '0';
  dtptanggal.Date := tanggalserver;
  txtreferensi.Text := DM.GenerateKodeTransaksi('SO',dtptanggal.Date);
  txtcustomer.Clear;
  LCustomer.Caption := '0';
  txtsalesman.Clear;
  LSalesman.Caption := '0';
  txtpenawaran.Clear;
  LPenawaran.Caption := '0';
  dtptanggal.Enabled := True;
  dtpkirim.Date := tanggalserver;
  txtpo.Clear;
  LKirim.Caption := '';
  dbgbarang.ClearRows;
  txtketerangan.Clear;
  if DM.CekUserHargaJual(Frm_Main.txtuser.Caption) = False then begin
    NxNumberColumn63.Editing := False;
    NxNumberColumn63.Color := clYellow;
    NxNumberColumn64.Editing := False;
    NxNumberColumn64.Color := clYellow;
    NxNumberColumn65.Editing := False;
    NxNumberColumn65.Color := clYellow;
  end else begin
    NxNumberColumn63.Editing := True;
    NxNumberColumn63.Color := clWhite;
    NxNumberColumn64.Editing := True;
    NxNumberColumn64.Color := clWhite;
    NxNumberColumn65.Editing := True;
    NxNumberColumn65.Color := clWhite;
  end;
  LCoa.Caption := '0';
  txtcoa.Clear;
  cbapprove.Checked := False;
  cbselesai.Checked := False;
  txtdiskondays.Value := 0;
  txtduedate.Value := 0;
  txtearlydiscount.Value := 0;
  txtlatecharge.Value := 0;
  txtterm.Text := DM.GetSalesTerm(txtdiskondays.Value,txtduedate.Value,txtearlydiscount.Value,txtlatecharge.Value);
  LBiayaLain.Caption := '0';
  txtbiaya.Value := 0;
  UpdateTotal;
end;

procedure TFrm_SalesOrder.UpdateTotal;
var
  dpp,ppn1:Double;
  i:integer;
begin
  dpp := 0;
  ppn1 := 0;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      dpp := dpp+Cell[17,i].AsFloat;
      ppn1 := ppn1+cell[18,i].AsFloat;
    end;
    txtsubtotal.Value := dpp;
    txtpajak.Value := ppn1;
    txttotal.Value := dpp+ppn1+txtbiaya.Value;
  end;
end;

procedure TFrm_SalesOrder.txtcustomerButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 0;
  fungsiblok := 1;
  Frm_DataKontak.RefreshQ;
  if LPenawaran.Caption <> '0' then begin
    if MessageDlg('Proses ini akan menghapus semua detil transaksi! Lanjutkan ?',mtConfirmation, [mbYes,mbNo],0)= mrno then begin
      Exit;
    end;
  end;
  if Frm_DataKontak.ShowModal = mrok then begin
    ClearText;
    dbgbarang.AddRow();
    txtcustomer.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LCustomer.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
    potcust := Frm_DataKontak.QData.FieldValues['diskon'];
    txtdiskondays.Value := Frm_DataKontak.QData.FieldValues['diskonday'];
    txtduedate.Value := Frm_DataKontak.QData.FieldValues['duedate'];
    txtearlydiscount.Value := Frm_DataKontak.QData.FieldValues['earlydiskon'];
    txtlatecharge.Value := Frm_DataKontak.QData.FieldValues['latecharge'];
    txtterm.Text := DM.GetSalesTerm(txtdiskondays.Value,txtduedate.Value,txtearlydiscount.Value,txtlatecharge.Value);
  end;
end;

procedure TFrm_SalesOrder.txtcustomerKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtcustomerButtonClick(nil);
end;

procedure TFrm_SalesOrder.dbgbarangCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
var
  total:Double;
  i,j: Integer;
begin
  if (ACol = 0) or (ACol = 1) or (ACol = 2)  then begin
    if dbgbarang.Cell[11,ARow].AsInteger > 0 then begin
      if ACol = 0 then begin
        Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
        akunkas := -1;
        noklas := 4;
        nosubklas := 1;
        Frm_DataAkun.RefreshQ;
        if Frm_DataAkun.ShowModal = mrok then begin
          dbgbarang.Cell[20,ARow].AsInteger := Frm_DataAkun.QData.FieldValues['noakun'];
          dbgbarang.Cell[0,ARow].AsString := Frm_DataAkun.QData.FieldValues['kodeakun'];
        end;
      end else if (ACol = 1) or (ACol = 2) then begin
        Application.CreateForm(TFrm_DataBarang, Frm_DataBarang);
        //AGudang := -1;
        //Frm_DataBarang.RefreshQ;
        if Frm_DataBarang.ShowModal = mrok then begin
          i := dbgbarang.RowCount;
          for j:=0 to i-1 do begin
            if dbgbarang.Cell[11,j].AsInteger = Frm_DataBarang.QData.FieldValues['nobarang'] then begin
              MessageDlg('Barang telah diinputkan ditransaksi!',mtError,[mbOK],0);
              Exit;
            end;
          end;
          i := dbgbarang.SelectedRow;
          dbgbarang.Cell[1,i].AsString := Frm_DataBarang.QData.FieldValues['kodebarang'];
          dbgbarang.Cell[2,i].AsString := Frm_DataBarang.QData.FieldValues['namabarang'];
          dbgbarang.Cell[3,i].AsFloat := 1;
          dbgbarang.Cell[4,i].AsString := Frm_DataBarang.QData.FieldValues['kodesatuan'];
          dbgbarang.Cell[5,i].AsFloat := Frm_DataBarang.QData.FieldValues['hargajual']*Frm_DataBarang.QData.FieldValues['faktor'];
          if DM.CekHPP(Frm_DataBarang.QData.FieldValues['nobarang']) > Frm_DataBarang.QData.FieldValues['hargajual'] then begin
            MessageDlg('Harga Jual dibawah HPP !', mtWarning, [mbOK],0);
          end;
          total := dbgbarang.Cell[3,i].AsFloat*dbgbarang.Cell[5,i].AsFloat;
          dbgbarang.Cell[6,i].AsFloat := potcust;
          total := total-((total*dbgbarang.Cell[6,i].AsFloat)/100);
          dbgbarang.Cell[7,i].AsFloat := 0;
          total := total-dbgbarang.Cell[7,i].AsFloat;
          dbgbarang.Cell[8,i].AsFloat := total;
          dbgbarang.Cell[11,i].AsInteger := Frm_DataBarang.QData.FieldValues['nobarang'];
          dbgbarang.Cell[12,i].AsInteger := Frm_DataBarang.QData.FieldValues['nosatuan'];
          dbgbarang.Cell[13,i].AsInteger := Frm_DataBarang.QData.FieldValues['faktor'];
          dbgbarang.Cell[14,i].AsInteger := DM.CekPajak(dbgbarang.Cell[11,i].AsInteger,'penjualan');
          dbgbarang.Cell[9,i].AsString := dm.CekKodePajak(dbgbarang.Cell[14,i].AsInteger);
          dbgbarang.Cell[15,i].AsInteger := dm.CekTipePajak(dbgbarang.Cell[14,i].AsInteger);
          dbgbarang.Cell[16,i].AsFloat := dm.CekPersenPajak(dbgbarang.Cell[14,i].AsInteger);
          if dbgbarang.Cell[14,i].AsInteger = 0 then begin
            dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
            dbgbarang.Cell[18,i].AsFloat := 0;
          end else begin
            if dbgbarang.Cell[15,i].AsInteger = 0 then begin
              dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
              dbgbarang.Cell[18,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat*dbgbarang.Cell[16,i].AsFloat/100)*100)/100;
            end else if dbgbarang.Cell[15,i].AsInteger = 1 then begin
              dbgbarang.Cell[17,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat/(1+(dbgbarang.Cell[16,i].AsFloat/100)))*100)/100;
              dbgbarang.Cell[18,i].AsFloat := dbgbarang.Cell[8,i].AsFloat-dbgbarang.Cell[17,i].AsFloat;
            end;
          end;
          UpdateTotal;
          dbgbarang.SelectCell(3,i);
        end;
      end;
    end else begin
      BtnCariClick(nil);
    end;
  end;
  if ACol = 4 then begin
    if dbgbarang.Cell[1,ARow].AsString = '' then Exit;
    Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
    nomorbarang := dbgbarang.Cell[11,ARow].AsInteger;
    Frm_DataSatuan.RefreshQ;
    if Frm_DataSatuan.ShowModal = mrok then begin
      dbgbarang.Cell[4,ARow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan']+'('+FloatToStr(Frm_DataSatuan.QData.FieldValues['faktor'])+')';
      dbgbarang.Cell[12,ARow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
      dbgbarang.Cell[13,ARow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
      dbgbarang.Cell[5,ARow].AsFloat := Frm_DataSatuan.QData.FieldValues['hargajual'];

      total := dbgbarang.Cell[3,ARow].AsFloat*dbgbarang.Cell[5,ARow].AsFloat;
      total := total-((total*dbgbarang.Cell[6,ARow].AsFloat)/100);
      total := total-dbgbarang.Cell[7,ARow].AsFloat;
      dbgbarang.Cell[8,ARow].AsFloat := total;
      if dbgbarang.Cell[12,ARow].AsInteger = 0 then begin
        dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
        dbgbarang.Cell[18,ARow].AsFloat := 0;
      end else begin
        if dbgbarang.Cell[15,ARow].AsInteger = 0 then begin
          dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
          dbgbarang.Cell[18,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat*dbgbarang.Cell[16,ARow].AsFloat/100)*100)/100;
        end else if dbgbarang.Cell[15,ARow].AsInteger = 1 then begin
          dbgbarang.Cell[17,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat/(1+(dbgbarang.Cell[16,ARow].AsFloat/100)))*100)/100;
          dbgbarang.Cell[18,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat-dbgbarang.Cell[17,ARow].AsFloat;
        end;
      end;
      UpdateTotal;
    end;
  end;
  if ACol = 9 then begin
    if dbgbarang.Cell[1,ARow].AsString = '' then Exit;
    Application.CreateForm(TFrm_DataPajak, Frm_DataPajak);
    Frm_DataPajak.RefreshQ;
    if Frm_DataPajak.ShowModal = mrok then begin
      dbgbarang.Cell[14,ARow].AsInteger := Frm_DataPajak.QData.FieldValues['nopajak'];
      dbgbarang.Cell[9,ARow].AsString := Frm_DataPajak.QData.FieldValues['kodepajak'];
      dbgbarang.Cell[15,ARow].AsInteger := Frm_DataPajak.QData.FieldValues['tipepajak'];
      dbgbarang.Cell[16,ARow].AsFloat := Frm_DataPajak.QData.FieldValues['persen'];
      if dbgbarang.Cell[14,ARow].AsInteger = 0 then begin
        dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
        dbgbarang.Cell[18,ARow].AsFloat := 0;
      end else begin
        if dbgbarang.Cell[15,ARow].AsInteger = 0 then begin
          dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
          dbgbarang.Cell[18,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat*dbgbarang.Cell[16,ARow].AsFloat/100)*100)/100;
        end else if dbgbarang.Cell[15,ARow].AsInteger = 1 then begin
          dbgbarang.Cell[17,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat/(1+(dbgbarang.Cell[16,ARow].AsFloat/100)))*100)/100;
          dbgbarang.Cell[18,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat-dbgbarang.Cell[17,ARow].AsFloat;
        end;
      end;
      UpdateTotal;
    end;
  end;
end;

procedure TFrm_SalesOrder.dbgbarangKeyPress(Sender: TObject;
  var Key: Char);
var
  total :Double;
  i: Integer;
begin
  if (dbgbarang.SelectedCol = 0) or (dbgbarang.SelectedCol = 1) or (dbgbarang.SelectedCol = 2) then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[11,dbgbarang.SelectedRow].AsInteger > 0 then begin
        if dbgbarang.SelectedCol = 0 then begin
          Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
          akunkas := -1;
          noklas := 4;
          nosubklas := 1;
          Frm_DataAkun.RefreshQ;
          if Frm_DataAkun.ShowModal = mrok then begin
            dbgbarang.Cell[20,dbgbarang.SelectedRow].AsInteger := Frm_DataAkun.QData.FieldValues['noakun'];
            dbgbarang.Cell[0,dbgbarang.SelectedRow].AsString := Frm_DataAkun.QData.FieldValues['kodeakun'];
          end;
        end else if (dbgbarang.SelectedCol = 1) or (dbgbarang.SelectedCol = 2) then begin
          Application.CreateForm(TFrm_DataBarang, Frm_DataBarang);
          //AGudang := -1;
          //Frm_DataBarang.RefreshQ;
          if Frm_DataBarang.ShowModal = mrok then begin
            i := dbgbarang.SelectedRow;
            dbgbarang.Cell[1,i].AsString := Frm_DataBarang.QData.FieldValues['kodebarang'];
            dbgbarang.Cell[2,i].AsString := Frm_DataBarang.QData.FieldValues['namabarang'];
            dbgbarang.Cell[3,i].AsFloat := 1;
            dbgbarang.Cell[4,i].AsString := Frm_DataBarang.QData.FieldValues['kodesatuan'];
            dbgbarang.Cell[5,i].AsFloat := Frm_DataBarang.QData.FieldValues['hargajual']*Frm_DataBarang.QData.FieldValues['faktor'];
            if DM.CekHPP(Frm_DataBarang.QData.FieldValues['nobarang']) > Frm_DataBarang.QData.FieldValues['hargajual'] then begin
              MessageDlg('Harga Jual dibawah HPP !', mtWarning, [mbOK],0);
            end;
            total := dbgbarang.Cell[3,i].AsFloat*dbgbarang.Cell[5,i].AsFloat;
            dbgbarang.Cell[6,i].AsFloat := potcust;
            total := total-((total*dbgbarang.Cell[6,i].AsFloat)/100);
            dbgbarang.Cell[7,i].AsFloat := 0;
            total := total-dbgbarang.Cell[7,i].AsFloat;
            dbgbarang.Cell[8,i].AsFloat := total;
            dbgbarang.Cell[11,i].AsInteger := Frm_DataBarang.QData.FieldValues['nobarang'];
            dbgbarang.Cell[12,i].AsInteger := Frm_DataBarang.QData.FieldValues['nosatuan'];
            dbgbarang.Cell[13,i].AsInteger := Frm_DataBarang.QData.FieldValues['faktor'];
            dbgbarang.Cell[14,i].AsInteger := DM.CekPajak(dbgbarang.Cell[11,i].AsInteger,'penjualan');
            dbgbarang.Cell[9,i].AsString := dm.CekKodePajak(dbgbarang.Cell[14,i].AsInteger);
            dbgbarang.Cell[15,i].AsInteger := dm.CekTipePajak(dbgbarang.Cell[14,i].AsInteger);
            dbgbarang.Cell[16,i].AsFloat := dm.CekPersenPajak(dbgbarang.Cell[14,i].AsInteger);
            if dbgbarang.Cell[14,i].AsInteger = 0 then begin
              dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
              dbgbarang.Cell[18,i].AsFloat := 0;
            end else begin
              if dbgbarang.Cell[15,i].AsInteger = 0 then begin
                dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
                dbgbarang.Cell[18,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat*dbgbarang.Cell[16,i].AsFloat/100)*100)/100;
              end else if dbgbarang.Cell[15,i].AsInteger = 1 then begin
                dbgbarang.Cell[17,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat/(1+(dbgbarang.Cell[16,i].AsFloat/100)))*100)/100;
                dbgbarang.Cell[18,i].AsFloat := dbgbarang.Cell[8,i].AsFloat-dbgbarang.Cell[17,i].AsFloat;
              end;
            end;
            UpdateTotal;
            dbgbarang.SelectCell(3,i);
          end;
        end;
      end else begin
        BtnCariClick(nil);
      end;
    end;
  end;
  if dbgbarang.SelectedCol = 4 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[1,dbgbarang.SelectedRow].AsString = '' then Exit;
      Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
      nomorbarang := dbgbarang.Cell[11,dbgbarang.SelectedRow].AsInteger;
      Frm_DataSatuan.RefreshQ;
      if Frm_DataSatuan.ShowModal = mrok then begin
        dbgbarang.Cell[4,dbgbarang.SelectedRow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan']+'('+FloatToStr(Frm_DataSatuan.QData.FieldValues['faktor'])+')';
        dbgbarang.Cell[12,dbgbarang.SelectedRow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
        dbgbarang.Cell[13,dbgbarang.SelectedRow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
        dbgbarang.Cell[5,dbgbarang.SelectedRow].AsFloat := Frm_DataSatuan.QData.FieldValues['hargajual'];

        total := dbgbarang.Cell[3,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[5,dbgbarang.SelectedRow].AsFloat;
        total := total-((total*dbgbarang.Cell[6,dbgbarang.SelectedRow].AsFloat)/100);
        total := total-dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat;
        dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat := total;
        if dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger = 0 then begin
          dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
          dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := 0;
        end else begin
          if dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger = 0 then begin
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
            dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat/100)*100)/100;
          end else if dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger = 1 then begin
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat/(1+(dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat/100)))*100)/100;
            dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat-dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat;
          end;
        end;
        UpdateTotal;
      end;
    end;
  end;
  if dbgbarang.SelectedCol = 9 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[1,dbgbarang.SelectedRow].AsString = '' then Exit;
      Application.CreateForm(TFrm_DataPajak, Frm_DataPajak);
      Frm_DataPajak.RefreshQ;
      if Frm_DataPajak.ShowModal = mrok then begin
        dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger := Frm_DataPajak.QData.FieldValues['nopajak'];
        dbgbarang.Cell[9,dbgbarang.SelectedRow].AsString := Frm_DataPajak.QData.FieldValues['kodepajak'];
        dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger := Frm_DataPajak.QData.FieldValues['tipepajak'];
        dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat := Frm_DataPajak.QData.FieldValues['persen'];
        if dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger = 0 then begin
          dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
          dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := 0;
        end else begin
          if dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger = 0 then begin
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
            dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat/100)*100)/100;
          end else if dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger = 1 then begin
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat/(1+(dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat/100)))*100)/100;
            dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat-dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat;
          end;
        end;
        UpdateTotal;
      end;
    end;
  end;
end;

procedure TFrm_SalesOrder.txtpenawaranButtonClick(Sender: TObject);
var
  i: Integer;
  total: Double;
begin
  Application.CreateForm(TFrm_DataPenawaranHarga, Frm_DataPenawaranHarga);
  customerpenawaran := StrToInt(LCustomer.Caption);
  Frm_DataPenawaranHarga.RefreshQ;
  if Frm_DataPenawaranHarga.ShowModal = mrok then begin
    if LPenawaran.Caption <> '0' then begin
      if MessageDlg('Proses ini akan menghapus semua detil transaksi! Lanjutkan ?',mtConfirmation, [mbYes,mbNo],0)= mrno then begin
        Exit;
      end;
    end;
    txtpenawaran.Text := Frm_DataPenawaranHarga.QData.FieldValues['kodepenjualanrequest'];
    LPenawaran.Caption := Frm_DataPenawaranHarga.QData.FieldValues['nopenjualanrequest'];
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                  '(select a.*,d.kodesatuan from ' +
                  '(select a.*,b.kodebarang,b.namabarang from ' +
                  '(select * from tbl_penjualanrequestdetail where nopenjualanrequest=:ib) as a ' +
                  'left join tbl_barang as b on b.nobarang=a.nobarang)as a ' +
                  'left join tbl_satuan as d on d.nosatuan=a.nosatuan)as a ' +
                  'left join tbl_pajak as b on b.nopajak=a.nopajak';
      ParamByName('ib').Value := LPenawaran.Caption;
      Open;
      if not IsEmpty then begin
        dbgbarang.ClearRows;
        First;
        for i:= 0 to RecordCount-1 do begin
          dbgbarang.AddRow();
          dbgbarang.Cell[0,i].AsString := FieldValues['kodebarang'];
          dbgbarang.Cell[1,i].AsString := FieldValues['namabarang'];
          dbgbarang.Cell[2,i].AsFloat := FieldValues['qty'];
          dbgbarang.Cell[3,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
          dbgbarang.Cell[4,i].AsFloat := FieldValues['hargajual'];
          total := dbgbarang.Cell[2,i].AsFloat*dbgbarang.Cell[4,i].AsFloat;
          dbgbarang.Cell[5,i].AsFloat := 0;
          total := total-((total*dbgbarang.Cell[5,i].AsFloat)/100);
          dbgbarang.Cell[6,i].AsFloat := 0;
          total := total-dbgbarang.Cell[6,i].AsFloat;
          dbgbarang.Cell[7,i].AsFloat := total;
          dbgbarang.Cell[8,i].AsString := dm.CekKodePajak(FieldValues['nopajak']);;
          dbgbarang.Cell[10,i].AsInteger := FieldValues['nobarang'];
          dbgbarang.Cell[11,i].AsInteger := FieldValues['nosatuan'];
          dbgbarang.Cell[12,i].AsFloat := FieldValues['nilai'];
          dbgbarang.Cell[13,i].AsInteger := FieldValues['nopajak'];
          dbgbarang.Cell[14,i].AsInteger := FieldValues['tipepajak'];
          dbgbarang.Cell[15,i].AsFloat := FieldValues['persenpajak'];
          dbgbarang.Cell[16,i].AsFloat := FieldValues['dppbarang'];
          dbgbarang.Cell[17,i].AsFloat := FieldValues['ppnbarang'];
          dbgbarang.Cell[18,i].AsInteger := 0;
          Next;
        end;
        UpdateTotal;
      end;
      Free;
    end;
  end;
end;

procedure TFrm_SalesOrder.BtnRekamClick(Sender: TObject);
var
  i,notransaksi:Integer;
  jumlahbarang: Double;
begin
  if txtcustomer.Text = '' then begin
    MessageDlg('Customer : harus diisi !',mtError,[mbOK],0);
    txtcustomer.SetFocus;
    Exit;
  end;
  with dbgbarang do begin
    jumlahbarang := 0;
    for i:=0 to RowCount-1 do begin
      jumlahbarang := jumlahbarang+dbgbarang.Cell[3,i].AsFloat;
    end;
    if jumlahbarang <= 0 then begin
      MessageDlg('Tidak ada transaksi !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  if LBiayaLain.Caption = '0' then begin
    if txtbiaya.Value > 0 then begin
      MessageDlg('Akun Biaya Lain: harus dipilih !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  {if DM.CekPlafon(StrToInt(LCustomer.Caption),txttotal.Value)=False then begin
    if MessageDlg('Transaksi ini melebihi batas kredit customer. Diperlukan Persetujuan!'#10#13'Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)=mrno then begin
      Exit;
    end else begin
      cbapprove.Checked := False;
    end;
  end else cbapprove.Checked := True; }
  if DM.CekPeriode(dtptanggal.Date)= 0 then begin
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
          notransaksi := DM.GenerateNoMaster('penjualanorder');
          txtreferensi.Text := DM.GenerateKodeTransaksi('SO',dtptanggal.Date);
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
          ParamByName('a').Value := 'SO';
          ParamByName('b').Value := dtptanggal.Date;
          ParamByName('c').Value := txtreferensi.Text;
          ExecSQL;
          Close;
          // masuk ke tabel penjualan order
          SQL.Clear;
          SQL.Text := 'insert into tbl_penjualanorder values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v,:w,:y,:z,:aa)';
          ParamByName('a').Value := notransaksi;
          ParamByName('b').Value := txtreferensi.Text;
          ParamByName('c').Value := LCustomer.Caption;
          ParamByName('d').Value := LPenawaran.Caption;
          ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpkirim.Date);
          ParamByName('f').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('g').Value := LSalesman.Caption;
          ParamByName('h').Value := txtpo.Text;
          ParamByName('i').Value := 0;
          ParamByName('j').Value := null;
          if cbselesai.Checked = True then
            ParamByName('k').Value := 1
          else ParamByName('k').Value := 0;
          ParamByName('m').Value := txtdiskondays.Value;
          ParamByName('n').Value := txtduedate.Value;
          ParamByName('o').Value := txtearlydiscount.Value;
          ParamByName('p').Value := txtlatecharge.Value;
          ParamByName('q').Value := txtsubtotal.Value;
          ParamByName('r').Value := txtpajak.Value;
          ParamByName('s').Value := txtbiaya.Value;
          ParamByName('t').Value := LBiayaLain.Caption;
          ParamByName('u').Value := txttotal.Value;
          ParamByName('v').Value := Frm_Main.txtuser.Caption;
          ParamByName('w').Value := 0;
          ParamByName('y').Value := '';
          ParamByName('z').Value := null;
          ParamByName('aa').Value := txtketerangan.Text;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              if Cell[3,i].AsFloat > 0 then begin
                Close;
                SQL.Clear;
                //masuk tabel penjualan order detil
                SQL.Text := 'insert into tbl_penjualanorderdetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p)';
                ParamByName('a').Value := notransaksi;
                ParamByName('b').Value := DM.GenerateTransaksiDetil('SO',notransaksi);
                ParamByName('c').Value := Cell[11,i].AsInteger;
                ParamByName('d').Value := Cell[3,i].AsFloat;
                ParamByName('e').Value := Cell[5,i].AsFloat;
                ParamByName('f').Value := Cell[6,i].AsFloat;
                ParamByName('g').Value := Cell[7,i].AsFloat;
                ParamByName('h').Value := Cell[8,i].AsFloat;
                ParamByName('i').Value := Cell[12,i].AsInteger;
                ParamByName('j').Value := Cell[13,i].AsFloat;
                ParamByName('k').Value := Cell[17,i].AsFloat;
                ParamByName('l').Value := Cell[18,i].AsFloat;
                ParamByName('m').Value := Cell[14,i].AsInteger;
                ParamByName('n').Value := Cell[15,i].AsInteger;
                ParamByName('o').Value := Cell[16,i].AsFloat;
                ParamByName('p').Value := Cell[20,i].AsInteger;
                ExecSQL;
              end;
            end;
          end;
          dm.con.Commit;
          Screen.Cursor := crDefault;
          if cbapprove.Checked = True then begin
            if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
              Close;
              SQL.Clear;
              SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
              ParamByName('np').Value := notransaksi;
              ParamByName('t').Value := 'SO';
              Open;
              if IsEmpty then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
                ParamByName('a').Value := notransaksi;
                ParamByName('b').Value := 'SO';
                ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
                ExecSQL;
              end else begin
                Close;
                SQL.Clear;
                SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
                ParamByName('np').Value := notransaksi;
                ParamByName('t').Value := 'SO';
                ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
                ExecSQL;
              end;
              dm.Q_NotaPenjualanSO.Close;
              DM.Q_NotaPenjualanSO.ParamByName('np').Value := notransaksi;
              DM.Q_NotaPenjualanSO.Open;
              dm.Q_NotaTerbilang.Close;
              DM.Q_NotaTerbilang.ParamByName('np').Value := notransaksi;
              DM.Q_NotaTerbilang.ParamByName('t').Value := 'SO';
              DM.Q_NotaTerbilang.Open;
              DM.Nota_PenjualanSO.ShowReport(True);
            end;
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
      if cbapprove.Checked = False then begin
        if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Screen.Cursor := crSQLWait;
          try
            dm.con.StartTransaction;
            Close;
            SQL.Clear;
            // update ke tabel penjualan order
            SQL.Text := 'update tbl_penjualanorder set nokontak=:b, nopenjualanrequest=:c,tglkirim=:d,tgltransaksi=:e,nosales=:f,pocustomer=:g,selesai=:j, ' +
                        'diskonday=:l,duedate=:m,earlydiskon=:n,latecharge=:o,totaldpp=:p,totalpajak=:q,biayalain=:r,noakunbiayalain=:s,total=:t,keterangan=:aa where nopenjualanorder=:a';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := LCustomer.Caption;
            ParamByName('c').Value := LPenawaran.Caption;
            ParamByName('d').Value := FormatDateTime('yyyy-mm-dd',dtpkirim.Date);
            ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
            ParamByName('f').Value := LSalesman.Caption;
            ParamByName('g').Value := txtpo.Text;
            if cbselesai.Checked = True then
              ParamByName('j').Value := 1
            else ParamByName('j').Value := 0;
            ParamByName('l').Value := txtdiskondays.Value;
            ParamByName('m').Value := txtduedate.Value;
            ParamByName('n').Value := txtearlydiscount.Value;
            ParamByName('o').Value := txtlatecharge.Value;
            ParamByName('p').Value := txtsubtotal.Value;
            ParamByName('q').Value := txtpajak.Value;
            ParamByName('r').Value := txtbiaya.Value;
            ParamByName('s').Value := LBiayaLain.Caption;
            ParamByName('t').Value := txttotal.Value;
            ParamByName('aa').Value := txtketerangan.Text;
            ExecSQL;
            //hapus detil penjualan order
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_penjualanorderdetail where nopenjualanorder=:np';
            ParamByName('np').Value := LID.Caption;
            ExecSQL;
            with dbgbarang do begin
              for i:=0 to RowCount-1 do begin
                if Cell[3,i].AsFloat > 0 then begin
                  Close;
                  SQL.Clear;
                  //masuk tabel penjualan order detil
                  SQL.Text := 'insert into tbl_penjualanorderdetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p)';
                  ParamByName('a').Value := LID.Caption;
                  ParamByName('b').Value := DM.GenerateTransaksiDetil('SO',StrToInt(LID.Caption));
                  ParamByName('c').Value := Cell[11,i].AsInteger;
                  ParamByName('d').Value := Cell[3,i].AsFloat;
                  ParamByName('e').Value := Cell[5,i].AsFloat;
                  ParamByName('f').Value := Cell[6,i].AsFloat;
                  ParamByName('g').Value := Cell[7,i].AsFloat;
                  ParamByName('h').Value := Cell[8,i].AsFloat;
                  ParamByName('i').Value := Cell[12,i].AsInteger;
                  ParamByName('j').Value := Cell[13,i].AsFloat;
                  ParamByName('k').Value := Cell[17,i].AsFloat;
                  ParamByName('l').Value := Cell[18,i].AsFloat;
                  ParamByName('m').Value := Cell[14,i].AsInteger;
                  ParamByName('n').Value := Cell[15,i].AsInteger;
                  ParamByName('o').Value := Cell[16,i].AsFloat;
                  ParamByName('p').Value := Cell[20,i].AsInteger;
                  ExecSQL;
                end;
              end;
            end;
            dm.con.Commit;
            Screen.Cursor := crDefault;
            if cbapprove.Checked = True then begin
              if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
                Close;
                SQL.Clear;
                SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
                ParamByName('np').Value := LID.Caption;
                ParamByName('t').Value := 'SO';
                Open;
                if IsEmpty then begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
                  ParamByName('a').Value := LID.Caption;
                  ParamByName('b').Value := 'SO';
                  ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
                  ExecSQL;
                end else begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
                  ParamByName('np').Value := LID.Caption;
                  ParamByName('t').Value := 'SO';
                  ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
                  ExecSQL;
                end;
                dm.Q_NotaPenjualanSO.Close;
                DM.Q_NotaPenjualanSO.ParamByName('np').Value := LID.Caption;
                DM.Q_NotaPenjualanSO.Open;
                dm.Q_NotaTerbilang.Close;
                DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
                DM.Q_NotaTerbilang.ParamByName('t').Value := 'SO';
                DM.Q_NotaTerbilang.Open;
                DM.Nota_PenjualanSO.ShowReport(True);
              end;
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
        MessageDlg('Order Penjualan tidak dapat diubah, karena telah di Approve!',mtError,[mbOK],0);
      end;
    end;
    Free;
  end;
end;

procedure TFrm_SalesOrder.txtpenawaranKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtpenawaranButtonClick(nil);
end;

procedure TFrm_SalesOrder.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_SalesOrder.BtnCariClick(Sender: TObject);
var
  i,j,akunpenjualan:Integer;
  total:Double;
  namapenjualan: string;
begin
  if txtcustomer.Text = '' then begin
    MessageDlg('Customer : harus diisi !',mtError,[mbOK],0);
    txtcustomer.SetFocus;
    Exit;
  end;
  if LCoa.Caption = '0' then begin
    Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
    akunkas := -1;
    noklas := 4;
    nosubklas := 1;
    Frm_DataAkun.RefreshQ;
    if Frm_DataAkun.ShowModal = mrok then begin
      akunpenjualan := Frm_DataAkun.QData.FieldValues['noakun'];
      namapenjualan := Frm_DataAkun.QData.FieldValues['kodeakun'];
      Application.CreateForm(TFrm_DataBarang, Frm_DataBarang);
      //AGudang := -1;
      //Frm_DataBarang.RefreshQ;
      if Frm_DataBarang.ShowModal = mrok then begin
        {i := dbgbarang.RowCount;
        for j:=0 to i-1 do begin
          if dbgbarang.Cell[11,j].AsInteger = Frm_DataBarang.QData.FieldValues['nobarang'] then begin
            MessageDlg('Barang telah diinputkan ditransaksi!',mtError,[mbOK],0);
            Exit;
          end;
        end;   }
        i := dbgbarang.SelectedRow;
        dbgbarang.Cell[0,i].AsString := namapenjualan;
        dbgbarang.Cell[1,i].AsString := Frm_DataBarang.QData.FieldValues['kodebarang'];
        dbgbarang.Cell[2,i].AsString := Frm_DataBarang.QData.FieldValues['namabarang'];
        dbgbarang.Cell[3,i].AsFloat := 1;
        dbgbarang.Cell[4,i].AsString := Frm_DataBarang.QData.FieldValues['kodesatuan'];
        dbgbarang.Cell[5,i].AsFloat := Frm_DataBarang.QData.FieldValues['hargajual']*Frm_DataBarang.QData.FieldValues['faktor'];
        if DM.CekHPP(Frm_DataBarang.QData.FieldValues['nobarang']) > Frm_DataBarang.QData.FieldValues['hargajual'] then begin
          MessageDlg('Harga Jual dibawah HPP !', mtWarning, [mbOK],0);
        end;
        total := dbgbarang.Cell[3,i].AsFloat*dbgbarang.Cell[5,i].AsFloat;
        dbgbarang.Cell[6,i].AsFloat := potcust;
        total := total-((total*dbgbarang.Cell[6,i].AsFloat)/100);
        dbgbarang.Cell[7,i].AsFloat := 0;
        total := total-dbgbarang.Cell[7,i].AsFloat;
        dbgbarang.Cell[8,i].AsFloat := total;
        dbgbarang.Cell[11,i].AsInteger := Frm_DataBarang.QData.FieldValues['nobarang'];
        dbgbarang.Cell[12,i].AsInteger := Frm_DataBarang.QData.FieldValues['nosatuan'];
        dbgbarang.Cell[13,i].AsInteger := Frm_DataBarang.QData.FieldValues['faktor'];
        dbgbarang.Cell[14,i].AsInteger := DM.CekPajak(dbgbarang.Cell[11,i].AsInteger,'penjualan');
        dbgbarang.Cell[9,i].AsString := dm.CekKodePajak(dbgbarang.Cell[14,i].AsInteger);
        dbgbarang.Cell[15,i].AsInteger := dm.CekTipePajak(dbgbarang.Cell[14,i].AsInteger);
        dbgbarang.Cell[16,i].AsFloat := dm.CekPersenPajak(dbgbarang.Cell[14,i].AsInteger);
        if dbgbarang.Cell[14,i].AsInteger = 0 then begin
          dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
          dbgbarang.Cell[18,i].AsFloat := 0;
        end else begin
          if dbgbarang.Cell[15,i].AsInteger = 0 then begin
            dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
            dbgbarang.Cell[18,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat*dbgbarang.Cell[16,i].AsFloat/100)*100)/100;
          end else if dbgbarang.Cell[15,i].AsInteger = 1 then begin
            dbgbarang.Cell[17,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat/(1+(dbgbarang.Cell[16,i].AsFloat/100)))*100)/100;
            dbgbarang.Cell[18,i].AsFloat := dbgbarang.Cell[8,i].AsFloat-dbgbarang.Cell[17,i].AsFloat;
          end;
        end;
        dbgbarang.Cell[20,i].AsInteger := akunpenjualan;
        UpdateTotal;
        dbgbarang.SelectCell(3,i);
      end;
    end;
  end else begin
    akunpenjualan := StrToInt(LCoa.Caption);
    namapenjualan := txtcoa.Text;
    Application.CreateForm(TFrm_DataBarang, Frm_DataBarang);
    //AGudang := -1;
    //Frm_DataBarang.RefreshQ;
    if Frm_DataBarang.ShowModal = mrok then begin
      i := dbgbarang.SelectedRow;
      dbgbarang.Cell[0,i].AsString := namapenjualan;
      dbgbarang.Cell[1,i].AsString := Frm_DataBarang.QData.FieldValues['kodebarang'];
      dbgbarang.Cell[2,i].AsString := Frm_DataBarang.QData.FieldValues['namabarang'];
      dbgbarang.Cell[3,i].AsFloat := 1;
      dbgbarang.Cell[4,i].AsString := Frm_DataBarang.QData.FieldValues['kodesatuan'];
      dbgbarang.Cell[5,i].AsFloat := Frm_DataBarang.QData.FieldValues['hargajual']*Frm_DataBarang.QData.FieldValues['faktor'];
      if DM.CekHPP(Frm_DataBarang.QData.FieldValues['nobarang']) > Frm_DataBarang.QData.FieldValues['hargajual'] then begin
        MessageDlg('Harga Jual dibawah HPP !', mtWarning, [mbOK],0);
      end;
      total := dbgbarang.Cell[3,i].AsFloat*dbgbarang.Cell[5,i].AsFloat;
      dbgbarang.Cell[6,i].AsFloat := potcust;
      total := total-((total*dbgbarang.Cell[6,i].AsFloat)/100);
      dbgbarang.Cell[7,i].AsFloat := 0;
      total := total-dbgbarang.Cell[7,i].AsFloat;
      dbgbarang.Cell[8,i].AsFloat := total;
      dbgbarang.Cell[11,i].AsInteger := Frm_DataBarang.QData.FieldValues['nobarang'];
      dbgbarang.Cell[12,i].AsInteger := Frm_DataBarang.QData.FieldValues['nosatuan'];
      dbgbarang.Cell[13,i].AsInteger := Frm_DataBarang.QData.FieldValues['faktor'];
      dbgbarang.Cell[14,i].AsInteger := DM.CekPajak(dbgbarang.Cell[11,i].AsInteger,'penjualan');
      dbgbarang.Cell[9,i].AsString := dm.CekKodePajak(dbgbarang.Cell[14,i].AsInteger);
      dbgbarang.Cell[15,i].AsInteger := dm.CekTipePajak(dbgbarang.Cell[14,i].AsInteger);
      dbgbarang.Cell[16,i].AsFloat := dm.CekPersenPajak(dbgbarang.Cell[14,i].AsInteger);
      if dbgbarang.Cell[14,i].AsInteger = 0 then begin
        dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
        dbgbarang.Cell[18,i].AsFloat := 0;
      end else begin
        if dbgbarang.Cell[15,i].AsInteger = 0 then begin
          dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
          dbgbarang.Cell[18,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat*dbgbarang.Cell[16,i].AsFloat/100)*100)/100;
        end else if dbgbarang.Cell[15,i].AsInteger = 1 then begin
          dbgbarang.Cell[17,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat/(1+(dbgbarang.Cell[16,i].AsFloat/100)))*100)/100;
          dbgbarang.Cell[18,i].AsFloat := dbgbarang.Cell[8,i].AsFloat-dbgbarang.Cell[17,i].AsFloat;
        end;
      end;
      dbgbarang.Cell[20,i].AsInteger := akunpenjualan;
      UpdateTotal;
      dbgbarang.SelectCell(3,i);
    end;
  end;
end;

procedure TFrm_SalesOrder.dbgbarangAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  total:Double;
begin
  if ACol = 3 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[3,ARow].AsFloat := 0;
      Exit;
    end;
  end else if ACol = 5 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[5,ARow].AsFloat := 0;
      Exit;
    end;
    if DM.CekHPP(dbgbarang.Cell[11,ARow].AsInteger) > dbgbarang.Cell[5,ARow].AsFloat/dbgbarang.Cell[13,ARow].AsFloat then begin
      MessageDlg('Harga Jual dibawah HPP !', mtWarning, [mbOK],0);
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
  if dbgbarang.Cell[14,ARow].AsInteger = 0 then begin
    dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
    dbgbarang.Cell[18,ARow].AsFloat := 0;
  end else begin
    if dbgbarang.Cell[15,ARow].AsInteger = 0 then begin
      dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
      dbgbarang.Cell[18,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat*dbgbarang.Cell[16,ARow].AsFloat/100)*100)/100;
    end else if dbgbarang.Cell[15,ARow].AsInteger = 1 then begin
      dbgbarang.Cell[17,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat/(1+(dbgbarang.Cell[16,ARow].AsFloat/100)))*100)/100;
      dbgbarang.Cell[18,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat-dbgbarang.Cell[17,ARow].AsFloat;
    end;
  end;
  UpdateTotal;
end;

procedure TFrm_SalesOrder.dbgbarangExit(Sender: TObject);
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

procedure TFrm_SalesOrder.txttermButtonClick(Sender: TObject);
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
    txtterm.Text := DM.GetSalesTerm(txtdiskondays.Value,txtduedate.Value,txtearlydiscount.Value,txtlatecharge.Value);
  end;
end;

procedure TFrm_SalesOrder.txttermKeyPress(Sender: TObject; var Key: Char);
begin
  txttermButtonClick(nil);
end;

procedure TFrm_SalesOrder.dbgbarangSelectionChanged(Sender: TObject; ACol,
  ARow: Integer);
var
  i : Integer;
begin
  if ACol = 10 then begin
    if dbgbarang.Cell[0,ARow].AsString <> '' then begin
      if ARow = dbgbarang.RowCount-1 then begin
        dbgbarang.AddRow();
        i:=dbgbarang.RowCount;
        dbgbarang.ScrollToCell(0,i);
      end;
    end;
  end;
end;

procedure TFrm_SalesOrder.dbgbarangCellClick(Sender: TObject; ACol,
  ARow: Integer; Button: TMouseButton);
begin
  if ACol = 10 then begin
    dbgbarang.DeleteRow(ARow);
    if dbgbarang.RowCount = 0 then dbgbarang.AddRow();
    UpdateTotal;
  end;
end;

procedure TFrm_SalesOrder.BtnBiayaClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_SetAkun, Frm_SetAkun);
  JudulAkun := 'Biaya Lain';
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

procedure TFrm_SalesOrder.txtsalesmanButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 2;
  fungsiblok := 0;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    txtsalesman.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LSalesman.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
  end;
end;

procedure TFrm_SalesOrder.txtsalesmanKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtsalesmanButtonClick(nil);
end;

procedure TFrm_SalesOrder.txtbiayaChange(Sender: TObject);
begin
  UpdateTotal;
end;

procedure TFrm_SalesOrder.txtcoaButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 4;
  nosubklas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LCoa.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    txtcoa.Text := Frm_DataAkun.QData.FieldValues['kodeakun'];
  end else begin
    LCoa.Caption := '0';
    txtcoa.Clear;
  end;
end;

procedure TFrm_SalesOrder.txtcoaKeyPress(Sender: TObject; var Key: Char);
begin
  txtcoaButtonClick(nil);
end;

procedure TFrm_SalesOrder.dtptanggalExit(Sender: TObject);
begin
  if LID.Caption = '0' then txtreferensi.Text := DM.GenerateKodeTransaksi('SO',dtptanggal.Date);
end;

end.
