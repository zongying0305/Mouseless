; mouse scroll

scroll(key, button){
    A_Divider := 3
    while (GetKeyState(key, "P")){
        if (GetKeyState("ctrl")) 
            A_Divider:= 10
        MouseClick button
        sleep 500 / A_Divider
        A_Divider := A_Divider + 1
    }
}

Lwin & p::
{
    scroll("p", "WheelUp")
}

Lwin & `;::
{
    scroll(":","WheelDown")
}

Lwin & [::
{
    scroll("[", "WheelLeft")
}

Lwin & '::
{
    scroll("'", "WheelRight")
}