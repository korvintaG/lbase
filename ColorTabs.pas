unit ColorTabs;

interface

uses
  Winapi.Messages,
  Vcl.Graphics,
  Vcl.ComCtrls;

type

  TTabColorControlStyleHook= class(TTabControlStyleHook)
  private
    class var FUseBorder : Boolean;
  protected
    class constructor Create;
    procedure DrawTab(Canvas: TCanvas; Index: Integer); override;
    class property  UseBorder : Boolean read FUseBorder write FUseBorder;
  end;

implementation

uses
 System.Classes,
 System.SysUtils,
 System.Types,
 System.Rtti,
 System.Generics.Collections,
 Winapi.Windows,
 Vcl.Styles,
 Vcl.Themes,
 Vcl.Controls;

type

  TWinControlClass = class(TWinControl);
  TCustomTabControlClass = class(TCustomTabControl);

function GetBorderColorTab: TColor;
begin
 result:=TStyleManager.ActiveStyle.GetSystemColor(clActiveBorder);
end;


function PageIndexFromTabIndex(const pageControl : TPageControl; const TabIndex: Integer): Integer;
 var
    i : Integer;
 begin
   Result := TabIndex;
   for i := 0 to Pred(pageControl.PageCount) do
     begin
       if not pageControl.Pages[i].TabVisible then
         Inc(Result);
       if TabIndex = pageControl.Pages[i].TabIndex then
         break;
     end;
  end;


// цвет фона табов
function GetColorTab(Index: Integer; MarkRed:boolean ) : TColor;
Const
  MaxColors =9;
  //Colors : Array [0..MaxColors-1] of TColor = (6512214,16755712,8355381,1085522,115885,1098495,1735163,2248434,4987610);
begin
//  if index=3 then
   if (index=3) and MarkRed then
    Result:=clRed
   else
    Result:=TStyleManager.ActiveStyle.GetSystemColor(clWindow)//Colors[Index mod MaxColors];
//  else
//    Result:=clbLUE
end;


function GetColorTextTab(bc:TColor;ThemedTab  : TThemedTab) : TColor;
Const
 ColorSelected = clYellow;
 ColorHot      = clGreen;
 ColorNormal   = clWhite;
begin
    Result:=TStyleManager.ActiveStyle.GetSystemColor(clWindow);
    case ThemedTab of
       ttTabItemSelected,
       ttTabItemLeftEdgeSelected,
       ttTabItemBothEdgeSelected,
       ttTabItemRightEdgeSelected : Result:= TStyleManager.ActiveStyle.GetSystemColor(clInfoText);

       ttTabItemHot,
       ttTabItemLeftEdgeHot,
       ttTabItemBothEdgeHot,
       ttTabItemRightEdgeHot      : Result := ColorToRGB(bc) xor $00FFFFFF;

       ttTabItemNormal,
       ttTabItemLeftEdgeNormal,
       ttTabItemBothEdgeNormal,
       ttTabItemRightEdgeNormal  : Result := TStyleManager.ActiveStyle.GetSystemColor(clWindowText);
    end;
end;


{ TTabColorControlStyleHook }
class constructor TTabColorControlStyleHook.Create;
begin
  FUseBorder:=true;
end;

procedure TTabColorControlStyleHook.DrawTab(Canvas: TCanvas; Index: Integer);
var
  LDetails    : TThemedElementDetails;
  LImageIndex, resi, i : Integer;
  LThemedTab  : TThemedTab;
  LIconRect   : TRect;
  R, LayoutR  : TRect;
  LImageW, LImageH: Integer;
  LTextX, LTextY: Integer;
  LTextColor    : TColor;

    procedure DrawControlText(const S: string; var R: TRect; Flags: Cardinal);
    var
      TextFormat: TTextFormatFlags;
    begin
      Canvas.Font       := TWinControlClass(Control).Font;
      TextFormat        := TTextFormatFlags(Flags);
      if (resi=3) and (TWinControlClass(Control).Name='pcMainNoteEdit')  then
        Canvas.Font.Color := clYellow
      else
        Canvas.Font.Color := LTextColor;
      StyleServices.DrawText(Canvas.Handle, LDetails, S, R, TextFormat, Canvas.Font.Color);
    end;

begin
  LImageW := 0; LImageH := 0;


  R := TabRect[Index];
  if R.Left < 0 then Exit;

    if Index = TabIndex then
      InflateRect(R, 0, 2);

  Canvas.Font.Assign(TCustomTabControlClass(Control).Font);
  LayoutR := R;
  LThemedTab := ttTabDontCare;
  //Get the type of the active tab
        if Index = TabIndex then
          LThemedTab := ttTabItemSelected
        else if (Index = HotTabIndex) and MouseInControl then
          LThemedTab := ttTabItemHot
        else
          LThemedTab := ttTabItemNormal;



  resi := Index;
  for I := 0 to (Control as TPageControl).PageCount-1 do begin
    if not (Control as TPageControl).pages[i].TabVisible then
      Inc(Resi);
    if i>=index then break;
  end;

  //draw the bkg tab
  if StyleServices.Available then
  begin
    LDetails := StyleServices.GetElementDetails(LThemedTab);//necesary for  DrawControlText
    if FUseBorder then
    begin
              InflateRect(R,-1,0);
              if TabIndex<>Index then
               R.Bottom:=R.Bottom+1
              else
               R.Bottom:=R.Bottom-1;

              Canvas.Brush.Color:=GetBorderColorTab;
              Canvas.FillRect(R);

              if TabIndex=Index then
              begin
               InflateRect(R,-1,-1);
               R.Bottom:=R.Bottom+1;
              end
              else
               InflateRect(R,-1,-1);


      Canvas.Brush.Color:=GetColorTab(resi,TWinControlClass(Control).Name='pcMainNoteEdit');
      Canvas.FillRect(R);
    end
    else
    Begin
      InflateRect(R,-1,0);//adjust the size of the tab creating blanks space between the tabs
      Canvas.Brush.Color:=GetColorTab(resi,TWinControlClass(Control).Name='pcMainNoteEdit');
      Canvas.FillRect(R);
    end;
  end;



  //draw the text of the tab
  if StyleServices.Available then
  begin
    LTextColor:=GetColorTextTab(Canvas.Brush.Color,LThemedTab);

    if (Index = TabIndex) then
      OffsetRect(LayoutR, 0, -1);

     DrawControlText(Tabs[Index], LayoutR, DT_VCENTER or DT_CENTER or DT_SINGLELINE  or DT_NOCLIP);
  end;
end;




end.
