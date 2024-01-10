; mouse move

G_SpeedInit := 0.3
G_SpeedMax := 2
G_SpeedSpecial := 3
G_SpeedAcc := 0.15
G_StepX := 5
G_StepY := 4

get_movement_x(key, speed){
    switch key
    {
    case "i":
        return 0
    case "k":
        return 0
    case "j":
        return speed * speed * G_StepX * -1
    case "l":
        return speed * speed * G_StepX
    default:
        return 0
    }
}

get_movement_y(key, speed){
    switch key
    {
    case "i":
        return speed * speed * G_StepY * -1
    case "k":
        return speed * speed * G_StepY
    case "j":
        return 0
    case "l":
        return 0
    default:
        return 0
    }
}

mouse_move(key){
    A_Speed := G_SpeedInit
    while (GetKeyState(key, "P")){
        if (GetKeyState("ctrl")) 
            A_Speed := G_SpeedSpecial
        A_MovementX := get_movement_x(key, A_Speed)
        A_MovementY := get_movement_y(key, A_Speed)
        DllCall("mouse_event", "UInt", 0x0001, "Int", A_MovementX, "Int", A_MovementY)
        Sleep 1
        if (A_Speed < G_SpeedMax)
            A_Speed += G_SpeedAcc
    }
}

Lwin & i::
{
    mouse_move("i")
}

Lwin & k::
{
    mouse_move("k")
}

Lwin & j::
{
    mouse_move("j")
}

Lwin & l::
{
    mouse_move("l")
}
