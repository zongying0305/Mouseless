/* help */

Lalt & h::
{
    MyBtn_Click(*){
        WinClose()
    }

    MyGui := Gui(,"Usage",)
    MyGui.Add("Text",, "[ Main ]")
    MyGui.Add("Text",, "Show Keyboard: [double click icon]")
    MyGui.Add("Text",, "Unpressed All Key: [LWin] + [Esc]")
    MyGui.Add("Text",, "Media Control: [LWin] + [End] / [PgUp] / [PgDn]")
    MyGui.Add("Text",, "Mouse Click: [LWin] + [u] / [m] / [o]")
    MyGui.Add("Text",, "Mouse Move: [LWin] + [i] / [k] / [j] / [l]")
    MyGui.Add("Text",, "Mouse Scroll: [LWin] + [p] / [;] / [[] / [']")
    MyGui.Add("Text",, "Arror Move: [LAlt] + [i] / [k] / [j] / [l]")
    MyGui.Add("Text",, "[ Optional ]")
    MyGui.Add("Text",, "Run As Admin: [LAlt] + [a]")
    MyGui.Add("Text",, "Signed To StartUp(Admin): [LAlt] + [s]")
    MyGui.Add("Text",, "Toggle Lock Workstation(Admin): [LAlt] + [w]")
    MyGui.Add("Text",, "Beep: [LAlt] + [b]")
    MyGui.Add("Text",, "[ Note ]")
    MyGui.Add("Text",, "Caps2Fn: [Fn] + [Space] + [T]")
    MyBtn := MyGui.Add("Button", "Default w80", "OK")
    MyBtn.OnEvent("Click", MyBtn_Click)
    MyGui.Show()
}

/* Beep */
Lalt & b::
{
    SoundBeep 750, 150
}

/* toggle lock workstation */

Lalt & w::
{
    vIsDisabled := RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation")
    if not vIsDisabled{
        RunWait A_ComSpec " /c REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableLockWorkstation /t REG_DWORD /d 1 /f", , "Hide"
        MsgBox "Disable Lock Workstation", "AHK", "T1"
    }
    else{
        RunWait A_ComSpec " /c REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableLockWorkstation /t REG_DWORD /d 0 /f", , "Hide"
        MsgBox "Enable Lock Workstation", "AHK", "T1"
    }
}

/* signed to startup */

SetWorkingDir A_InitialWorkingDir
TargetFileName := "roy.exe"
StarupDir := "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\"
Lalt & s::
{
    if FileExist(TargetFileName){
        FileCopy TargetFileName, StarupDir, 1
        MsgBox "Signed To StartUp", "AHK", "T1"
    }
}

/* run as admin */

Lalt & a::
{
    if not A_IsAdmin{
        Run '*RunAs "' A_ScriptFullPath '" /restart'
        ExitApp
    }
    else
        MsgBox "You are already run as admin", "AHK", "T1"
}

/* unpressed key */

KeyList := "Lwin|Lalt|a|w|s|i|j|k|l|u|o|m|y|h|p|`;|[|'|LButton|RButton|MButton|WheelDown|WheelUp|WheelLeft|WheelRight"
Lwin & Esc::
{
    MyGui := Gui()
    MyGui.Add("Text",, "unpressing all")
    MyGui.show()
    ; MsgBox "UnPressed All", "Reseting", "T1"
    Loop Parse, KeyList, "|"
    {
        if (GetKeyState(A_LoopField))
        {
            Send Format("{{1} up}", A_LoopField)
        }
    }
    MyGui.Destroy()
}