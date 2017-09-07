unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ExtDlgs, Buttons;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  end;

var
  Form1: TForm1;
  n, f:integer;
  vopros, o0, o1, o2, o3, prav, xvopros, x0, x1, x2, x3, xprav, otv, n1, f1: string;
  vopros_A: array[1..10] of textfile;
  vopros_B: array[1..6] of textfile;

implementation

{$R *.dfm}

// Создание формы, привязка файлов к переменным
procedure TForm1.FormCreate(Sender: TObject);
begin
 AssignFile(vopros_A[1], 'test\A\vopros1.txt');
 AssignFile(vopros_A[2], 'test\A\vopros2.txt');
 AssignFile(vopros_A[3], 'test\A\vopros3.txt');
 AssignFile(vopros_A[4], 'test\A\vopros4.txt');
 AssignFile(vopros_A[5], 'test\A\vopros5.txt');
 AssignFile(vopros_A[6], 'test\A\vopros6.txt');
 AssignFile(vopros_A[7], 'test\A\vopros7.txt');
 AssignFile(vopros_A[8], 'test\A\vopros8.txt');
 AssignFile(vopros_A[9], 'test\A\vopros9.txt');
 AssignFile(vopros_A[10], 'test\A\vopros10.txt');

 AssignFile(vopros_B[1], 'test\B\vopros1.txt');
 AssignFile(vopros_B[2], 'test\B\vopros2.txt');
 AssignFile(vopros_B[3], 'test\B\vopros3.txt');
 AssignFile(vopros_B[4], 'test\B\vopros4.txt');
 AssignFile(vopros_B[5], 'test\B\vopros5.txt');
 AssignFile(vopros_B[6], 'test\B\vopros6.txt');

 Label2.Visible:=true;
 Label3.Visible:=true;
 Label4.Visible:=true;
 Button1.Visible:=true;
 Button2.Visible:=true;
 Panel1.Visible:=true;

 n:=1;
 Panel1.Caption:='1';
 Edit1.Clear;
 Edit2.Clear;
 Edit3.Clear;
 Edit4.Clear;
 Edit5.Clear;
 RadioButton1.Checked:=false;
 RadioButton2.Checked:=false;
 RadioButton3.Checked:=false;
 RadioButton4.Checked:=false;

 Label5.Visible:=true;
 Label6.Visible:=true;
 Label7.Visible:=true;
 Button3.Visible:=true;
 Button4.Visible:=true;
 Panel2.Visible:=true;

 f:=1;
 Panel2.Caption:='1';
 Edit6.Clear;
 Edit7.Clear;
end;

// Вкладка "Часть А"
// Кнопка "Перейти к следующему"
procedure TForm1.Button1Click(Sender: TObject);
begin
 If (n>=1) and (n<10) then n:=n+1
 else n:=1;
 If n>=1 then Str(n,n1);
 Panel1.Caption:=n1;
 Edit1.Clear;
 Edit2.Clear;
 Edit3.Clear;
 Edit4.Clear;
 Edit5.Clear;
 RadioButton1.Checked:=false;
 RadioButton2.Checked:=false;
 RadioButton3.Checked:=false;
 RadioButton4.Checked:=false;
end;

// Кнопка "Сохранить"
procedure TForm1.Button2Click(Sender: TObject);
var i: integer;
begin

 If (Edit1.Text<>'') and (Edit2.Text<>'') and (Edit3.Text<>'')
 and (Edit4.Text<>'') and (Edit5.Text<>'')then begin
  If (Radiobutton1.Checked=true) or (Radiobutton2.Checked=true)
  or (Radiobutton3.Checked=true) or (Radiobutton4.Checked=true) then begin

   If RadioButton1.Checked=true then prav:=Edit2.Text;
   If RadioButton2.Checked=true then prav:=Edit3.Text;
   If RadioButton3.Checked=true then prav:=Edit4.Text;
   If RadioButton4.Checked=true then prav:=Edit5.Text;

   Rewrite(vopros_A[n]);

   vopros:=Edit1.Text;
   o0:=Edit2.Text;
   o1:=Edit3.Text;
   o2:=Edit4.Text;
   o3:=Edit5.Text;

   xvopros:='';
   x0:='';
   x1:='';
   x2:='';
   x3:='';
   xprav:='';
   For i:=1 to length(vopros) do begin
    If vopros[i]='я' then xvopros:=xvopros+'#'
    else xvopros:=xvopros+succ(vopros[i]);
   end;
   For i:=1 to length(o0) do begin
    If o0[i]='я' then x0:=x0+'#'
    else x0:=x0+succ(o0[i]);
   end;
   For i:=1 to length(o1) do begin
    If o1[i]='я' then x1:=x1+'#'
    else x1:=x1+succ(o1[i]);
   end;
   For i:=1 to length(o2) do begin
    If o2[i]='я' then x2:=x2+'#'
    else x2:=x2+succ(o2[i]);
  end;
   For i:=1 to length(o3) do begin
    If o3[i]='я' then x3:=x3+'#'
    else x3:=x3+succ(o3[i]);
   end;
   For i:=1 to length(prav) do begin
    If prav[i]='я' then xprav:=xprav+'#'
    else xprav:=xprav+succ(prav[i]);
   end;

   Writeln(vopros_A[n],xvopros);
   Writeln(vopros_A[n],x0);
   Writeln(vopros_A[n],x1);
   Writeln(vopros_A[n],x2);
   Writeln(vopros_A[n],x3);
   Writeln(vopros_A[n],xprav);

   CloseFile(vopros_A[n]);
  end
  else showmessage('Проверьте выбор правильного ответа');
 end
 else showmessage('Проверьте заполнение полей Edit');
end;

// Вкладка "Часть В"

// Кнопка "Перейти к следующему"
procedure TForm1.Button3Click(Sender: TObject);
begin
 If (f>=1) and (f<6) then f:=f+1
 else f:=1;
 If f>=1 then Str(f,f1);
 Panel2.Caption:=f1;
 Edit6.Clear;
 Edit7.Clear;
end;

// Кнопка "Сохранить"
procedure TForm1.Button4Click(Sender: TObject);
var i: integer;
begin
 If (Edit6.Text<>'') and (Edit6.Text<>'') then begin
  Rewrite(vopros_B[f]);

  vopros:=Edit6.Text;
  prav:=Edit7.Text;

  xvopros:='';
  xprav:='';
  For i:=1 to length(vopros) do begin
   If vopros[i]='я' then xvopros:=xvopros+'#'
   else xvopros:=xvopros+succ(vopros[i]);
  end;
  For i:=1 to length(prav) do begin
   If prav[i]='я' then xprav:=xprav+'#'
   else xprav:=xprav+succ(prav[i]);
  end;

  Writeln(vopros_B[f],xvopros);
  Writeln(vopros_B[f],xprav);

  CloseFile(vopros_B[f]);
 end
 else showmessage('Проверьте заполнение полей Edit');
end;

end.
