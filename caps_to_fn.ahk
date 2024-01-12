/* turn caps to fn */

SetCapsLockState "AlwaysOff"

CapsLock & i::
{
    if (GetKeyState("Shift") && GetKeyState("Alt"))
        Send "!+{Up}"
    else if (GetKeyState("Shift") && !GetKeyState("Alt"))
        Send "+{Up}"
    else if (!GetKeyState("Shift") && GetKeyState("Alt"))
        Send "!{Up}"
    else
        Send "{Up}"
}

CapsLock & k::
{
    if (GetKeyState("Shift") && GetKeyState("Alt"))
        Send "!+{Down}"
    else if (GetKeyState("Shift") && !GetKeyState("Alt"))
        Send "+{Down}"
    else if (!GetKeyState("Shift") && GetKeyState("Alt"))
        Send "!{Down}"
    else
        Send "{Down}"
}

CapsLock & j::
{
    if (GetKeyState("Shift") && GetKeyState("Alt"))
        Send "!+{Left}"
    else if (GetKeyState("Shift") && !GetKeyState("Alt"))
        Send "+{Left}"
    else if (!GetKeyState("Shift") && GetKeyState("Alt"))
        Send "!{Left}"
    else
        Send "{Left}"
}

CapsLock & l::
{
    if (GetKeyState("Shift") && GetKeyState("Alt"))
        Send "!+{Right}"
    else if (GetKeyState("Shift") && !GetKeyState("Alt"))
        Send "+{Right}"
    else if (!GetKeyState("Shift") && GetKeyState("Alt"))
        Send "!{Right}"
    else
        Send "{Right}"
}

CapsLock & p::
{
    if GetKeyState("Shift", "p")
        Send "+{PgUp}"
    else
        Send "{PgUp}"
}

CapsLock & `;::
{
    if GetKeyState("Shift", "p")
        Send "+{PgDn}"
    else
        Send "{PgDn}"
}

CapsLock & [::
{
    if GetKeyState("Shift", "p")
        Send "+{Home}"
    else
        Send "{Home}"
}

CapsLock & '::
{
    if GetKeyState("Shift", "p")
        Send "+{End}"
    else
        Send "{End}"
}

CapsLock & Backspace::
{
    Send "{Delete}"
}