/* arrow move */

Lalt & i::
{
    if (!GetKeyState("shift") && !GetKeyState("ctrl") && !GetKeyState("lwin"))
        Send "{Up}"
    else if (GetKeyState("shift") && !GetKeyState("ctrl"))
        Send "+{Up}"
    else if (!GetKeyState("shift") && GetKeyState("ctrl")){
        while (GetKeyState("w", "P")){
            Send "{up}"
            sleep 1
        }
    }
    else if (GetKeyState("shift") && GetKeyState("ctrl")){
        while (GetKeyState("w", "P")){
            Send "+{Up}"
            sleep 1
        }
    }
    else if (GetKeyState("Lwin"))
        Send "!{Up}"
}

Lalt & k::
{
    if (!GetKeyState("shift") && !GetKeyState("ctrl") && !GetKeyState("lwin"))
        Send "{Down}"
    else if (GetKeyState("shift") && !GetKeyState("ctrl"))
        Send "+{Down}"
    else if (!GetKeyState("shift") && GetKeyState("ctrl")){
        while (GetKeyState("s", "P")){
            Send "{Down}"
            sleep 1
        }
    }
    else if (GetKeyState("shift") && GetKeyState("ctrl")){
        while (GetKeyState("s", "P")){
            Send "+{Down}"
            sleep 1
        }
    }
    else if (GetKeyState("Lwin"))
        Send "!{Down}"
}

Lalt & j::
{
    if (!GetKeyState("shift") && !GetKeyState("ctrl") && !GetKeyState("lwin"))
        Send "^{Left}"
    else if (GetKeyState("shift") && !GetKeyState("ctrl"))
        Send "+^{Left}"
    else if (!GetKeyState("shift") && GetKeyState("ctrl")){
        while (GetKeyState("a", "P")){
            Send "{Left}"
            sleep 1
        }
    }
    else if (GetKeyState("shift") && GetKeyState("ctrl"))
        Send "+{Dome}"
    else if (GetKeyState("Lwin"))
        Send "!{Left}"
}

Lalt & l::
{
    if (!GetKeyState("shift") && !GetKeyState("ctrl") && !GetKeyState("lwin"))
        Send "^{Right}"
    else if (GetKeyState("shift") && !GetKeyState("ctrl"))
        Send "+^{Right}"
    else if (!GetKeyState("shift") && GetKeyState("ctrl")){
        while (GetKeyState("d", "P")){
            Send "{Right}"
            sleep 1
        }
    }
    else if (GetKeyState("shift") && GetKeyState("ctrl"))
        Send "+{end}"
    else if (GetKeyState("Lwin"))
        Send "!{right}"
}