unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    ServerSocket1: TServerSocket;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    SaveBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure SaveBtnClick(Sender: TObject);
  end;

var
  Form1: TForm1;
  N, a, f: integer;
  stringN, stringResult: string;
  result: textfile;

implementation

{$R *.dfm}

// �������� �����
procedure TForm1.FormCreate(Sender: TObject);
begin
 a:=0;
 f:=1;
 StringGrid1.Cells[0,0]:='�������';
 StringGrid1.Cells[1,0]:='���';
 StringGrid1.Cells[2,0]:='�����';
 StringGrid1.Cells[3,0]:='������';
end;

// ������ "�������� ������"
procedure TForm1.Button1Click(Sender: TObject);
begin
 Panel3.Caption:='0';
 ServerSocket1.Active:=true;
 Label1.Caption:='������ �������';
 Panel2.Visible:=true;
 Panel3.Visible:=true;
 Button2.Visible:=true;
 SaveBtn.Visible:=true;
end;

// ������ "�������������"
procedure TForm1.Button2Click(Sender: TObject);
var i,j,n,ind: integer;
    min,m1,m2,m3: string;
begin

For i:=1 to 40 do begin
    If StringGrid1.Cells[0,i]<>'' then n:=i;
end;

For i:=1 to n-1 do begin
    min:=StringGrid1.Cells[0,i];
    m1:=StringGrid1.Cells[1,i];
    m2:=StringGrid1.Cells[2,i];
    m3:=StringGrid1.Cells[3,i];
    ind:=i;
    For j:=i+1 to n do begin
        If StringGrid1.Cells[0,j]<min then begin
            min:=StringGrid1.Cells[0,j];
            m1:=StringGrid1.Cells[1,j];
            m2:=StringGrid1.Cells[2,j];
            m3:=StringGrid1.Cells[3,j];
            ind:=j;
        end;
    end;
    StringGrid1.Cells[0,ind]:=StringGrid1.Cells[0,i];
    StringGrid1.Cells[1,ind]:=StringGrid1.Cells[1,i];
    StringGrid1.Cells[2,ind]:=StringGrid1.Cells[2,i];
    StringGrid1.Cells[3,ind]:=StringGrid1.Cells[3,i];
    StringGrid1.Cells[0,i]:=min;
    StringGrid1.Cells[1,i]:=m1;
    StringGrid1.Cells[2,i]:=m2;
    StringGrid1.Cells[3,i]:=m3;
end;

end;

// ������ "��������� ������"
procedure TForm1.Button3Click(Sender: TObject);
begin
 N:=0;
 ServerSocket1.Active:=false;
 Label1.Caption:='������ ��������';
 Panel2.Visible:=false;
 Panel3.Visible:=false;
 Button2.Visible:=false;
end;

// ������������� �������
procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 N:=N+1;
 Str(N, stringN);
 Panel3.Caption:=stringN;
end;

// ������������ �������
procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 N:=N-1;
 Str(N, stringN);
 Panel3.Caption:=stringN;
end;

// ����� ������
procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 StringGrid1.Cells[a,f]:=Socket.ReceiveText;
 If a<3 then a:=a+1
 else begin
  a:=0;
  f:=f+1;
 end;
end;

procedure TForm1.SaveBtnClick(Sender: TObject);
var i: integer;
begin
 AssignFile(result,'Result.txt');
 Rewrite(result);

 For i:=1 to 40 do begin
  stringResult:=StringGrid1.Cells[0,i];
  Writeln(result,stringResult);
  stringResult:=StringGrid1.Cells[1,i];
  Writeln(result,stringResult);
  stringResult:=StringGrid1.Cells[2,i];
  Writeln(result,stringResult);
  stringResult:=StringGrid1.Cells[3,i];
  Writeln(result,stringResult);
  Writeln(result,'');
 end;
 CloseFile(result);
end;

end.
