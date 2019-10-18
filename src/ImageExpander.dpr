program ImageExpander;

{$APPTYPE CONSOLE}

uses SysUtils,Windows, Graphics;
var z:string;
a,b,c:TRect;
f,t,p:TBitmap;
s,w,h,w2,h2,i:integer;
begin
z:=ParamStr(1);
if not FileExists(z) then exit;
f:=TBitmap.Create();
t:=TBitmap.Create();
p:=TBitmap.Create();
f.LoadFromFile(z);
f.PixelFormat:=pf32bit;
t.PixelFormat:=pf32bit;
p.PixelFormat:=pf32bit;
w:=f.Width;
h:=f.Height;
s:=w;
if(h<w)then s:=h;
s:=Round(s/8);
w2:=w+s;
h2:=h+s;
t.Width:=w2;
t.Height:=h2;
a.Left:=0;
a.Top:=0;
a.Right:=w;
a.Bottom:=h;
c.Left:=0;
c.Top:=0;
c.Right:=w2;
c.Bottom:=h2; 
t.Canvas.Brush.Color:=clWhite;
t.Canvas.Brush.Style:=bsSolid;
t.Canvas.Pen.Style:=psSolid;
t.Canvas.Pen.Color:=clWhite;
t.Transparent:=true;
t.TransparentMode:=tmAuto;
t.TransparentColor:=clWhite;
f.Transparent:=true;
f.TransparentMode:=tmFixed;
f.TransparentColor:=clWhite;
p.Width:=w2;
p.Height:=h2;
s:=Round(s/2);
for i:=0 to s do begin
b.Left:=i;
b.Top:=i;
b.Right:=w2-i;
b.Bottom:=h2-i;
t.Canvas.FillRect(c);
t.Canvas.CopyRect(b,f.Canvas,a);
p.Canvas.Draw(0,0,t);
end;
p.Canvas.Draw(s,s,f);
f.Free;
t.Free;
p.SaveToFile(z+'.bmp');
p.Free;
end.
