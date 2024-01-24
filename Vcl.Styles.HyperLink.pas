// **************************************************************************************************
//
// Unit Vcl.Styles.Hooks
// unit for the VCL Styles Utils
// https://github.com/RRUZ/vcl-styles-utils/
//
// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License");
// you may not use this file except in compliance with the License. You may obtain a copy of the
// License at http://www.mozilla.org/MPL/
//
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF
// ANY KIND, either express or implied. See the License for the specific language governing rights
// and limitations under the License.
//
// The Original Code is Vcl.Styles.Hooks.pas.
//
// The Initial Developer of the Original Code is Rodrigo Ruz V.
//
// Portions created by Rodrigo Ruz V. are Copyright (C) 2013-2017 Rodrigo Ruz V.
//
// Contributor(s): Mahdi Safsafi.
//
// All Rights Reserved.
//
// **************************************************************************************************
unit Vcl.Styles.HyperLink;

interface

uses
  WinApi.Windows;

var
  //Trampoline_user32_GetSysColorBrush: function(nIndex: Integer): HBRUSH; stdcall;
  Trampoline_user32_GetSysColor: function(nIndex: Integer): DWORD; stdcall;


implementation

// {$I VCL.Styles.Utils.inc}

uses
  DDetours,
  System.SyncObjs,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Generics.Collections,
  System.StrUtils,
  WinApi.Messages,
  WinApi.UXTheme,
  Vcl.Graphics,
  //Vcl.Styles.Utils.Graphics,
  //Vcl.Styles.Utils.SysControls,
  Vcl.Styles.FontAwesome,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Themes;


//var   VCLStylesLock: TCriticalSection = nil;



function Detour_GetSysColor(nIndex: Integer): DWORD; stdcall; // ЭТО ИМЕННО ОНО!!!!
begin
  if StyleServices.IsSystemStyle {or not TSysStyleManager.Enabled} then
    Result := Trampoline_user32_GetSysColor(nIndex)
  else if nIndex = COLOR_HOTLIGHT then
    Result := DWORD(StyleServices.GetSystemColor(clHighlight))
  else
  //  Result := DWORD(StyleServices.GetSystemColor(TColor(nIndex or Integer($FF000000))));
    Result := Trampoline_user32_GetSysColor(nIndex)
end;


initialization


 //VCLStylesLock  := TCriticalSection.Create;

if StyleServices.Available then
begin
  BeginHooks;
  @Trampoline_user32_GetSysColor := InterceptCreate(user32, 'GetSysColor', @Detour_GetSysColor);
  EndHooks;
end;

finalization

  BeginUnHooks;
  InterceptRemove(@Trampoline_user32_GetSysColor);
  EndUnHooks;
  //VCLStylesLock.Free;  VCLStylesLock := nil;

end.
