{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvThemes.PAS, released on 2003-09-25

The Initial Developers of the Original Code are: Andreas Hausladen <Andreas.Hausladen@gmx.de>
All Rights Reserved.

Last Modified: 2002-09-25

Contributers:

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}

{$I JVCL.INC}

unit JvThemes;

interface
uses
{$IFDEF MSWINDOWS}
  Windows, Messages,
{$ENDIF}
{$IFDEF JVCLThemesEnabled}
  SysUtils, Classes,
 {$IFDEF COMPILER7_UP}Themes,{$ELSE}ThemeSrv,{$ENDIF}
{$ENDIF}
{$IFDEF COMPLIB_VCL}
  Controls, StdCtrls, Graphics,
{$ENDIF}
{$IFDEF COMPLIB_CLX}
  QControls, QGraphics,
{$ENDIF}
  Contnrs;

const
 // Add a message handler to a component that is themed by the ThemeManager but
 // should not be themed.
  CM_DENYSUBCLASSING = CM_BASE + 2000; // from ThemeMgr.pas

type
  TWinControlThemeInfo = class(TWinControl)
  public
    property Color;
  end;

{$IFDEF JVCLThemesEnabled}

{$I WINDOWSONLY.INC} 

// type name redirection
type
  TThemedElement = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedElement;
  TThemedButton = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedButton;
  TThemedClock = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedClock;
  TThemedComboBox = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedComboBox;
  TThemedEdit = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedEdit;
  TThemedExplorerBar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedExplorerBar;
  TThemedHeader = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedHeader;
  TThemedListview = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedListview;
  TThemedMenu = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedMenu;
  TThemedPage = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedPage;
  TThemedProgress = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedProgress;
  TThemedRebar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedRebar;
  TThemedScrollBar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedScrollBar;
  TThemedSpin = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedSpin;
  TThemedStartPanel = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedStartPanel;
  TThemedStatus = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedStatus;
  TThemedTab = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedTab;
  TThemedTaskBand = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedTaskBand;
  TThemedTaskBar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedTaskBar;
  TThemedToolBar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedToolBar;
  TThemedToolTip = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedToolTip;
  TThemedTrackBar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedTrackBar;
  TThemedTrayNotify = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedTrayNotify;
  TThemedTreeview = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedTreeview;
  TThemedWindow = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedWindow;
  TThemeData = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemeData;

  PThemedElementDetails = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.PThemedElementDetails;
  TThemedElementDetails = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemedElementDetails;
  TThemeServices = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.TThemeServices;


// enumerations as constants

// TThemedElement
const
  teButton = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teButton;
  teClock = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teClock;
  teComboBox = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teComboBox;
  teEdit = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teEdit;
  teExplorerBar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teExplorerBar;
  teHeader = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teHeader;
  teListView = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teListView;
  teMenu = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teMenu;
  tePage = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tePage;
  teProgress = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teProgress;
  teRebar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teRebar;
  teScrollBar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teScrollBar;
  teSpin = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teSpin;
  teStartPanel = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teStartPanel;
  teStatus = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teStatus;
  teTab = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teTab;
  teTaskBand = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teTaskBand;
  teTaskBar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teTaskBar;
  teToolBar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teToolBar;
  teToolTip = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teToolTip;
  teTrackBar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teTrackBar;
  teTrayNotify = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teTrayNotify;
  teTreeview = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teTreeview;
  teWindow = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teWindow;

// TThemedButton
const
  tbButtonDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbButtonDontCare;
  tbButtonRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbButtonRoot;
  tbPushButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbPushButtonNormal;
  tbPushButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbPushButtonHot;
  tbPushButtonPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbPushButtonPressed;
  tbPushButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbPushButtonDisabled;
  tbPushButtonDefaulted = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbPushButtonDefaulted;
  tbRadioButtonUncheckedNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbRadioButtonUncheckedNormal;
  tbRadioButtonUncheckedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbRadioButtonUncheckedHot;
  tbRadioButtonUncheckedPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbRadioButtonUncheckedPressed;
  tbRadioButtonUncheckedDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbRadioButtonUncheckedDisabled;
  tbRadioButtonCheckedNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbRadioButtonCheckedNormal;
  tbRadioButtonCheckedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbRadioButtonCheckedHot;
  tbRadioButtonCheckedPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbRadioButtonCheckedPressed;
  tbRadioButtonCheckedDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbRadioButtonCheckedDisabled;
  tbCheckBoxUncheckedNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxUncheckedNormal;
  tbCheckBoxUncheckedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxUncheckedHot;
  tbCheckBoxUncheckedPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxUncheckedPressed;
  tbCheckBoxUncheckedDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxUncheckedDisabled;
  tbCheckBoxCheckedNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxCheckedNormal;
  tbCheckBoxCheckedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxCheckedHot;
  tbCheckBoxCheckedPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxCheckedPressed;
  tbCheckBoxCheckedDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxCheckedDisabled;
  tbCheckBoxMixedNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxMixedNormal;
  tbCheckBoxMixedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxMixedHot;
  tbCheckBoxMixedPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxMixedPressed;
  tbCheckBoxMixedDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbCheckBoxMixedDisabled;
  tbGroupBoxNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbGroupBoxNormal;
  tbGroupBoxDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbGroupBoxDisabled;
  tbUserButton = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tbUserButton;

// TThemedClock
const
  tcClockDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tcClockDontCare;
  tcClockRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tcClockRoot;
  tcTimeNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tcTimeNormal;

// TThemedComboBox
const
  tcComboBoxDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tcComboBoxDontCare;
  tcComboBoxRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tcComboBoxRoot;
  tcDropDownButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tcDropDownButtonNormal;
  tcDropDownButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tcDropDownButtonHot;
  tcDropDownButtonPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tcDropDownButtonPressed;
  tcDropDownButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tcDropDownButtonDisabled;

// TThemedEdit
const
  teEditDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teEditDontCare;
  teEditRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teEditRoot;
  teEditTextNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teEditTextNormal;
  teEditTextHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teEditTextHot;
  teEditTextSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teEditTextSelected;
  teEditTextDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teEditTextDisabled;
  teEditTextFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teEditTextFocused;
  teEditTextReadOnly = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teEditTextReadOnly;
  teEditTextAssist = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teEditTextAssist;
  teEditCaret = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.teEditCaret;

// TThemedExplorerBar
const
  tebExplorerBarDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebExplorerBarDontCare;
  tebExplorerBarRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebExplorerBarRoot;
  tebHeaderBackgroundNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderBackgroundNormal;
  tebHeaderBackgroundHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderBackgroundHot;
  tebHeaderBackgroundPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderBackgroundPressed;
  tebHeaderCloseNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderCloseNormal;
  tebHeaderCloseHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderCloseHot;
  tebHeaderClosePressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderClosePressed;
  tebHeaderPinNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderPinNormal;
  tebHeaderPinHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderPinHot;
  tebHeaderPinPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderPinPressed;
  tebHeaderPinSelectedNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderPinSelectedNormal;
  tebHeaderPinSelectedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderPinSelectedHot;
  tebHeaderPinSelectedPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebHeaderPinSelectedPressed;
  tebIEBarMenuNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebIEBarMenuNormal;
  tebIEBarMenuHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebIEBarMenuHot;
  tebIEBarMenuPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebIEBarMenuPressed;
  tebNormalGroupBackground = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebNormalGroupBackground;
  tebNormalGroupCollapseNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebNormalGroupCollapseNormal;
  tebNormalGroupCollapseHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebNormalGroupCollapseHot;
  tebNormalGroupCollapsePressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebNormalGroupCollapsePressed;
  tebNormalGroupExpandNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebNormalGroupExpandNormal;
  tebNormalGroupExpandHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebNormalGroupExpandHot;
  tebNormalGroupExpandPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebNormalGroupExpandPressed;
  tebNormalGroupHead = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebNormalGroupHead;
  tebSpecialGroupBackground = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebSpecialGroupBackground;
  tebSpecialGroupCollapseSpecial = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebSpecialGroupCollapseSpecial;
  tebSpecialGroupCollapseHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebSpecialGroupCollapseHot;
  tebSpecialGroupCollapsePressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebSpecialGroupCollapsePressed;
  tebSpecialGroupExpandSpecial = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebSpecialGroupExpandSpecial;
  tebSpecialGroupExpandHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebSpecialGroupExpandHot;
  tebSpecialGroupExpandPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebSpecialGroupExpandPressed;
  tebSpecialGroupHead = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tebSpecialGroupHead;

// TThemedHeader
const
  thHeaderDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderDontCare;
  thHeaderRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderRoot;
  thHeaderItemNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderItemNormal;
  thHeaderItemHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderItemHot;
  thHeaderItemPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderItemPressed;
  thHeaderItemLeftNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderItemLeftNormal;
  thHeaderItemLeftHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderItemLeftHot;
  thHeaderItemLeftPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderItemLeftPressed;
  thHeaderItemRightNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderItemRightNormal;
  thHeaderItemRightHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderItemRightHot;
  thHeaderItemRightPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderItemRightPressed;
  thHeaderSortArrowSortedUp = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderSortArrowSortedUp;
  thHeaderSortArrowSortedDown = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.thHeaderSortArrowSortedDown;

// TThemedListview
const
  tlListviewDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tlListviewDontCare;
  tlListviewRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tlListviewRoot;
  tlListItemNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tlListItemNormal;
  tlListItemHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tlListItemHot;
  tlListItemSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tlListItemSelected;
  tlListItemDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tlListItemDisabled;
  tlListItemSelectedNotFocus = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tlListItemSelectedNotFocus;
  tlListGroup = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tlListGroup;
  tlListDetail = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tlListDetail;
  tlListSortDetail = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tlListSortDetail;
  tlEmptyText = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tlEmptyText;

// TThemedMenu
const
  tmMenuDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tmMenuDontCare;
  tmMenuRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tmMenuRoot;
  tmMenuItemNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tmMenuItemNormal;
  tmMenuItemSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tmMenuItemSelected;
  tmMenuItemDemoted = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tmMenuItemDemoted;
  tmMenuDropDown = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tmMenuDropDown;
  tmMenuBarItem = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tmMenuBarItem;
  tmMenuBarDropDown = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tmMenuBarDropDown;
  tmChevron = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tmChevron;
  tmSeparator = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tmSeparator;

// TThemedPage
const
  tpPageDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpPageDontCare;
  tpPageRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpPageRoot;
  tpUpNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpUpNormal;
  tpUpHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpUpHot;
  tpUpPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpUpPressed;
  tpUpDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpUpDisabled;
  tpDownNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpDownNormal;
  tpDownHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpDownHot;
  tpDownPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpDownPressed;
  tpDownDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpDownDisabled;
  tpUpHorzNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpUpHorzNormal;
  tpUpHorzHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpUpHorzHot;
  tpUpHorzPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpUpHorzPressed;
  tpUpHorzDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpUpHorzDisabled;
  tpDownHorzNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpDownHorzNormal;
  tpDownHorzHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpDownHorzHot;
  tpDownHorzPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpDownHorzPressed;
  tpDownHorzDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpDownHorzDisabled;

// TThemedProgress
const
  tpProgressDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpProgressDontCare;
  tpProgressRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpProgressRoot;
  tpBar = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpBar;
  tpBarVert = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpBarVert;
  tpChunk = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpChunk;
  tpChunkVert = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tpChunkVert;

// TThemedRebar
const
  trRebarDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trRebarDontCare;
  trRebarRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trRebarRoot;
  trGripper = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trGripper;
  trGripperVert = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trGripperVert;
  trBandNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trBandNormal;
  trBandHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trBandHot;
  trBandPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trBandPressed;
  trBandDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trBandDisabled;
  trBandChecked = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trBandChecked;
  trBandHotChecked = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trBandHotChecked;
  trChevronNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trChevronNormal;
  trChevronHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trChevronHot;
  trChevronPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trChevronPressed;
  trChevronDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trChevronDisabled;
  trChevronVertNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trChevronVertNormal;
  trChevronVertHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trChevronVertHot;
  trChevronVertPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trChevronVertPressed;
  trChevronVertDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.trChevronVertDisabled;

// TThemedScrollBar
const
  tsScrollBarDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsScrollBarDontCare;
  tsScrollBarRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsScrollBarRoot;
  tsArrowBtnUpNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnUpNormal;
  tsArrowBtnUpHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnUpHot;
  tsArrowBtnUpPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnUpPressed;
  tsArrowBtnUpDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnUpDisabled;
  tsArrowBtnDownNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnDownNormal;
  tsArrowBtnDownHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnDownHot;
  tsArrowBtnDownPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnDownPressed;
  tsArrowBtnDownDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnDownDisabled;
  tsArrowBtnLeftNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnLeftNormal;
  tsArrowBtnLeftHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnLeftHot;
  tsArrowBtnLeftPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnLeftPressed;
  tsArrowBtnLeftDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnLeftDisabled;
  tsArrowBtnRightNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnRightNormal;
  tsArrowBtnRightHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnRightHot;
  tsArrowBtnRightPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnRightPressed;
  tsArrowBtnRightDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsArrowBtnRightDisabled;
  tsThumbBtnHorzNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsThumbBtnHorzNormal;
  tsThumbBtnHorzHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsThumbBtnHorzHot;
  tsThumbBtnHorzPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsThumbBtnHorzPressed;
  tsThumbBtnHorzDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsThumbBtnHorzDisabled;
  tsThumbBtnVertNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsThumbBtnVertNormal;
  tsThumbBtnVertHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsThumbBtnVertHot;
  tsThumbBtnVertPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsThumbBtnVertPressed;
  tsThumbBtnVertDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsThumbBtnVertDisabled;
  tsLowerTrackHorzNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsLowerTrackHorzNormal;
  tsLowerTrackHorzHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsLowerTrackHorzHot;
  tsLowerTrackHorzPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsLowerTrackHorzPressed;
  tsLowerTrackHorzDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsLowerTrackHorzDisabled;
  tsUpperTrackHorzNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpperTrackHorzNormal;
  tsUpperTrackHorzHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpperTrackHorzHot;
  tsUpperTrackHorzPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpperTrackHorzPressed;
  tsUpperTrackHorzDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpperTrackHorzDisabled;
  tsLowerTrackVertNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsLowerTrackVertNormal;
  tsLowerTrackVertHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsLowerTrackVertHot;
  tsLowerTrackVertPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsLowerTrackVertPressed;
  tsLowerTrackVertDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsLowerTrackVertDisabled;
  tsUpperTrackVertNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpperTrackVertNormal;
  tsUpperTrackVertHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpperTrackVertHot;
  tsUpperTrackVertPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpperTrackVertPressed;
  tsUpperTrackVertDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpperTrackVertDisabled;
  tsGripperHorzNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsGripperHorzNormal;
  tsGripperHorzHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsGripperHorzHot;
  tsGripperHorzPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsGripperHorzPressed;
  tsGripperHorzDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsGripperHorzDisabled;
  tsGripperVertNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsGripperVertNormal;
  tsGripperVertHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsGripperVertHot;
  tsGripperVertPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsGripperVertPressed;
  tsGripperVertDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsGripperVertDisabled;
  tsSizeBoxRightAlign = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsSizeBoxRightAlign;
  tsSizeBoxLeftAlign = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsSizeBoxLeftAlign;

// TThemedSpin
const
  tsSpinDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsSpinDontCare;
  tsSpinRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsSpinRoot;
  tsUpNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpNormal;
  tsUpHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpHot;
  tsUpPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpPressed;
  tsUpDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpDisabled;
  tsDownNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsDownNormal;
  tsDownHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsDownHot;
  tsDownPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsDownPressed;
  tsDownDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsDownDisabled;
  tsUpHorzNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpHorzNormal;
  tsUpHorzHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpHorzHot;
  tsUpHorzPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpHorzPressed;
  tsUpHorzDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsUpHorzDisabled;
  tsDownHorzNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsDownHorzNormal;
  tsDownHorzHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsDownHorzHot;
  tsDownHorzPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsDownHorzPressed;
  tsDownHorzDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsDownHorzDisabled;

// TThemedStartPanel
const
  tspStartPanelDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspStartPanelDontCare;
  tspStartPanelRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspStartPanelRoot;
  tspUserPane = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspUserPane;
  tspMorePrograms = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspMorePrograms;
  tspMoreProgramsArrowNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspMoreProgramsArrowNormal;
  tspMoreProgramsArrowHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspMoreProgramsArrowHot;
  tspMoreProgramsArrowPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspMoreProgramsArrowPressed;
  tspProgList = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspProgList;
  tspProgListSeparator = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspProgListSeparator;
  tspPlacesList = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspPlacesList;
  tspPlacesListSeparator = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspPlacesListSeparator;
  tspLogOff = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspLogOff;
  tspLogOffButtonsNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspLogOffButtonsNormal;
  tspLogOffButtonsHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspLogOffButtonsHot;
  tspLogOffButtonsPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspLogOffButtonsPressed;
  tspUserPicture = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspUserPicture;
  tspPreview = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tspPreview;

// TThemedStatus
const
  tsStatusDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsStatusDontCare;
  tsStatusRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsStatusRoot;
  tsPane = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsPane;
  tsGripperPane = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsGripperPane;
  tsGripper = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tsGripper;

// TThemedTab
const
  ttTabDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabDontCare;
  ttTabRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabRoot;
  ttTabItemNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemNormal;
  ttTabItemHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemHot;
  ttTabItemSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemSelected;
  ttTabItemDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemDisabled;
  ttTabItemFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemFocused;
  ttTabItemLeftEdgeNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemLeftEdgeNormal;
  ttTabItemLeftEdgeHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemLeftEdgeHot;
  ttTabItemLeftEdgeSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemLeftEdgeSelected;
  ttTabItemLeftEdgeDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemLeftEdgeDisabled;
  ttTabItemLeftEdgeFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemLeftEdgeFocused;
  ttTabItemRightEdgeNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemRightEdgeNormal;
  ttTabItemRightEdgeHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemRightEdgeHot;
  ttTabItemRightEdgeSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemRightEdgeSelected;
  ttTabItemRightEdgeDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemRightEdgeDisabled;
  ttTabItemRightEdgeFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemRightEdgeFocused;
  ttTabItemBothEdgeNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemBothEdgeNormal;
  ttTabItemBothEdgeHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemBothEdgeHot;
  ttTabItemBothEdgeSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemBothEdgeSelected;
  ttTabItemBothEdgeDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemBothEdgeDisabled;
  ttTabItemBothEdgeFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTabItemBothEdgeFocused;
  ttTopTabItemNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemNormal;
  ttTopTabItemHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemHot;
  ttTopTabItemSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemSelected;
  ttTopTabItemDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemDisabled;
  ttTopTabItemFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemFocused;
  ttTopTabItemLeftEdgeNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemLeftEdgeNormal;
  ttTopTabItemLeftEdgeHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemLeftEdgeHot;
  ttTopTabItemLeftEdgeSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemLeftEdgeSelected;
  ttTopTabItemLeftEdgeDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemLeftEdgeDisabled;
  ttTopTabItemLeftEdgeFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemLeftEdgeFocused;
  ttTopTabItemRightEdgeNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemRightEdgeNormal;
  ttTopTabItemRightEdgeHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemRightEdgeHot;
  ttTopTabItemRightEdgeSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemRightEdgeSelected;
  ttTopTabItemRightEdgeDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemRightEdgeDisabled;
  ttTopTabItemRightEdgeFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemRightEdgeFocused;
  ttTopTabItemBothEdgeNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemBothEdgeNormal;
  ttTopTabItemBothEdgeHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemBothEdgeHot;
  ttTopTabItemBothEdgeSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemBothEdgeSelected;
  ttTopTabItemBothEdgeDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemBothEdgeDisabled;
  ttTopTabItemBothEdgeFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTopTabItemBothEdgeFocused;
  ttPane = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttPane;
  ttBody = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttBody;

// TThemedTaskBand
const
  ttbTaskBandDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbTaskBandDontCare;
  ttbTaskBandRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbTaskBandRoot;
  ttbGroupCount = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbGroupCount;
  ttbFlashButton = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbFlashButton;
  ttpFlashButtonGroupMenu = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttpFlashButtonGroupMenu;

// TThemedTaskBar
const
  ttTaskBarDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTaskBarDontCare;
  ttTaskBarRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTaskBarRoot;
  ttbTimeNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbTimeNormal;

// TThemedToolBar
const
  ttbToolBarDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbToolBarDontCare;
  ttbToolBarRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbToolBarRoot;
  ttbButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbButtonNormal;
  ttbButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbButtonHot;
  ttbButtonPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbButtonPressed;
  ttbButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbButtonDisabled;
  ttbButtonChecked = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbButtonChecked;
  ttbButtonCheckedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbButtonCheckedHot;
  ttbDropDownButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbDropDownButtonNormal;
  ttbDropDownButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbDropDownButtonHot;
  ttbDropDownButtonPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbDropDownButtonPressed;
  ttbDropDownButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbDropDownButtonDisabled;
  ttbDropDownButtonChecked = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbDropDownButtonChecked;
  ttbDropDownButtonCheckedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbDropDownButtonCheckedHot;
  ttbSplitButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonNormal;
  ttbSplitButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonHot;
  ttbSplitButtonPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonPressed;
  ttbSplitButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonDisabled;
  ttbSplitButtonChecked = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonChecked;
  ttbSplitButtonCheckedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonCheckedHot;
  ttbSplitButtonDropDownNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonDropDownNormal;
  ttbSplitButtonDropDownHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonDropDownHot;
  ttbSplitButtonDropDownPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonDropDownPressed;
  ttbSplitButtonDropDownDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonDropDownDisabled;
  ttbSplitButtonDropDownChecked = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonDropDownChecked;
  ttbSplitButtonDropDownCheckedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSplitButtonDropDownCheckedHot;
  ttbSeparatorNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorNormal;
  ttbSeparatorHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorHot;
  ttbSeparatorPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorPressed;
  ttbSeparatorDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorDisabled;
  ttbSeparatorChecked = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorChecked;
  ttbSeparatorCheckedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorCheckedHot;
  ttbSeparatorVertNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorVertNormal;
  ttbSeparatorVertHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorVertHot;
  ttbSeparatorVertPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorVertPressed;
  ttbSeparatorVertDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorVertDisabled;
  ttbSeparatorVertChecked = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorVertChecked;
  ttbSeparatorVertCheckedHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbSeparatorVertCheckedHot;

// TThemedToolTip
const
  tttToolTipDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttToolTipDontCare;
  tttToolTipRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttToolTipRoot;
  tttStandardNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttStandardNormal;
  tttStandardLink = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttStandardLink;
  tttStandardTitleNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttStandardTitleNormal;
  tttStandardTitleLink = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttStandardTitleLink;
  tttBaloonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttBaloonNormal;
  tttBaloonLink = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttBaloonLink;
  tttBaloonTitleNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttBaloonTitleNormal;
  tttBaloonTitleLink = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttBaloonTitleLink;
  tttCloseNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttCloseNormal;
  tttCloseHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttCloseHot;
  tttClosePressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.tttClosePressed;

// TThemedTrackBar
const
  ttbTrackBarDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbTrackBarDontCare;
  ttbTrackBarRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbTrackBarRoot;
  ttbTrack = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbTrack;
  ttbTrackVert = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbTrackVert;
  ttbThumbNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbNormal;
  ttbThumbHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbHot;
  ttbThumbPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbPressed;
  ttbThumbFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbFocused;
  ttbThumbDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbDisabled;
  ttbThumbBottomNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbBottomNormal;
  ttbThumbBottomHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbBottomHot;
  ttbThumbBottomPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbBottomPressed;
  ttbThumbBottomFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbBottomFocused;
  ttbThumbBottomDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbBottomDisabled;
  ttbThumbTopNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbTopNormal;
  ttbThumbTopHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbTopHot;
  ttbThumbTopPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbTopPressed;
  ttbThumbTopFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbTopFocused;
  ttbThumbTopDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbTopDisabled;
  ttbThumbVertNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbVertNormal;
  ttbThumbVertHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbVertHot;
  ttbThumbVertPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbVertPressed;
  ttbThumbVertFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbVertFocused;
  ttbThumbVertDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbVertDisabled;
  ttbThumbLeftNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbLeftNormal;
  ttbThumbLeftHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbLeftHot;
  ttbThumbLeftPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbLeftPressed;
  ttbThumbLeftFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbLeftFocused;
  ttbThumbLeftDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbLeftDisabled;
  ttbThumbRightNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbRightNormal;
  ttbThumbRightHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbRightHot;
  ttbThumbRightPressed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbRightPressed;
  ttbThumbRightFocused = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbRightFocused;
  ttbThumbRightDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbRightDisabled;
  ttbThumbTics = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbTics;
  ttbThumbTicsVert = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttbThumbTicsVert;

// TThemedTrayNotify
const
  ttnTrayNotifyDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttnTrayNotifyDontCare;
  ttnTrayNotifyRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttnTrayNotifyRoot;
  ttnBackground = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttnBackground;
  ttnAnimBackground = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttnAnimBackground;

// TThemedTreeview
const
  ttTreeviewDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTreeviewDontCare;
  ttTreeviewRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttTreeviewRoot;
  ttItemNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttItemNormal;
  ttItemHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttItemHot;
  ttItemSelected = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttItemSelected;
  ttItemDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttItemDisabled;
  ttItemSelectedNotFocus = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttItemSelectedNotFocus;
  ttGlyphClosed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttGlyphClosed;
  ttGlyphOpened = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttGlyphOpened;
  ttBranch = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ttBranch;

// TThemedWindow
const
  twWindowDontCare = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twWindowDontCare;
  twWindowRoot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twWindowRoot;
  twCaptionActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twCaptionActive;
  twCaptionInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twCaptionInactive;
  twCaptionDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twCaptionDisabled;
  twSmallCaptionActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallCaptionActive;
  twSmallCaptionInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallCaptionInactive;
  twSmallCaptionDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallCaptionDisabled;
  twMinCaptionActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMinCaptionActive;
  twMinCaptionInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMinCaptionInactive;
  twMinCaptionDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMinCaptionDisabled;
  twSmallMinCaptionActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallMinCaptionActive;
  twSmallMinCaptionInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallMinCaptionInactive;
  twSmallMinCaptionDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallMinCaptionDisabled;
  twMaxCaptionActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMaxCaptionActive;
  twMaxCaptionInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMaxCaptionInactive;
  twMaxCaptionDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMaxCaptionDisabled;
  twSmallMaxCaptionActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallMaxCaptionActive;
  twSmallMaxCaptionInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallMaxCaptionInactive;
  twSmallMaxCaptionDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallMaxCaptionDisabled;
  twFrameLeftActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twFrameLeftActive;
  twFrameLeftInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twFrameLeftInactive;
  twFrameRightActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twFrameRightActive;
  twFrameRightInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twFrameRightInactive;
  twFrameBottomActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twFrameBottomActive;
  twFrameBottomInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twFrameBottomInactive;
  twSmallFrameLeftActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallFrameLeftActive;
  twSmallFrameLeftInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallFrameLeftInactive;
  twSmallFrameRightActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallFrameRightActive;
  twSmallFrameRightInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallFrameRightInactive;
  twSmallFrameBottomActive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallFrameBottomActive;
  twSmallFrameBottomInactive = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallFrameBottomInactive;
  twSysButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSysButtonNormal;
  twSysButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSysButtonHot;
  twSysButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSysButtonPushed;
  twSysButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSysButtonDisabled;
  twMDISysButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDISysButtonNormal;
  twMDISysButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDISysButtonHot;
  twMDISysButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDISysButtonPushed;
  twMDISysButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDISysButtonDisabled;
  twMinButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMinButtonNormal;
  twMinButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMinButtonHot;
  twMinButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMinButtonPushed;
  twMinButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMinButtonDisabled;
  twMDIMinButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIMinButtonNormal;
  twMDIMinButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIMinButtonHot;
  twMDIMinButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIMinButtonPushed;
  twMDIMinButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIMinButtonDisabled;
  twMaxButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMaxButtonNormal;
  twMaxButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMaxButtonHot;
  twMaxButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMaxButtonPushed;
  twMaxButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMaxButtonDisabled;
  twCloseButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twCloseButtonNormal;
  twCloseButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twCloseButtonHot;
  twCloseButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twCloseButtonPushed;
  twCloseButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twCloseButtonDisabled;
  twSmallCloseButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallCloseButtonNormal;
  twSmallCloseButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallCloseButtonHot;
  twSmallCloseButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallCloseButtonPushed;
  twSmallCloseButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallCloseButtonDisabled;
  twMDICloseButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDICloseButtonNormal;
  twMDICloseButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDICloseButtonHot;
  twMDICloseButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDICloseButtonPushed;
  twMDICloseButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDICloseButtonDisabled;
  twRestoreButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twRestoreButtonNormal;
  twRestoreButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twRestoreButtonHot;
  twRestoreButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twRestoreButtonPushed;
  twRestoreButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twRestoreButtonDisabled;
  twMDIRestoreButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIRestoreButtonNormal;
  twMDIRestoreButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIRestoreButtonHot;
  twMDIRestoreButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIRestoreButtonPushed;
  twMDIRestoreButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIRestoreButtonDisabled;
  twHelpButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHelpButtonNormal;
  twHelpButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHelpButtonHot;
  twHelpButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHelpButtonPushed;
  twHelpButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHelpButtonDisabled;
  twMDIHelpButtonNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIHelpButtonNormal;
  twMDIHelpButtonHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIHelpButtonHot;
  twMDIHelpButtonPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIHelpButtonPushed;
  twMDIHelpButtonDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twMDIHelpButtonDisabled;
  twHorzScrollNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHorzScrollNormal;
  twHorzScrollHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHorzScrollHot;
  twHorzScrollPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHorzScrollPushed;
  twHorzScrollDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHorzScrollDisabled;
  twHorzThumbNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHorzThumbNormal;
  twHorzThumbHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHorzThumbHot;
  twHorzThumbPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHorzThumbPushed;
  twHorzThumbDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twHorzThumbDisabled;
  twVertScrollNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twVertScrollNormal;
  twVertScrollHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twVertScrollHot;
  twVertScrollPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twVertScrollPushed;
  twVertScrollDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twVertScrollDisabled;
  twVertThumbNormal = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twVertThumbNormal;
  twVertThumbHot = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twVertThumbHot;
  twVertThumbPushed = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twVertThumbPushed;
  twVertThumbDisabled = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twVertThumbDisabled;
  twDialog = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twDialog;
  twCaptionSizingTemplate = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twCaptionSizingTemplate;
  twSmallCaptionSizingTemplate = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallCaptionSizingTemplate;
  twFrameLeftSizingTemplate = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twFrameLeftSizingTemplate;
  twSmallFrameLeftSizingTemplate = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallFrameLeftSizingTemplate;
  twFrameRightSizingTemplate = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twFrameRightSizingTemplate;
  twSmallFrameRightSizingTemplate = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallFrameRightSizingTemplate;
  twFrameBottomSizingTemplate = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twFrameBottomSizingTemplate;
  twSmallFrameBottomSizingTemplate = {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.twSmallFrameBottomSizingTemplate;

type
{$IFDEF COMPILER7_UP}
  TThemeServicesEx = TThemeServices;
{$ELSE}
  TThemeServicesEx = class(TThemeServices)
  public
    procedure ApplyThemeChange;
  end;
{$ENDIF}  

function ThemeServices: TThemeServicesEx;

{$ENDIF}

type
{$IFDEF COMPILER7_UP}
  TThemeStyle = TControlStyle;
{$ELSE}
  TThemeStyle = Set of (
    csNeedsBorderPaint, csParentBackground
  );
{$ENDIF}

{
  Instead of the ControlStyle property you should use the following functions:

    ControlStyle := ControlStyle + [csXxx]; -> IncludeThemeStyle(Self, [csXxx]);
    ControlStyle := ControlStyle - [csXxx]; -> ExcludeThemeStyle(Self, [csXxx]);
    if csXxx in ControlStyle then           -> if csXxx in GetThemeStyle(Self) then

}
procedure IncludeThemeStyle(Control: TControl; Style: TThemeStyle);
procedure ExcludeThemeStyle(Control: TControl; Style: TThemeStyle);
function GetThemeStyle(Control: TControl): TThemeStyle;

{ DrawThemedBackground fills R with Canvas.Brush.Color. If the control uses
  csParentBackground and the color is that of it's parent the Rect is not filled
  because the it is done by the JvThemes/VCL7. }
procedure DrawThemedBackground(Control: TControl; Canvas: TCanvas; const R: TRect); overload;
procedure DrawThemedBackground(Control: TControl; DC: HDC; const R: TRect; Brush: HBRUSH);  overload;

{ PerformEraseBackground sends a WM_ERASEBKGND message to the Control's parent. }
procedure PerformEraseBackground(Control: TControl; DC: HDC);

implementation

procedure DrawThemedBackground(Control: TControl; Canvas: TCanvas; const R: TRect);
begin
{$IFDEF JVCLThemesEnabled}
  if (not (csDesigning in Control.ComponentState)) and
     (Control.Parent <> nil) and
     (Canvas.Brush.Color = TWinControlThemeInfo(Control.Parent).Color) and
     (ThemeServices.ThemesEnabled) and
     (csParentBackground in GetThemeStyle(Control)) then
    Exit;
{$ENDIF}
  Canvas.FillRect(R);
end;

procedure DrawThemedBackground(Control: TControl; DC: HDC; const R: TRect; Brush: HBRUSH);
{$IFDEF JVCLThemesEnabled}
var
  LogBrush: TLogBrush;
{$ENDIF}
begin
{$IFDEF JVCLThemesEnabled}
  GetObject(Brush, SizeOf(LogBrush), @LogBrush);
  if (not (csDesigning in Control.ComponentState)) and
     (Control.Parent <> nil) and
     (LogBrush.lbColor = Cardinal(ColorToRGB(TWinControlThemeInfo(Control.Parent).Color))) and
     (ThemeServices.ThemesEnabled) and
     (csParentBackground in GetThemeStyle(Control)) then
    Exit;
{$ENDIF}
  FillRect(DC, R, Brush);
end;

procedure PerformEraseBackground(Control: TControl; DC: HDC);
{ Mike Lischke is the original author of this code. }
var
  WindowOrg: TPoint;
begin
  if Control.Parent <> nil then
  begin
    GetWindowOrgEx(DC, WindowOrg);
    SetWindowOrgEx(DC, WindowOrg.X + Control.Left, WindowOrg.Y + Control.Top, nil);
    Control.Parent.Perform(WM_ERASEBKGND, DC, 0);
    SetWindowOrgEx(DC, WindowOrg.X, WindowOrg.Y, nil);
  end;
end;

{$IFDEF JVCLThemesEnabled}
procedure TThemeServicesEx.ApplyThemeChange;
begin
  ThemeServices.UpdateThemes;
  ThemeServices.DoOnThemeChange;
end;


function ThemeServices: TThemeServicesEx;
begin
  Result := TThemeServicesEx(
    {$IFDEF COMPILER7_UP}Themes{$ELSE}ThemeSrv{$ENDIF}.ThemeServices
  );
end;

{$IFDEF COMPILER7_UP}

{ Delphi 7 handles these styles itself. }

type
  TControlAccess = class(TControl);

procedure IncludeThemeStyle(Control: TControl; Style: TThemeStyle);
begin
  with TControlAccess(Control) do
    ControlStyle := ControlStyle + (Style * [csNeedsBorderPaint, csParentBackground]);
end;

procedure ExcludeThemeStyle(Control: TControl; Style: TThemeStyle);
begin
  with TControlAccess(Control) do
    ControlStyle := ControlStyle - (Style * [csNeedsBorderPaint, csParentBackground]);
end;

function GetThemeStyle(Control: TControl): TThemeStyle;
begin
  with TControlAccess(Control) do
    Result := ControlStyle * [csNeedsBorderPaint, csParentBackground];
end;

{$ELSE} // COMPILER7_UP

{ Delphi 5 and 6 need WindowProc hooks }

type
  TThemeHook = class(TObject)
  public
    FControl: TControl;
    FThemeStyle: TThemeStyle;
    FOrgWndProc: TWndMethod;

    procedure WndProc(var Msg: TMessage);
  protected
    procedure ThemedPaint(var Msg: TWMPaint; var Handled: Boolean);
    procedure ThemedNCPaint(var Msg: TWMNCPaint; var Handled: Boolean);
    procedure ThemedEraseBkGnd(var Msg: TWMEraseBkGnd; var Handled: Boolean);
    procedure ThemedCtlColorStatic(var Msg: TWMCtlColorStatic; var Handled: Boolean);
  public
    constructor Create(AControl: TControl);
    procedure DeleteHook;

    procedure IncludeThemeStyle(Style: TThemeStyle);
    procedure ExcludeThemeStyle(Style: TThemeStyle);

    property Control: TControl read FControl;
    property ThemeStyle: TThemeStyle read FThemeStyle;
  end;

  { TThemeHookList contains all ThemeHooks. }
  TThemeHookList = class(TObjectList)
  private
    FLock: TRTLCriticalSection;
    FRecreationList: TList;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Enter;
    procedure Leave;

    function FindControl(Control: TControl): TThemeHook;

    { GetControl returns the TThemeHook for the Control. If there is no item
      it creates a new one. }
    function GetControl(Control: TControl): TThemeHook;

    property RecreationList: TList read FRecreationList;
  end;

  { TThemeHookComponent is responsible for unhooking TGraphicControls. }
  TThemeHookComponent = class(TComponent)
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  end;


// global ThemeHook list
var
  ThemeHooks: TThemeHookList;
  ThemeHookComponent: TThemeHookComponent;

{ TThemeHookList }

constructor TThemeHookList.Create;
begin
  inherited Create;
  FRecreationList := TList.Create;
  InitializeCriticalSection(FLock);
end;

destructor TThemeHookList.Destroy;
begin
  FRecreationList.Free;
  DeleteCriticalSection(FLock);
  inherited Destroy;
end;

procedure TThemeHookList.Enter;
begin
  EnterCriticalSection(FLock);
end;

procedure TThemeHookList.Leave;
begin
  LeaveCriticalSection(FLock);
end;

function TThemeHookList.FindControl(Control: TControl): TThemeHook;
var i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Result := TThemeHook(Items[i]);
    if Result.FControl = Control then
      Exit;
  end;
  Result := nil;
end;

function TThemeHookList.GetControl(Control: TControl): TThemeHook;
begin
  Result := FindControl(Control);
  if Result = nil then
  begin
    Result := TThemeHook.Create(Control);
    Add(Result);
  end;
end;

{ TThemeHook }

constructor TThemeHook.Create(AControl: TControl);
begin
  inherited Create;
  FControl := AControl;
  if not (csDesigning in FControl.ComponentState) then
  begin
    FOrgWndProc := FControl.WindowProc;
    FControl.FreeNotification(ThemeHookComponent);
    FControl.WindowProc := WndProc;
  end;
end;

procedure TThemeHook.DeleteHook;
begin
  if not (csDesigning in FControl.ComponentState) then
  begin
    FControl.WindowProc := FOrgWndProc;
    FControl.RemoveFreeNotification(ThemeHookComponent);
  end;
  ThemeHooks.RecreationList.Remove(FControl);
  FControl := nil;
  ThemeHooks.Enter;
  try
    ThemeHooks.Remove(Self);
  finally
    ThemeHooks.Leave;
  end;
end;

procedure TThemeHook.IncludeThemeStyle(Style: TThemeStyle);
begin
  FThemeStyle := FThemeStyle + Style;
end;

procedure TThemeHook.ExcludeThemeStyle(Style: TThemeStyle);
begin
  FThemeStyle := FThemeStyle - Style;
  if FThemeStyle = [] then
    DeleteHook;
end;

procedure TThemeHook.WndProc(var Msg: TMessage);
var
  Handled: Boolean;
begin
 // Should not happen but it can if the WindowProc is hooked by another component
  if (ThemeHooks = nil) or (ThemeHooks.IndexOf(Self) = -1) then Exit;


  Handled := False;
  case Msg.Msg of
    CM_RECREATEWND:
      if ThemeHooks.RecreationList.IndexOf(Control) = -1 then
        ThemeHooks.RecreationList.Add(Control);

    WM_PAINT:
      if ThemeServices.ThemesEnabled then
        ThemedPaint(TWMPaint(Msg), Handled);

    WM_ERASEBKGND:
      if ThemeServices.ThemesEnabled then
        ThemedEraseBkGnd(TWMEraseBkGnd(Msg), Handled);

    CN_CTLCOLORSTATIC,
    CN_CTLCOLORBTN:
      if ThemeServices.ThemesEnabled then
        ThemedCtlColorStatic(TWMCtlColorStatic(Msg), Handled);
  end;

  if not Handled then
    FOrgWndProc(Msg);

  case Msg.Msg of
    WM_NCPAINT:
      if ThemeServices.ThemesEnabled then
        ThemedNCPaint(TWMNCPaint(Msg), Handled);

    WM_DESTROY:
        if (csDestroying in Control.ComponentState) and (ThemeHooks.RecreationList.IndexOf(Control) = -1) then
          DeleteHook;
  end;

  while ThemeHooks.RecreationList.Count > 0 do
  begin
    TWinControl(ThemeHooks.RecreationList[0]).HandleNeeded;
    ThemeHooks.RecreationList.Delete(0);
  end;
end;

procedure TThemeHook.ThemedPaint(var Msg: TWMPaint; var Handled: Boolean);
begin
  if csParentBackground in ThemeStyle then
    if Control is TGraphicControl then
      PerformEraseBackground(Control, Msg.DC);
end;

procedure TThemeHook.ThemedNCPaint(var Msg: TWMNCPaint; var Handled: Boolean);
begin
  if csNeedsBorderPaint in ThemeStyle then
  begin
    if Control is TWinControl then
    begin
      ThemeServices.PaintBorder(TWinControl(Control), False);
      Msg.Result := 0;
      Handled := True;
    end;
  end;
end;

procedure TThemeHook.ThemedEraseBkGnd(var Msg: TWMEraseBkGnd; var Handled: Boolean);
begin
  if csParentBackground in ThemeStyle then
  begin
    if Control is TWinControl then
    begin
      if TWinControl(Control).DoubleBuffered then
        PerformEraseBackground(Control, Msg.DC)
      else
        ThemeServices.DrawParentBackground(TWinControl(Control).Handle, Msg.DC, nil, False);
      Msg.Result := 1;
      Handled := True;
    end;
  end;
end;

procedure TThemeHook.ThemedCtlColorStatic(var Msg: TWMCtlColorStatic; var Handled: Boolean);
begin
  if csParentBackground in ThemeStyle then
  begin
    if (Control is TButtonControl) then
    begin
      ThemedEraseBkGnd(TWMEraseBkGnd(Msg), Handled);
      Msg.Result := GetStockObject(NULL_BRUSH);
    end;
  end;
end;

{ TThemeHookComponent }

procedure TThemeHookComponent.Notification(AComponent: TComponent; Operation: TOperation);
var ThemeHook: TThemeHook;
begin
  if Operation = opRemove then
  begin
    ThemeHooks.Enter;
    try
      ThemeHook := ThemeHooks.FindControl(TControl(AComponent));
    finally
      ThemeHooks.Leave;
    end;
    if ThemeHook <> nil then
      ThemeHook.DeleteHook;
  end;
end;


{ functions }

procedure IncludeThemeStyle(Control: TControl; Style: TThemeStyle);
begin
  if Style <> [] then
  begin
    ThemeHooks.Enter;
    try
      ThemeHooks.GetControl(Control).IncludeThemeStyle(Style);
    finally
      ThemeHooks.Leave;
    end;
  end;
end;

procedure ExcludeThemeStyle(Control: TControl; Style: TThemeStyle);
begin
  if Style <> [] then
  begin
    ThemeHooks.Enter;
    try
      ThemeHooks.GetControl(Control).ExcludeThemeStyle(Style);
    finally
      ThemeHooks.Leave;
    end;
  end;
end;

function GetThemeStyle(Control: TControl): TThemeStyle;
var ThemeHook: TThemeHook;
begin
  ThemeHooks.Enter;
  try
    ThemeHook := ThemeHooks.FindControl(Control);
    if Assigned(ThemeHook) then
      Result := ThemeHook.ThemeStyle
    else
      Result := [];
  finally
    ThemeHooks.Leave;
  end;
end;

initialization
  ThemeHooks := TThemeHookList.Create;
  ThemeHookComponent := TThemeHookComponent.Create(nil);

finalization
  FreeAndNil(ThemeHooks);
  ThemeHookComponent.Free;

{$ENDIF} // COMPILER7_UP

{$ELSE} // JVCLThemesEnabled

procedure IncludeThemeStyle(Control: TControl; Style: TThemeStyle);
begin
end;

procedure ExcludeThemeStyle(Control: TControl; Style: TThemeStyle);
begin
end;

function GetThemeStyle(Control: TControl): TThemeStyle;
begin
end;

{$ENDIF} // JVCLThemesEnabled

end.

