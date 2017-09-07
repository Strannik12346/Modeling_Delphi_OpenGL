unit mgl;

interface

uses
  Windows, Messages, Classes, Graphics, Forms, ExtCtrls, OpenGL, StdCtrls,
  Controls, SysUtils, Spin, Menus, Dialogs, Buttons, ComCtrls, Grids;

type
  TDemForm = class(TForm)
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    BitBtn7: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ColorBox1: TColorBox;
    Label6: TLabel;
    Label7: TLabel;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);

  private
    DC: HDC;
    hrc: HGLRC;

    procedure CanvasDraw;
    procedure GraphicsDraw;
    procedure StringGridFulfill;
    procedure DrawScene;
    procedure InitializeRC;
    procedure SetDCPixelFormat;

  protected
    // Обработка сообщения WM_PAINT - аналог события OnPaint
    procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
  end;

var
  DemForm: TForm;
  ch, code, constX, constY: integer;
  cor0X, cor0Y, corX, corY, V0x, V0y, Vx, Vy, M, V, U, E0, Ek, Ep, VT, t, RED, GREEN, BLUE: real;
  stringM, stringV, stringU, StringVx, StringVy, StringVT, StringEk, StringEp: string;

implementation

{$R *.DFM}

const
 // Массивы свойств материала
 LineColor: Array [0..3] of GLfloat = (0.7,0.0,0.2,1);
 PointColor: Array [0..3] of GLfloat = (0,0.2,0.8,1);
 MaterialColor: Array [0..3] of GLfloat = (1,1,1,1);

 // Процедура инициализации источника цвета
procedure TDemForm.InitializeRC;
begin
 glEnable(GL_DEPTH_TEST); // разрешаем тест глубины
 glEnable(GL_LIGHTING); // разрешаем работу с освещенностью
 glEnable(GL_LIGHT0); // включаем источник света 0
end;

procedure TDemForm.CanvasDraw;
begin
 // Отрисовка системы координат на Image1,2,3
 // Image1
 Image1.Canvas.Pen.Color:=ColorBox1.Selected;
 Image1.Canvas.Brush.Color:=ColorBox1.Selected;
 Image1.Canvas.Rectangle(0,0,constX,constY);
 Image1.Canvas.Pen.Color:=clWhite;
 Image1.Canvas.MoveTo(16,constY-16);
 Image1.Canvas.LineTo(16,20);
 Image1.Canvas.LineTo(19,32);
 Image1.Canvas.LineTo(16,29);
 Image1.Canvas.LineTo(13,32);
 Image1.Canvas.LineTo(16,20);
 Image1.Canvas.LineTo(15,29);
 Image1.Canvas.LineTo(13,31);
 Image1.Canvas.LineTo(16,20);
 Image1.Canvas.LineTo(17,29);
 Image1.Canvas.LineTo(19,31);
 Image1.Canvas.MoveTo(16,constY-16);
 Image1.Canvas.LineTo(constX-16, constY-16);
 Image1.Canvas.LineTo(constX-28,constY-19);
 Image1.Canvas.LineTo(constX-25,constY-16);
 Image1.Canvas.LineTo(constX-28,constY-13);
 Image1.Canvas.LineTo(constX-16,constY-16);
 Image1.Canvas.LineTo(constX-25,constY-17);
 Image1.Canvas.LineTo(constX-27,constY-18);
 Image1.Canvas.LineTo(constX-16,constY-16);
 Image1.Canvas.LineTo(constX-25,constY-15);
 Image1.Canvas.LineTo(constX-27,constY-14);
 Image1.Canvas.Font.Color:=clWhite;
 Image1.Canvas.Font.Size:=12;
 Image1.Canvas.Font.Style:=[fsBold];
 Image1.Canvas.TextOut(constX-12, constY-20,'t');
 Image1.Canvas.TextOut(constX-28, 2,'Ox');
 Image1.Canvas.TextOut(2,0,'V(t)');

 // Image2
 Image2.Canvas.Pen.Color:=ColorBox1.Selected;
 Image2.Canvas.Brush.Color:=ColorBox1.Selected;
 Image2.Canvas.Rectangle(0,0,constX,constY);
 Image2.Canvas.Pen.Color:=clWhite;
 Image2.Canvas.MoveTo(16,constY-16);
 Image2.Canvas.LineTo(16,20);
 Image2.Canvas.LineTo(19,32);
 Image2.Canvas.LineTo(16,29);
 Image2.Canvas.LineTo(13,32);
 Image2.Canvas.LineTo(16,20);
 Image2.Canvas.LineTo(15,29);
 Image2.Canvas.LineTo(13,31);
 Image2.Canvas.LineTo(16,20);
 Image2.Canvas.LineTo(17,29);
 Image2.Canvas.LineTo(19,31);
 Image2.Canvas.MoveTo(16,constY-16);
 Image2.Canvas.LineTo(constX-16, constY-16);
 Image2.Canvas.LineTo(constX-28,constY-19);
 Image2.Canvas.LineTo(constX-25,constY-16);
 Image2.Canvas.LineTo(constX-28,constY-13);
 Image2.Canvas.LineTo(constX-16,constY-16);
 Image2.Canvas.LineTo(constX-25,constY-17);
 Image2.Canvas.LineTo(constX-27,constY-18);
 Image2.Canvas.LineTo(constX-16,constY-16);
 Image2.Canvas.LineTo(constX-25,constY-15);
 Image2.Canvas.LineTo(constX-27,constY-14);
 Image2.Canvas.Font.Color:=clWhite;
 Image2.Canvas.Font.Size:=12;
 Image2.Canvas.Font.Style:=[fsBold];
 Image2.Canvas.TextOut(constX-12, constY-20,'t');
 Image2.Canvas.TextOut(constX-28, 2,'Oy');
 Image2.Canvas.TextOut(2,0,'V(t)');

 // Image3
 Image3.Canvas.Pen.Color:=ColorBox1.Selected;
 Image3.Canvas.Brush.Color:=ColorBox1.Selected;
 Image3.Canvas.Rectangle(0,0,constX,constY);
 Image3.Canvas.Pen.Color:=clWhite;
 Image3.Canvas.MoveTo(16,constY-16);
 Image3.Canvas.LineTo(16,40);
 Image3.Canvas.LineTo(19,52);
 Image3.Canvas.LineTo(16,49);
 Image3.Canvas.LineTo(13,52);
 Image3.Canvas.LineTo(16,40);
 Image3.Canvas.LineTo(15,49);
 Image3.Canvas.LineTo(13,51);
 Image3.Canvas.LineTo(16,40);
 Image3.Canvas.LineTo(17,49);
 Image3.Canvas.LineTo(19,51);
 Image3.Canvas.MoveTo(16,constY-16);
 Image3.Canvas.LineTo(constX-16, constY-16);
 Image3.Canvas.LineTo(constX-28,constY-19);
 Image3.Canvas.LineTo(constX-25,constY-16);
 Image3.Canvas.LineTo(constX-28,constY-13);
 Image3.Canvas.LineTo(constX-16,constY-16);
 Image3.Canvas.LineTo(constX-25,constY-17);
 Image3.Canvas.LineTo(constX-27,constY-18);
 Image3.Canvas.LineTo(constX-16,constY-16);
 Image3.Canvas.LineTo(constX-25,constY-15);
 Image3.Canvas.LineTo(constX-27,constY-14);
 Image3.Canvas.Font.Color:=clWhite;
 Image3.Canvas.Font.Size:=12;
 Image3.Canvas.Font.Style:=[fsBold];
 Image3.Canvas.TextOut(constX-12, constY-20,'t');
 Image3.Canvas.TextOut(2,0,'Ep(t)');
 Image3.Canvas.TextOut(2,18,'Ek(t)');
 Image3.Canvas.Pen.Color:=clYellow;
 Image3.Canvas.Pen.Width:=3;
 Image3.Canvas.MoveTo(46,8);
 Image3.Canvas.LineTo(120,8);
 Image3.Canvas.Pen.Color:=clGreen;
 Image3.Canvas.MoveTo(46,28);
 Image3.Canvas.LineTo(120,28);
 Image3.Canvas.Pen.Width:=1;
end;

procedure TDemForm.GraphicsDraw;
begin
 // Отрисовка графика Vx(t)
 Vx:=V0x;
 Image1.Canvas.Pen.Color:=clHighlight;
 Image1.Canvas.Brush.Color:=clHighlight;
 Image1.Canvas.Rectangle(17+trunc(200*t), constY-(17+trunc(20*Vx)),
                         20+trunc(200*t), constY-(17+trunc(20*Vx)+3));

 // Отрисовка графика Vy(t)
 Vy:=V0y-10*t;
 Image2.Canvas.Pen.Color:=clRed;
 Image2.Canvas.Brush.Color:=clRed;
 Image2.Canvas.Ellipse(17+trunc(200*t), constY-(17+abs(trunc(20*Vy))),
                       20+trunc(200*t), constY-(17+abs(trunc(20*Vy))+3));

 // Отрисовка графиков Ek(t), Ep(t)
 Ek:=m*(Vx*Vx+Vy*Vy)/2;
 Ep:=E0-Ek;
 Image3.Canvas.Pen.Color:=clGreen;
 Image3.Canvas.Brush.Color:=clGreen;
 Image3.Canvas.Ellipse(17+trunc(200*t), constY-(17+trunc(Ek)),
                       20+trunc(200*t), constY-(20+trunc(Ek)));
 Image3.Canvas.Pen.Color:=clYellow;
 Image3.Canvas.Brush.Color:=clHighlight;
 Image3.Canvas.Ellipse(17+trunc(200*t), constY-(17+trunc(Ep)),
                       20+trunc(200*t), constY-(20+trunc(Ep)));
end;

procedure TDemForm.StringGridFulfill;
begin
 VT:=sqrt(Vx*Vx+Vy*Vy);

 Str(Vx:6:2, StringVx);
 Str(Vy:6:2, StringVy);
 Str(VT:6:2, StringVT);
 Str(Ek:6:2, StringEk);
 Str(Ep:6:2, StringEp);

 StringGrid1.Cells[1,1]:=StringVx;
 StringGrid1.Cells[1,2]:=StringVy;
 StringGrid1.Cells[1,3]:=StringVT;
 StringGrid1.Cells[1,4]:=StringEk;
 StringGrid1.Cells[1,5]:=StringEp;
end;

 // Отрисовка картинки
procedure TDemForm.DrawScene;
begin
 glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
 glMatrixMode(GL_MODELVIEW);
 glLoadIdentity;
 glTranslatef(-3.6,0.2,-8);
 glEnable(GL_POINT_SMOOTH);
 glEnable(GL_LINE_STIPPLE);
 glLineStipple(1,255);
 glPointSize(10);
 glMaterialfv(GL_FRONT, GL_AMBIENT_AND_DIFFUSE, @MaterialColor);

 If (TrackBar1.Position<50) or (TrackBar2.Position<50) or
    (TrackBar3.Position<50) then glClearColor(RED, GREEN, BLUE, 1);

 // Отрисовка осей координат
 glBegin(GL_LINES);
  glVertex(0,0); glVertex(5.3,0);
  glVertex(0,0); glVertex(0,1.6);
 glEnd;

 glDisable(GL_LINE_STIPPLE);
 glBegin(GL_LINES);
  glVertex(5.3,0); glVertex(5.2,0.03);
  glVertex(5.3,0); glVertex(5.2,-0.03);
  glVertex(0,1.6); glVertex(0.03,1.5);
  glVertex(0,1.6); glVertex(-0.03,1.5);
 glEnd;

 glMaterialfv(GL_FRONT, GL_AMBIENT_AND_DIFFUSE, @LineColor);
 glBegin(GL_LINES);
  glVertex(-1,-0.12); glVertex(6,-0.12);
 glEnd;

 glMaterialfv(GL_FRONT, GL_AMBIENT_AND_DIFFUSE, @PointColor);
 glBegin(GL_POINTS);
  glVertex(corX,corY);
 glEnd;

 SwapBuffers(DC); // Конец работы
end;

 // Дальше идут обычные для OpenGL действия, Создание окна
procedure TDemForm.FormCreate(Sender: TObject);
begin
 t:=0;
 cor0X:=0.05;
 cor0Y:=0.05;
 corX:=cor0X;
 corY:=cor0Y;
 constX:=Image1.Width;
 constY:=Image1.Height;
 CanvasDraw;

 StringGrid1.Cells[0,0]:='Величина';
 StringGrid1.Cells[1,0]:='Значение';
 StringGrid1.Cells[0,1]:='Vx, м/с';
 StringGrid1.Cells[0,2]:='Vy, м/с';
 StringGrid1.Cells[0,3]:='V, м/с';
 StringGrid1.Cells[0,4]:='Ek, Дж';
 StringGrid1.Cells[0,5]:='Ep, Дж';

 DC:=GetDC(Handle);
 SetDCPixelFormat;
 hrc:=wglCreateContext(DC);
 wglMakeCurrent(DC, hrc);
 InitializeRC;
end;

 // Установка формата пикселей
procedure TDemForm.SetDCPixelFormat;
var
 nPixelFormat: integer;
 pfd: TPixelFormatDescriptor;
begin
 FillChar(pfd, SizeOf(pfd), 0);
 with pfd do
  begin
   nSize:=sizeof(pfd);
   nVersion:=1;
   dwFlags:=PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER;
   iPixelType:=PFD_TYPE_RGBA;
   cColorBits:=24;
   cDepthBits:=32;
   iLayerType:= PFD_MAIN_PLANE;
 end;
 nPixelFormat:=ChoosePixelFormat(DC, @pfd);
 SetPixelFormat(DC, nPixelFormat, @pfd);
end;

 // Изменение размеров окна
procedure TDemForm.FormResize(Sender: TObject);
begin
 glMatrixMode(GL_PROJECTION);
 glLoadIdentity;
 gluPerspective(30.0, Width/Height, 1.0, 10.0);
 glViewport(0, 0, Width, Height);
 glMatrixMode(GL_MODELVIEW);
 InvalidateRect(Handle, nil, False);
end;

 // Обработка сообщения WM_PAINT, рисование окна
procedure TDemForm.WMPaint(var Msg: TWMPaint);
var
 ps: TPaintStruct;
begin
 BeginPaint(Handle, ps);
 DrawScene;
 EndPaint(Handle, ps);
end;

procedure TDemForm.Timer1Timer(Sender: TObject);
begin
 GraphicsDraw;

 If corY>0.01 then begin
  t:=t+0.005;
  corX:=cor0X+V0x*t; // Закон X(t)
  corY:=cor0Y+V0y*t-5*t*t; // Закон Y(t)
  DrawScene;
 end
 else begin
  t:=0;
  Timer1.Enabled:=false;
  corX:=cor0X;
  corY:=cor0Y;
  Label2.Caption:='Моделирование завершено';
  BitBtn7.Enabled:=true;
 end;

 StringGridFulfill;
end;

procedure TDemForm.BitBtn1Click(Sender: TObject);
begin
 GraphicsDraw;

 If corY>0.01 then begin
  t:=t-0.005;
  corX:=cor0X+V0x*t; // Закон X(t)
  corY:=cor0Y+V0y*t-5*t*t; // Закон Y(t)
  DrawScene;
 end
 else begin
  t:=0;
  Timer1.Enabled:=false;
  corX:=cor0X;
  corY:=cor0Y;
  DrawScene;
  Label2.Caption:='Моделирование завершено';
  BitBtn7.Enabled:=true;
 end;
 StringGridFulfill;
end;

procedure TDemForm.BitBtn2Click(Sender: TObject);
begin
 If Timer1.Enabled=false then begin
  Timer1.Enabled:=true;
  Label2.Caption:='Моделирование начато...';
 end
 else begin
  Timer1.Enabled:=false;
  Label2.Caption:='Моделирование на паузе';
 end;
 BitBtn7.Enabled:=false;
end;

procedure TDemForm.BitBtn3Click(Sender: TObject);
begin
 t:=0;
 Timer1.Enabled:=false;
 corX:=cor0X;
 corY:=cor0Y;
 DrawScene;
 Label2.Caption:='Моделирование завершено';
 BitBtn7.Enabled:=true;
 Image1.Picture:=nil;
 Image2.Picture:=nil;
 Image3.Picture:=nil;
 CanvasDraw;
 StringGridFulfill;
end;

procedure TDemForm.BitBtn4Click(Sender: TObject);
begin
 GraphicsDraw;

 If corY>0.01 then begin
  t:=t+0.005;
  corX:=cor0X+V0x*t; // Закон X(t)
  corY:=cor0Y+V0y*t-5*t*t; // Закон Y(t)
  DrawScene;
 end
 else begin
  t:=0;
  Timer1.Enabled:=false;
  corX:=cor0X;
  corY:=cor0Y;
  DrawScene;
  Label2.Caption:='Моделирование завершено';
  BitBtn7.Enabled:=true;
 end;

 StringGridFulfill;
end;

procedure TDemForm.BitBtn5Click(Sender: TObject);
begin
 stringM:=LabeledEdit1.Text;
 stringV:=LabeledEdit2.Text;
 stringU:=LabeledEdit3.Text;

 Val(stringM, M, code);
 Val(stringV, V, code);
 Val(stringU, U, code);

 // Проверка входных данных
 If (V>7) or (m>5) or (U>60) or (V<=0) or (m<=0) or (U<=0) then ShowMessage('Проверьте введенные данные!')
 else begin
  V0x:=V*cos(U*pi/180);
  V0y:=V*sin(U*pi/180);
  E0:=m*V*V;

  BitBtn1.Enabled:=true;
  BitBtn2.Enabled:=true;
  BitBtn3.Enabled:=true;
  BitBtn4.Enabled:=true;

  LabeledEdit1.Enabled:=false;
  LabeledEdit2.Enabled:=false;
  LabeledEdit3.Enabled:=false;

  Label1.Caption:='Демонстрация запущена';
  Label2.Caption:='';
 end;
end;

procedure TDemForm.BitBtn6Click(Sender: TObject);
begin
 BitBtn1.Enabled:=false;
 BitBtn2.Enabled:=false;
 BitBtn3.Enabled:=false;
 BitBtn4.Enabled:=false;

 LabeledEdit1.Enabled:=true;
 LabeledEdit2.Enabled:=true;
 LabeledEdit3.Enabled:=true;

 t:=0;
 Timer1.Enabled:=false;
 corX:=cor0X;
 corY:=cor0Y;
 DrawScene;

 Label1.Caption:='Демонстрация завершена';
 Label2.Caption:='';
 Image1.Picture:=nil;
 Image2.Picture:=nil;
 Image3.Picture:=nil;
 CanvasDraw;
end;

procedure TDemForm.BitBtn7Click(Sender: TObject);
begin
 Image1.Picture:=nil;
 Image2.Picture:=nil;
 Image3.Picture:=nil;
 CanvasDraw;
end;

procedure TDemForm.TrackBar1Change(Sender: TObject);
begin
 RED:=TrackBar1.Position/50;
 GREEN:=TrackBar2.Position/50;
 BLUE:=TrackBar3.Position/50;
 DrawScene;
end;

procedure TDemForm.TrackBar2Change(Sender: TObject);
begin
 RED:=TrackBar1.Position/50;
 GREEN:=TrackBar2.Position/50;
 BLUE:=TrackBar3.Position/50;
 DrawScene;
end;

procedure TDemForm.TrackBar3Change(Sender: TObject);
begin
 RED:=TrackBar1.Position/50;
 GREEN:=TrackBar2.Position/50;
 BLUE:=TrackBar3.Position/50;
 DrawScene;
end;

procedure TDemForm.ColorBox1Change(Sender: TObject);
begin
 CanvasDraw;
end;

end.

