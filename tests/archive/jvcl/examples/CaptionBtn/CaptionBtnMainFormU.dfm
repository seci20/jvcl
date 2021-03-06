object CaptionBtnMainForm: TCaptionBtnMainForm
  Left = 336
  Top = 154
  ActiveControl = udPosition
  AutoScroll = False
  Caption = 'JvCaptionButton Demo'
  ClientHeight = 480
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = True
  Scaled = False
  ShowHint = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 41
    Height = 13
    Caption = '&Position:'
    FocusControl = udPosition
  end
  object lblPos: TLabel
    Left = 80
    Top = 13
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 8
    Top = 181
    Width = 63
    Height = 13
    Caption = 'Button T&ype:'
    FocusControl = cbStandard
  end
  object Label2: TLabel
    Left = 140
    Top = 11
    Width = 41
    Height = 13
    Caption = '&Caption:'
    FocusControl = edCaption
  end
  object Label4: TLabel
    Left = 140
    Top = 181
    Width = 60
    Height = 13
    Caption = '&BorderStyle:'
    FocusControl = cbBorderStyle
  end
  object Label5: TLabel
    Left = 140
    Top = 53
    Width = 23
    Height = 13
    Caption = 'H&int:'
    FocusControl = edHint
  end
  object Label6: TLabel
    Left = 8
    Top = 353
    Width = 37
    Height = 13
    Caption = 'E&vents:'
    FocusControl = meEvents
  end
  object Label7: TLabel
    Left = 8
    Top = 126
    Width = 67
    Height = 13
    Caption = 'Button &Width:'
    FocusControl = tbBtnWidth
  end
  object Bevel1: TBevel
    Left = 4
    Top = 169
    Width = 361
    Height = 5
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object udPosition: TUpDown
    Left = 56
    Top = 8
    Width = 16
    Height = 24
    Min = 0
    Position = 0
    TabOrder = 0
    Wrap = False
    OnClick = udPositionClick
  end
  object chkToggle: TCheckBox
    Left = 8
    Top = 41
    Width = 125
    Height = 17
    Caption = '&Toggle'
    TabOrder = 1
    OnClick = chkToggleClick
  end
  object chkDown: TCheckBox
    Left = 8
    Top = 59
    Width = 125
    Height = 17
    Caption = '&Down'
    Enabled = False
    TabOrder = 2
    OnClick = chkDownClick
  end
  object cbStandard: TComboBox
    Left = 8
    Top = 197
    Width = 121
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
    OnChange = cbStandardChange
    Items.Strings = (
      'tsbNone'
      'tsbClose'
      'tsbHelp'
      'tsbMax'
      'tsbMin'
      'tsbRestore'
      'tsbMinimizeToTray')
  end
  object chkVisible: TCheckBox
    Left = 8
    Top = 77
    Width = 125
    Height = 17
    Caption = '&Visible'
    TabOrder = 3
    OnClick = chkVisibleClick
  end
  object edCaption: TEdit
    Left = 140
    Top = 27
    Width = 223
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    OnChange = edCaptionChange
  end
  object cbBorderStyle: TComboBox
    Left = 140
    Top = 197
    Width = 223
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 10
    OnChange = cbBorderStyleChange
    Items.Strings = (
      'bsNone'
      'bsSingle'
      'bsSizeable'
      'bsDialog'
      'bsToolWindow'
      'bsSizeToolWin')
  end
  object gbButtons: TGroupBox
    Left = 8
    Top = 233
    Width = 354
    Height = 73
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Standard Buttons: '
    TabOrder = 11
    object chkSysMenu: TCheckBox
      Left = 12
      Top = 18
      Width = 90
      Height = 17
      Caption = 'System &Menu'
      TabOrder = 0
      OnClick = chkSysMenuClick
    end
    object chkMax: TCheckBox
      Left = 12
      Top = 42
      Width = 90
      Height = 17
      Caption = 'Ma&ximize'
      TabOrder = 1
      OnClick = chkMaxClick
    end
    object chkMin: TCheckBox
      Left = 192
      Top = 18
      Width = 80
      Height = 17
      Caption = 'Minimi&ze'
      TabOrder = 2
      OnClick = chkMinClick
    end
    object chkHelp: TCheckBox
      Left = 192
      Top = 42
      Width = 80
      Height = 17
      Caption = '&Help'
      TabOrder = 3
      OnClick = chkHelpClick
    end
  end
  object meEvents: TMemo
    Left = 8
    Top = 372
    Width = 354
    Height = 78
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 12
  end
  object edHint: TEdit
    Left = 140
    Top = 69
    Width = 223
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
    OnChange = edHintChange
  end
  object chkShowHints: TCheckBox
    Left = 152
    Top = 95
    Width = 125
    Height = 17
    Caption = '&Show Hints'
    TabOrder = 7
    OnClick = chkShowHintsClick
  end
  object chkEnabled: TCheckBox
    Left = 8
    Top = 95
    Width = 125
    Height = 17
    Caption = '&Enabled'
    TabOrder = 4
    OnClick = chkEnabledClick
  end
  object chkLogEvents: TCheckBox
    Left = 19
    Top = 457
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = '&Log Events'
    TabOrder = 13
  end
  object tbBtnWidth: TTrackBar
    Left = 6
    Top = 144
    Width = 361
    Height = 18
    Anchors = [akLeft, akTop, akRight]
    Max = 200
    Orientation = trHorizontal
    ParentShowHint = False
    Frequency = 1
    Position = 0
    SelEnd = 0
    SelStart = 0
    ShowHint = True
    TabOrder = 8
    ThumbLength = 9
    TickMarks = tmBottomRight
    TickStyle = tsNone
    OnChange = tbBtnWidthChange
  end
  object btnAdd: TButton
    Left = 18
    Top = 312
    Width = 75
    Height = 25
    Hint = 'Add a new caption button (using current settings)'
    Caption = '&Add'
    TabOrder = 14
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 102
    Top = 312
    Width = 75
    Height = 25
    Hint = 'Delete last added caption button (except first one)'
    Caption = 'De&lete'
    TabOrder = 15
    OnClick = btnDeleteClick
  end
  object chkShowImage: TCheckBox
    Left = 152
    Top = 114
    Width = 131
    Height = 17
    Caption = 'Show Special &Image'
    TabOrder = 16
    OnClick = chkShowImageClick
  end
  object JvCaptionButton1: TJvCaptionButton
    Alignment = taCenter
    Caption = '?'
    Down = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Shell Dlg 2'
    Font.Style = [fsBold]
    Hint = 'This is a CaptionButton ToolTip'
    Images = ImageList1
    Margin = 0
    Spacing = 0
    Standard = tsbMinimizeToTray
    OnClick = JvCaptionButton1Click
    OnMouseUp = JvCaptionButton1MouseUp
    OnMouseDown = JvCaptionButton1MouseDown
    OnMouseMove = JvCaptionButton1MouseMove
    Left = 104
    Top = 26
  end
  object ImageList1: TImageList
    Height = 9
    Width = 9
    Left = 234
    Top = 186
    Bitmap = {
      494C010104000900040009000900FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000240000001B00000001001000000000009807
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010421000100010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010001000000000001000100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000010421000000010001000000010001042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001000000010001042
      1042104200001000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1000000010001042104210420000100000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104210000000100010000000100010420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001000100000000000100010000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010421000
      10001042000000000000424D3E000000000000003E0000002800000024000000
      1B0000000100010000000000D800000000000000000000000000000000000000
      00000000FFFFFF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E7F9FFFFF0000000
      E7F9E03870000000FFFFFDF330000000E7F9F8E490000000E7F9F06850000000
      F3F3E0285000000099E678E49000000099E678F330000000C3F0FFF870000000}
  end
end
