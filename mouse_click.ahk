; mouse click

Lwin & u::
{
    MouseClick "left", , , , , "D"
    KeyWait "u"
    MouseClick "left", , , , , "U"
}

Lwin & o::
{
    MouseClick "right", , , , , "D"
    KeyWait "o"
    MouseClick "right", , , , , "U"
}

Lwin & m::
{
    MouseClick "middle", , , , , "D"
    KeyWait "m"
    MouseClick "middle", , , , , "U"
}

Lwin & y::
{
    Send "{Browser_Forward}"
}

Lwin & h::
{
    Send "{Browser_Back}"
}