unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mgl, StdCtrls, ExtCtrls, Buttons, Menus, ComCtrls, Grids,
  MPlayer, ScktComp, jpeg;

type
  TMainForm = class(TForm)
    PageControl1: TPageControl;
    RadioGroup1: TRadioGroup;
    StringGrid1: TStringGrid;
    ClientSocket1: TClientSocket;
    FormImage1: TImage;
    FormImage2: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Timer1: TTimer;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    BtnAbout: TButton;
    BtnEnterData: TBitBtn;
    BtnRefuse: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Edit1: TEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    CheckBox1: TCheckBox;
    procedure Dobavlenie_A;
    procedure Rashifrovka_A;
    procedure Rashifrovka_B;
    procedure Sdal;
    procedure FormCreate(Sender: TObject);
    procedure BtnEnterDataClick(Sender: TObject);
    procedure BtnRefuseClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnAboutClick(Sender: TObject);
  end;

var
  MainForm: TMainForm;
  a: array[1..10] of textfile; // Массив вопросов части А
  b: array[1..6] of textfile; // Массив вопросов части В
  ans: array[1..6] of string; // Массив ответов части В
  prav: array[1..6] of string; // Массив правильных ответов части В
  out_A: array[1..10] of boolean;
  out_B: array[1..6] of boolean;
  vopros_A, needed_A, xvopros_A, xneeded_A, o0, o1, o2, o3, x0, x1, x2, x3: string; // Переменные для расшифровки (часть А)
  vopros_B, needed_B, xvopros_B, xneeded_B: string; // Переменные для расшифровки (часть В)
  number, f_A, f_B, propusk, timer, minutes, seconds: integer;
  otvety_A, otvety_B, otvety, ball_A, ball_B, ball, ocenka: real;
  string_otvety, string_f_A, string_f_B, string_minutes, string_seconds,
  string_ball_A, string_ball_B, string_ball, string_ocenka: string; // Стринговые аналоги integer для вывода
  usersurname, username, userform, userIP: string; // Переменные для регистрации
  sdano_A, sdano_B: boolean;

implementation

{$R *.dfm}

// Процедура задержки
procedure Delay(dwMilleseconds: longint);
var iStart, iStop: DWORD;
begin
 iStart:=GetTickCount;
 repeat
  iStop:=GetTickCount;
  Application.ProcessMessages;
 until (iStop-iStart)>=dwMilleseconds;
end;

// Рандомное добавление вариантов ответа
procedure TMainForm.Dobavlenie_A;
var z: integer;
begin
 Label3.Caption:=vopros_A;
 randomize;
 RadioGroup1.Items.Clear;
 z:=random(7);
 If z=0 then begin
  RadioGroup1.Items.Add(o0);
  RadioGroup1.Items.Add(o1);
  RadioGroup1.Items.Add(o2);
  RadioGroup1.Items.Add(o3);
 end;
 If z=1 then begin
  RadioGroup1.Items.Add(o1);
  RadioGroup1.Items.Add(o2);
  RadioGroup1.Items.Add(o3);
  RadioGroup1.Items.Add(o0);
 end;
 If z=2 then begin
  RadioGroup1.Items.Add(o2);
  RadioGroup1.Items.Add(o3);
  RadioGroup1.Items.Add(o0);
  RadioGroup1.Items.Add(o1);
 end;
 If z=3 then begin
  RadioGroup1.Items.Add(o3);
  RadioGroup1.Items.Add(o2);
  RadioGroup1.Items.Add(o1);
  RadioGroup1.Items.Add(o0);
 end;
 If z=4 then begin
  RadioGroup1.Items.Add(o0);
  RadioGroup1.Items.Add(o3);
  RadioGroup1.Items.Add(o2);
  RadioGroup1.Items.Add(o1);
 end;
 If z=5 then begin
  RadioGroup1.Items.Add(o1);
  RadioGroup1.Items.Add(o0);
  RadioGroup1.Items.Add(o3);
  RadioGroup1.Items.Add(o2);
 end;
 If z=6 then begin
  RadioGroup1.Items.Add(o2);
  RadioGroup1.Items.Add(o1);
  RadioGroup1.Items.Add(o0);
  RadioGroup1.Items.Add(o3);
 end;
 If z=7 then begin
  RadioGroup1.Items.Add(o3);
  RadioGroup1.Items.Add(o1);
  RadioGroup1.Items.Add(o0);
  RadioGroup1.Items.Add(o2);
 end;
end;

// Расшифровка файла части А
procedure TMainForm.Rashifrovka_A;
var i: integer;
begin
 Reset(a[f_A]);
 ReadLn(a[f_A],xvopros_A);
 ReadLn(a[f_A],x0);
 ReadLn(a[f_A],x1);
 ReadLn(a[f_A],x2);
 ReadLn(a[f_A],x3);
 ReadLn(a[f_A],xneeded_A);

 o0:='';
 o1:='';
 o2:='';
 o3:='';
 vopros_A:='';
 needed_A:='';
 For i:=1 to length(xvopros_A) do begin
  If xvopros_A[i]='#' then vopros_A:=vopros_A+'я'
  else vopros_A:=vopros_A+pred(xvopros_A[i]);
 end;
 For i:=1 to length(x0) do begin
  If x0[i]='#' then o0:=o0+'я'
  else o0:=o0+pred(x0[i]);
 end;
 For i:=1 to length(x1) do begin
  If x1[i]='#' then o1:=o1+'я'
  else o1:=o1+pred(x1[i]);
 end;
 For i:=1 to length(x2) do begin
  If x2[i]='#' then o2:=o2+'я'
  else o2:=o2+pred(x2[i]);
 end;
 For i:=1 to length(x3) do begin
  If x3[i]='#' then o3:=o3+'я'
  else o3:=o3+pred(x3[i]);
 end;
 For i:=1 to length(xneeded_A) do begin
  If xneeded_A[i]='#' then needed_A:=needed_A+'я'
  else needed_A:=needed_A+pred(xneeded_A[i]);
 end;
end;

// Расшифровка файла части В
procedure TMainForm.Rashifrovka_B;
var i: integer;
begin
 Reset(b[f_B]);
 ReadLn(b[f_B],xvopros_B);
 ReadLn(b[f_B],xneeded_B);

 vopros_B:='';
 needed_B:='';
 For i:=1 to length(xvopros_B) do begin
  If xvopros_B[i]='#' then vopros_B:=vopros_B+'я'
  else vopros_B:=vopros_B+pred(xvopros_B[i]);
 end;
 For i:=1 to length(x0) do begin
  If x0[i]='#' then o0:=o0+'я'
  else o0:=o0+pred(x0[i]);
 end;
 For i:=1 to length(x1) do begin
  If x1[i]='#' then o1:=o1+'я'
  else o1:=o1+pred(x1[i]);
 end;
 For i:=1 to length(x2) do begin
  If x2[i]='#' then o2:=o2+'я'
  else o2:=o2+pred(x2[i]);
 end;
 For i:=1 to length(x3) do begin
  If x3[i]='#' then o3:=o3+'я'
  else o3:=o3+pred(x3[i]);
 end;
 For i:=1 to length(xneeded_B) do begin
  If xneeded_B[i]='#' then needed_B:=needed_B+'я'
  else needed_B:=needed_B+pred(xneeded_B[i]);
 end;
end;

// Обработка результатов теста
procedure TMainForm.Sdal;
var i: integer;
begin
 If (sdano_A=true) and (sdano_B=true) then begin
  otvety:=otvety_A+otvety_B;
  str(otvety:2:0, string_otvety);
  Panel16.Caption:='Результат: '+string_otvety+' из 16';
  Timer1.Enabled:=false;
  Panel5.Caption:='';
  Panel7.Caption:='';
  Panel13.Caption:='';

  ball_A:=otvety_A*4+propusk;
  ball_B:=otvety_B*10;
  ball:=ball_A+ball_B;
  ocenka:=round(ball/10);
  Str(ball_A:3:0,string_ball_A);
  Str(ball_B:3:0,string_ball_B);
  Str(ball:3:0,string_ball);
  Str(ocenka:1:0,string_ocenka);
  Panel9.Caption:=string_ball+'/100';
  Panel10.Caption:=string_ball_A+'/40';
  Panel11.Caption:=string_ball_B+'/60';
  Panel12.Caption:=string_ocenka;
  If ball>85 then Label12.Caption:='отлично';
  If (ball<=85) and (ball>65) then Label12.Caption:='хорошо';
  If (ball<=65) and (ball>45) then Label12.Caption:='удовлетворительно';
  If (ball<=45) then Label12.Caption:='неудовлетворительно';

  For i:=1 to 10 do begin
   If out_A[i]=true then StringGrid1.Cells[1,i]:='Правильно'
   else StringGrid1.Cells[1,i]:='Неправильно';
  end;

  For i:=1 to 6 do begin
   If out_B[i]=true then StringGrid1.Cells[3,i]:='Правильно'
   else StringGrid1.Cells[3,i]:='Неправильно';
  end;

  If ClientSocket1.Active=true then begin
   Label13.Caption:='Отсылка результата...';
   ClientSocket1.Socket.SendText(usersurname);
   Delay(500);
   ClientSocket1.Socket.SendText(username);
   Delay(500);
   ClientSocket1.Socket.SendText(userform);
   Delay(500);
   ClientSocket1.Socket.SendText(string_ocenka);
   Label14.Caption:='Результат успешно отослан';
  end;
 end;
end;

// Создание формы
procedure TMainForm.FormCreate(Sender: TObject);
begin
 FormImage1.Canvas.Pen.Color:=clBtnFace;
 FormImage1.Canvas.Brush.Color:=clBtnFace;
 FormImage1.Canvas.Rectangle(0,0,9,473);
 FormImage1.Canvas.Pen.Color:=clBlack;
 FormImage1.Canvas.Brush.Color:=clBlack;
 FormImage1.Canvas.MoveTo(2,0);
 FormImage1.Canvas.LineTo(2,473);
 FormImage1.Canvas.MoveTo(5,0);
 FormImage1.Canvas.LineTo(5,473);
 FormImage1.Canvas.MoveTo(8,0);
 FormImage1.Canvas.LineTo(8,473);

 FormImage2.Canvas.Pen.Color:=clBtnFace;
 FormImage2.Canvas.Brush.Color:=clBtnFace;
 FormImage2.Canvas.Rectangle(0,0,9,473);
 FormImage2.Canvas.Pen.Color:=clBlack;
 FormImage2.Canvas.Brush.Color:=clBlack;
 FormImage2.Canvas.MoveTo(2,0);
 FormImage2.Canvas.LineTo(2,473);
 FormImage2.Canvas.MoveTo(5,0);
 FormImage2.Canvas.LineTo(5,473);
 FormImage2.Canvas.MoveTo(8,0);
 FormImage2.Canvas.LineTo(8,473);

 Image1.Picture.LoadFromFile('theory\Theory1.bmp');
 number:=1;
 Panel14.Caption:='1';

 AssignFile(a[1], 'test\A\vopros1.txt');
 AssignFile(a[2], 'test\A\vopros2.txt');
 AssignFile(a[3], 'test\A\vopros3.txt');
 AssignFile(a[4], 'test\A\vopros4.txt');
 AssignFile(a[5], 'test\A\vopros5.txt');
 AssignFile(a[6], 'test\A\vopros6.txt');
 AssignFile(a[7], 'test\A\vopros7.txt');
 AssignFile(a[8], 'test\A\vopros8.txt');
 AssignFile(a[9], 'test\A\vopros9.txt');
 AssignFile(a[10], 'test\A\vopros10.txt');
 AssignFile(b[1], 'test\B\vopros1.txt');
 AssignFile(b[2], 'test\B\vopros2.txt');
 AssignFile(b[3], 'test\B\vopros3.txt');
 AssignFile(b[4], 'test\B\vopros4.txt');
 AssignFile(b[5], 'test\B\vopros5.txt');
 AssignFile(b[6], 'test\B\vopros6.txt');

 StringGrid1.Cells[0,0]:='Вопрос';
 StringGrid1.Cells[0,1]:='A1';
 StringGrid1.Cells[0,2]:='A2';
 StringGrid1.Cells[0,3]:='A3';
 StringGrid1.Cells[0,4]:='A4';
 StringGrid1.Cells[0,5]:='A5';
 StringGrid1.Cells[0,6]:='A6';
 StringGrid1.Cells[0,7]:='A7';
 StringGrid1.Cells[0,8]:='A8';
 StringGrid1.Cells[0,9]:='A9';
 StringGrid1.Cells[0,10]:='A10';
 StringGrid1.Cells[1,0]:='Результат';
 StringGrid1.Cells[2,0]:='Задача';
 StringGrid1.Cells[2,1]:='B1';
 StringGrid1.Cells[2,2]:='B2';
 StringGrid1.Cells[2,3]:='B3';
 StringGrid1.Cells[2,4]:='B4';
 StringGrid1.Cells[2,5]:='B5';
 StringGrid1.Cells[2,6]:='B6';
 StringGrid1.Cells[3,0]:='Результат';
end;

// Обработка вкладки "Старт"
// Кнопка "Подтвердить"
procedure TMainForm.BtnEnterDataClick(Sender: TObject);
begin
 If ((LabeledEdit1.Text>'') and (LabeledEdit2.Text>'') and
    (LabeledEdit3.Text>'') and (LabeledEdit4.Text>''))
 or ((LabeledEdit1.Text>'') and (LabeledEdit2.Text>'') and
    (LabeledEdit3.Text>'') and (CheckBox1.Checked=true)) then begin
  usersurname:=LabeledEdit1.Text;
  username:=LabeledEdit2.Text;
  userform:=LabeledEdit3.Text;
  ClientSocket1.Address:=LabeledEdit4.Text;
  If CheckBox1.Checked=true then ClientSocket1.Host:='localhost';
  ClientSocket1.Active:=true;
  BtnEnterData.Visible:=false;
  BtnRefuse.Visible:=false;
  LabeledEdit1.Enabled:=false;
  LabeledEdit2.Enabled:=false;
  LabeledEdit3.Enabled:=false;
  LabeledEdit4.Enabled:=false;
  BitBtn5.Visible:=true;
 end
 else ShowMessage('Проверьте введенные данные!');
end;

// Кнопка "Игнорировать"
procedure TMainForm.BtnRefuseClick(Sender: TObject);
begin
 BtnEnterData.Visible:=false;
 BtnRefuse.Visible:=false;
 LabeledEdit1.Enabled:=false;
 LabeledEdit2.Enabled:=false;
 LabeledEdit3.Enabled:=false;
 LabeledEdit4.Enabled:=false;
 BitBtn5.Visible:=true;
end;

// Обработка вкладки "Теория"
// Кнопка "Предыдущий слайд"
procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
 If (number>1) and (number<=5) then number:=number-1;
 If number=1 then begin
  Image1.Picture.LoadFromFile('theory\Theory1.bmp');
  Panel14.Caption:='1';
 end;
 If number=2 then begin
  Image1.Picture.LoadFromFile('theory\Theory2.bmp');
  Panel14.Caption:='2';
 end;
 If number=3 then begin
   Image1.Picture.LoadFromFile('theory\Theory3.bmp');
   Panel14.Caption:='3';
 end;
 If number=4 then begin
   Image1.Picture.LoadFromFile('theory\Theory4.bmp');
   Panel14.Caption:='4';
 end;
 If number=5 then begin
   Image1.Picture.LoadFromFile('theory\Theory5.bmp');
   Panel14.Caption:='5';
 end;
end;

// Кнопка "К первому слайду"
procedure TMainForm.BitBtn2Click(Sender: TObject);
begin
 Image1.Picture.LoadFromFile('theory\Theory1.bmp');
 number:=1;
 Panel14.Caption:='1';
end;

// Кнопка "Следующий слайд"
procedure TMainForm.BitBtn3Click(Sender: TObject);
begin
 If (number>=1) and (number<5) then number:=number+1;
 If number=1 then begin
  Image1.Picture.LoadFromFile('theory\Theory1.bmp');
  Panel14.Caption:='1';
 end;
 If number=2 then begin
  Image1.Picture.LoadFromFile('theory\Theory2.bmp');
  Panel14.Caption:='2';
 end;
 If number=3 then begin
   Image1.Picture.LoadFromFile('theory\Theory3.bmp');
   Panel14.Caption:='3';
 end;
 If number=4 then begin
   Image1.Picture.LoadFromFile('theory\Theory4.bmp');
   Panel14.Caption:='4';
 end;
 If number=5 then begin
   Image1.Picture.LoadFromFile('theory\Theory5.bmp');
   Panel14.Caption:='5';
 end;
end;

// Обработка вкладки "Демонстрация"
// Кнопка "Перейти к демонстрациии"
procedure TMainForm.BitBtn4Click(Sender: TObject);
begin
 DemForm.ShowModal;
end;

// Обработка вкладки "Тест"
// Кнопка "Начать тест"
procedure TMainForm.BitBtn5Click(Sender: TObject);
begin
 Panel7.Caption:='10:00';
 timer:=600;
 Timer1.Enabled:=true;

 f_A:=1;
 otvety_A:=0;
 Str(f_A,string_f_A);
 Panel5.Caption:=string_f_A;
 Rashifrovka_A;
 Dobavlenie_A;

 f_B:=1;
 otvety_B:=0;
 Str(f_B, string_f_B);
 Panel13.Caption:=string_f_B;
 Rashifrovka_B;
 Label4.Caption:=vopros_B;
 prav[f_B]:=needed_B;

 BitBtn5.Visible:=false;
 BitBtn6.Visible:=true;
 BitBtn7.Visible:=true;
 BitBtn8.Visible:=true;
 BitBtn9.Visible:=true;
 BitBtn10.Visible:=true;
end;

// Кнопка "Ответить"
procedure TMainForm.BitBtn6Click(Sender: TObject);
begin
 If f_A=10 then begin
  If RadioGroup1.ItemIndex>=0 then
   If RadioGroup1.Items[RadioGroup1.ItemIndex]=needed_A then begin
    otvety_A:=otvety_A+1;
    out_A[10]:=true;
   end;
  Panel3.Caption:='Часть А завершена';
  sdano_A:=true;
  RadioGroup1.Items.Clear;
  Label3.Caption:='';
  Panel5.Caption:='';
  BitBtn6.Visible:=false;
  BitBtn7.Visible:=false;
  Sdal;
 end
 else begin
  f_A:=f_A+1;
  Str(f_A,string_f_A);
  Panel5.Caption:=string_f_A;
  If RadioGroup1.ItemIndex>=0 then
   If RadioGroup1.Items[RadioGroup1.ItemIndex]=needed_A then begin
    otvety_A:=otvety_A+1;
    out_A[f_A-1]:=true;
   end;
  Rashifrovka_A;
  Dobavlenie_A;
 end;
end;

// Кнопка "Пропустить"
procedure TMainForm.BitBtn7Click(Sender: TObject);
begin
 If f_A=10 then begin
  propusk:=propusk+1;
  Panel3.Caption:='Часть А завершена';
  sdano_A:=true;
  RadioGroup1.Items.Clear;
  Label3.Caption:='';
  Panel5.Caption:='';
  BitBtn6.Visible:=false;
  BitBtn7.Visible:=false;
  Sdal;
 end
 else begin
  f_A:=f_A+1;
  Str(f_A,string_f_A);
  Panel5.Caption:=string_f_A;
  propusk:=propusk+1;
  Rashifrovka_A;
  Dobavlenie_A;
 end;
end;

// Кнопка "Сдать"
procedure TMainForm.BitBtn8Click(Sender: TObject);
var i: integer;
begin
 Panel13.Caption:='';
 Label4.Caption:='';
 Panel6.Caption:='Часть В завершена';
 sdano_B:=true;
 Ans[f_B]:=Edit1.Text;
 For i:=1 to 6 do begin
  f_B:=i;
  Rashifrovka_B;
  prav[i]:=needed_B;
  If ans[i]=prav[i] then begin
   otvety_B:=otvety_B+1;
   out_B[f_B]:=true;
  end;
 end;
 Edit1.Clear;
 BitBtn8.Visible:=false;
 BitBtn9.Visible:=false;
 BitBtn10.Visible:=false;
 Sdal;
end;

// Кнопка "Следующий вопрос"
procedure TMainForm.BitBtn9Click(Sender: TObject);
begin
 Ans[f_B]:=Edit1.Text;
 If (f_B>=1) and (f_B<6) then f_B:=f_B+1;
 Str(f_B, string_f_B);
 Edit1.Text:=ans[f_B];
 Panel13.Caption:=string_f_B;
 Rashifrovka_B;
 Label4.Caption:=vopros_B;
 prav[f_B]:=needed_B;
end;

// Кнопка "Предыдущий вопрос"
procedure TMainForm.BitBtn10Click(Sender: TObject);
begin
 Ans[f_B]:=Edit1.Text;
 If (f_B>1) and (f_B<=6) then f_B:=f_B-1;
 Str(f_B, string_f_B);
 Edit1.Text:=ans[f_B];
 Panel13.Caption:=string_f_B;
 Rashifrovka_B;
 Label4.Caption:=vopros_B;
 prav[f_B]:=needed_B;
end;

// Обработка таймера
procedure TMainForm.Timer1Timer(Sender: TObject);
var i:integer;
begin
 timer:=timer-1;
 minutes:=timer div 60;
 seconds:=timer mod 60;
 Str(minutes, string_minutes);
 Str(seconds, string_seconds);
 If seconds<10 then string_seconds:='0'+string_seconds;
 Panel7.Caption:=string_minutes+':'+string_seconds;
 If timer=0 then begin
  If sdano_A=false then begin
   Panel3.Caption:='Время вышло';
   sdano_A:=true;
   RadioGroup1.Items.Clear;
   Label3.Caption:='';
   Panel5.Caption:='';
   BitBtn6.Visible:=false;
   BitBtn7.Visible:=false;
   Sdal;
  end;
  If sdano_B=false then begin
   Panel6.Caption:='Время вышло';
   sdano_B:=true;
   Ans[f_B]:=Edit1.Text;
   For i:=1 to 6 do begin
    f_B:=i;
    Rashifrovka_B;
    prav[i]:=needed_B;
    If ans[i]=prav[i] then begin
     otvety_B:=otvety_B+1;
     out_B[f_B]:=true;
    end;
   end;
   BitBtn8.Visible:=false;
   BitBtn9.Visible:=false;
   BitBtn10.Visible:=false;
   Sdal;
  end;
 end;
end;

procedure TMainForm.BtnAboutClick(Sender: TObject);
begin
 ShowMessage('Автор работы: Молчанов Иван'+#13#10+'ученик Гимназии №1 г.Бреста'+#13#10+'Версия приложения 4.0');
end;

end.
