/* turn caps to fn */

SetCapsLockState "AlwaysOff"

CapsLock & i::
{
    if GetKeyState("Shift", "p")
        Send "+{Up}"
    else
        Send "{Up}"
}

CapsLock & k::
{
    if GetKeyState("Shift", "p")
        Send "+{Down}"
    else
        Send "{Down}"
}

CapsLock & j::
{
    if GetKeyState("Shift", "p")
        Send "+{Left}"
    else
        Send "{Left}"
}

CapsLock & l::
{
    if GetKeyState("Shift", "p")
        Send "+{Right}"
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
