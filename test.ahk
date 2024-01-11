#SingleInstance Force
SetWorkingDir A_InitialWorkingDir

; Include lib
#Include arrow_move.ahk
#Include caps_to_fn.ahk
#Include display_keyboard.ahk
#Include media_control.ahk
#Include mouse_click.ahk
#Include mouse_move.ahk
#Include mouse_scroll.ahk
#Include util.ahk

; reload .ahk
Lalt & r::
{
    MsgBox "Reload Start", "AHK", "T1"
    Reload
}

