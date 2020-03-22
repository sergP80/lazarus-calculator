unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    B1: TButton;
    BClear: TButton;
    BPlus: TButton;
    BMinus: TButton;
    B12: TButton;
    B13: TButton;
    B14: TButton;
    BSqrt: TButton;
    BInverse: TButton;
    BPi: TButton;
    BNatLog: TButton;
    B2: TButton;
    B3: TButton;
    B4: TButton;
    B5: TButton;
    B6: TButton;
    B7: TButton;
    B8: TButton;
    B9: TButton;
    B0: TButton;
    BExp: TButton;
    BComma: TButton;
    BCos: TButton;
    BEq: TButton;
    BSin: TButton;
    Edit1: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure B0Click(Sender: TObject);
    procedure BPiClick(Sender: TObject);
    procedure BNatLogClick(Sender: TObject);
    procedure BExpClick(Sender: TObject);
    procedure BCosClick(Sender: TObject);
    procedure BSinClick(Sender: TObject);
    procedure BInverseClick(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure BClearClick(Sender: TObject);
    procedure BCommaClick(Sender: TObject);
    procedure BEqClick(Sender: TObject);
    procedure BPlusClick(Sender: TObject);
    procedure BSqrtClick(Sender: TObject);
  private
    saved: String;
    needClear: Boolean;
    operation: Char;
    procedure CheckClear();
    function BinCompute(a: String; b: String; op: Char; var res: String): Boolean;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CheckClear();
begin
 if needClear then
   begin
    Edit1.Text := '';
    needClear := false;
   end;
end;

function TForm1.BinCompute(a: String; b: String; op: Char; var res: String): Boolean;
var
  op1, op2, r: Double;
  succ, intRes: Boolean;
begin
  op1 := StrToFloat(a);
  op2 := StrToFloat(b);
  succ := True;
  intRes := False;
  case op of
   '+': r := op1 + op2;
   '-': r := op1 - op2;
   '*': r := op1 * op2;
   '/': r := op1 / op2;
   '%': begin
         intRes := True;
         res := IntToStr(StrToInt(a) div StrToInt(b));
        end;
   else
     succ := False;
  end;

  if (succ and not intRes) then
  begin
    res := FloatToStr(r);
  end;
  Result := succ;
end;

procedure TForm1.B1Click(Sender: TObject);
begin
  if (Sender is TButton) then
  begin
   CheckClear();
   Edit1.Text := Edit1.Text + (Sender as TButton).Caption;
  end;

end;

procedure TForm1.BClearClick(Sender: TObject);
begin
  saved := '';
  Edit1.Text := '';
end;

procedure TForm1.BCommaClick(Sender: TObject);
begin
  if (Sender is TButton) then
  begin
    CheckClear();
    if (Edit1.Text <> '') and (Pos(DecimalSeparator, Edit1.Text) = 0) then
    begin
      Edit1.Text := Edit1.Text + (Sender as TButton).Caption;
    end;
  end;
end;

procedure TForm1.BEqClick(Sender: TObject);
var
  result: String;
begin
  if (saved <> '') then
  begin
   if BinCompute(saved, Edit1.Text, operation, result) then
   begin
    Edit1.Text := result;
   end;
  end;
end;

procedure TForm1.BPlusClick(Sender: TObject);
var
  operations: array[1..5] of Char = ('+', '-', '*', '/', '%');
  opTag: integer;
begin
  if (Sender is TButton) then
  begin
    if Edit1.Text <> '' then
    begin
     saved := Edit1.Text;
     needClear := True;
     opTag := (Sender as TButton).Tag;
     operation := operations[opTag];
    end;
  end;
end;

procedure TForm1.BSqrtClick(Sender: TObject);
var
  x : Double;
begin
 if (Sender is TButton) then
  begin
    if Edit1.Text <> '' then
    begin
     x := StrToFloat(Edit1.Text);
     Edit1.Text := FloatToStr(sqrt(x));
    end;
  end;
end;

procedure TForm1.B0Click(Sender: TObject);
begin
  if (Sender is TButton) then
  begin
    CheckClear();
    if Edit1.Text <> '' then
    begin
      Edit1.Text := Edit1.Text + (Sender as TButton).Caption;
    end;
  end;
end;

procedure TForm1.BPiClick(Sender: TObject);
begin
 if (Sender is TButton) then
  begin
   Edit1.Text := FloatToStr(pi);
  end;
end;

procedure TForm1.BNatLogClick(Sender: TObject);
var
  x : Double;
begin
 if (Sender is TButton) then
  begin
    if Edit1.Text <> '' then
    begin
     x := StrToFloat(Edit1.Text);
     Edit1.Text := FloatToStr(ln(x));
    end;
  end;
end;

procedure TForm1.BExpClick(Sender: TObject);
var
  x : Double;
begin
 if (Sender is TButton) then
  begin
    if Edit1.Text <> '' then
    begin
     x := StrToFloat(Edit1.Text);
     Edit1.Text := FloatToStr(exp(x));
    end;
  end;
end;

procedure TForm1.BCosClick(Sender: TObject);
var
  x : Double;
begin
 if (Sender is TButton) then
  begin
    if Edit1.Text <> '' then
    begin
     x := StrToFloat(Edit1.Text);
     Edit1.Text := FloatToStr(cos(x));
    end;
  end;
end;

procedure TForm1.BSinClick(Sender: TObject);
var
  x : Double;
begin
 if (Sender is TButton) then
  begin
    if Edit1.Text <> '' then
    begin
     x := StrToFloat(Edit1.Text);
     Edit1.Text := FloatToStr(sin(x));
    end;
  end;
end;

procedure TForm1.BInverseClick(Sender: TObject);
var
  x : Double;
begin
 if (Sender is TButton) then
  begin
    if Edit1.Text <> '' then
    begin
     x := StrToFloat(Edit1.Text);
     Edit1.Text := FloatToStr(1.0 / x);
    end;
  end;
end;

end.

