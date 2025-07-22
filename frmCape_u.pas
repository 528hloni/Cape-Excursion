unit frmCape_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dmCape_u, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ComCtrls;

type
  TfrmCape = class(TForm)
    dbgCape: TDBGrid;
    lblOld: TLabel;
    lblNEW: TLabel;
    btnReplace: TButton;
    cbxOldActivity: TComboBox;
    cbxNewActivity: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
  private
    procedure PopulateComboBoxes;
    procedure DeleteActivity;
    procedure DisplayAllLearners;
  public
    { Public declarations }
  end;

var
  frmCape: TfrmCape;

implementation

{$R *.dfm}

procedure TfrmCape.FormShow(Sender: TObject);
begin
    PopulateComboBoxes;
    DisplayAllLearners;
end;

procedure TfrmCape.btnReplaceClick(Sender: TObject);
var
  sOldAct, sNewAct : string;
  iNumUpdated, iIndex : Integer;
begin
  sOldAct := cbxOldActivity.Items[cbxOldActivity.ItemIndex];
  sNewAct := cbxNewActivity.Items[cbxNewActivity.ItemIndex];
  with dmCape do
    begin
      qryCape.SQL.Clear;
      qryCape.SQL.Add('UPDATE Learner');
      qryCape.SQL.Add('SET ActivityName = ' + QuotedStr(sNewAct));
      qryCape.SQL.Add('WHERE ActivityName = ' + QuotedStr(sOldAct));
      iNumUpdated:= qryCape.ExecSQL;

      DeleteActivity; //Delete the activity from table Activity.
      //Remove the name of the activity from bth ComboBoxes
      iIndex := cbxOldActivity.Items.IndexOf(sOldAct);
      cbxOldActivity.Items.Delete(iIndex);
      cbxNewActivity.Items.Delete(iIndex);
      cbxOldActivity.ItemIndex := 0 ;
      cbxNewActivity.ItemIndex := 0 ;
      //Values in the Learner table changed, therefore table should be re-displayed
      DisplayAllLearners;

      ShowMessage(IntToStr(iNumUpdated) + ' records have been updated.');
    end;

end;

procedure TfrmCape.PopulateComboBoxes;
var
  i : integer;
begin
    cbxOldActivity.Clear;
    cbxNewActivity.Clear;
    with dmCape do
    begin
      qryCape.SQL.Clear;
      qryCape.SQL.Add('SELECT DISTINCT ActivityName FROM Activity');
      qryCape.Open;
      for i := 1 to qryCape.RecordCount do
        begin
          cbxOldActivity.Items.Add(qryCape['ActivityName']);
          cbxNewActivity.Items.Add(qryCape['ActivityName']);
          qryCape.Next;
        end;
      cbxOldActivity.ItemIndex := 0 ;
      cbxNewActivity.ItemIndex := 0 ;
    end;
end;

procedure TfrmCape.DeleteActivity;
var
  sDelAct : string;
begin
  sDelAct := cbxOldActivity.Items[cbxOldActivity.ItemIndex];
  with dmCape do
    begin
      qryCape.SQL.Clear;
      qryCape.SQL.Add('DELETE FROM Activity WHERE ActivityName = ' + QuotedStr(sDelAct));
      qryCape.ExecSQL;
    end;
end;

procedure TfrmCape.DisplayAllLearners;
begin
    with dmCape do //Display all records form the Learner table
    begin
      qryCape.SQL.Clear;
      qryCape.SQL.Add('SELECT * FROM Learner');
      qryCape.Open;
      TFloatField(qryCape.FieldByName('AmountPaid')).Currency := True;
    end;
end;

end.
