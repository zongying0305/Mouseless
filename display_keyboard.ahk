;---- Alter the tray icon menu:
k_MenuItemHide := "Hide on-screen &keyboard"
k_MenuItemShow := "Show on-screen &keyboard"
A_TrayMenu.Delete
A_TrayMenu.Add k_MenuItemShow, k_ShowHide
A_TrayMenu.Add "&Exit", (*) => ExitApp()
A_TrayMenu.Default := k_MenuItemShow

;---- Create a Gui window for the on-screen keyboard:
k_FontSize := 10
MyGui := Gui("-Caption +ToolWindow +AlwaysOnTop +Disabled")
MyGui.SetFont("s" k_FontSize " " "Bold", "Verdana")
MyGui.MarginY := 0, MyGui.MarginX := 0

;---- Add a button for each key:
k_Layout := [
    ["``", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "Backspace:3", "Del"],
    ["Tab:2", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "[", "]", "\:2", "End"],
    ["CapsLock:2", "A", "S", "D", "F", "G", "H", "J", "K", "L", ";", "'", "Enter:3", "PgUp"],
    ["LShift:3", "Z", "X", "C", "V", "B", "N", "M", ",", ".", "/", "Shift:2", "Up", "PgDn"],
    ["LCtrl", "LWin", "LAlt", "Space:8", "RAlt", "AppsKey", "RCtrl", "Left", "Down", "Right"]
]

for n, k_Row in k_Layout
    for i, k_Key in k_Row
    {
        k_KeyWidthMultiplier := 1
        if RegExMatch(k_Key, "(.+):(\d)", &m) ; Get custom key width multiplier:
        {
            k_Key := m[1]
            k_KeyWidthMultiplier := m[2]
        }
        switch k_Key
        {
        case "LWin":
            k_KeyNameText := "Win"
        case "AppsKey":
            k_KeyNameText := "Fn"
        case "Del":
            k_KeyNameText := "Del"
        case "PgUp":
            k_KeyNameText := "PgU"
        case "PgDn":
            k_KeyNameText := "PgD"
        case "Up":
            k_KeyNameText := "^"
        case "Down":
            k_KeyNameText := "v"
        case "Left":
            k_KeyNameText := "<"
        case "Right":
            k_KeyNameText := ">"
        default:
            k_KeyNameText := GetKeyNameText(k_Key, 0, 1) ; Get localized key name:
        }
        if (StrLen(k_Key) > 1)
            k_KeyNameText := Trim(SubStr(k_KeyNameText, 1, 5))
        else
            k_KeyNameText := k_Key
        k_KeyHeight := k_FontSize * 3
        opt := "h" k_KeyHeight " w" k_KeyHeight * k_KeyWidthMultiplier " -Wrap x+m" 
        if (i = 1)
            opt .= " y+m xm"
        Btn := MyGui.Add("Button", opt, k_KeyNameText)
        Hotkey("~*" k_Key, k_KeyPress.bind(Btn)) ; key pressed
    }

;---- Position the keyboard at the bottom of the screen
k_Monitor := unset
MyGui.Show("Hide")
MonitorGetWorkArea(k_Monitor?, &WL,, &WR, &WB)
MyGui.GetPos(,, &k_width, &k_height)
k_xPos := (WR - WL - k_width) / 2
k_xPos += WL
k_yPos := WB - k_height

;---- Function definitions:
k_KeyPress(BtnCtrl, *)
{ 
    BtnCtrl.Opt("Default") ; Highlight the last pressed key.
    ControlClick(, BtnCtrl,,,, "D")
    KeyWait(SubStr(A_ThisHotkey, 3))
    ControlClick(, BtnCtrl,,,, "U")
}

k_ShowHide(*)
{
    static isVisible := false
    if isVisible
    {
        MyGui.Hide
        A_TrayMenu.Rename k_MenuItemHide, k_MenuItemShow
        isVisible := false
    }
    else
    {
        MyGui.Show("x" k_xPos " y" k_yPos " NA")
        A_TrayMenu.Rename k_MenuItemShow, k_MenuItemHide
        isVisible := true
    }
}

GetKeyNameText(Key, Extended := false, DoNotCare := false)
{
    Params := (GetKeySC(Key) << 16) | (Extended << 24) | (DoNotCare << 25)
    KeyNameText := Buffer(64, 0)
    DllCall("User32.dll\GetKeyNameText", "Int", Params, "Ptr", KeyNameText, "Int", 32)
    return StrGet(KeyNameText)
}
