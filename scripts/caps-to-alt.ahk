#Requires AutoHotkey v2.0

InstallKeybdHook
SetStoreCapsLockMode False
SetCapsLockState "AlwaysOff"

; Map Caps Lock combos to GlazeWM's internal Ctrl+Alt bindings.
SendGlaze(key) {
    if GetKeyState("Shift", "P") {
        Send "^!+" key
    } else {
        Send "^!" key
    }
}

CapsLock & h::SendGlaze("h")
CapsLock & l::SendGlaze("l")
CapsLock & k::SendGlaze("k")
CapsLock & j::SendGlaze("j")
CapsLock & u::SendGlaze("u")
CapsLock & p::SendGlaze("p")
CapsLock & o::SendGlaze("o")
CapsLock & i::SendGlaze("i")
CapsLock & r::SendGlaze("r")
CapsLock & v::SendGlaze("v")
CapsLock & x::SendGlaze("x")
CapsLock & m::SendGlaze("m")
CapsLock & y::SendGlaze("y")
CapsLock & t::SendGlaze("t")
CapsLock & a::SendGlaze("a")
CapsLock & f::SendGlaze("f")
CapsLock & d::SendGlaze("d")
CapsLock & s::SendGlaze("s")
CapsLock & q::SendGlaze("q")
CapsLock & e::SendGlaze("e")
CapsLock & 1::SendGlaze("1")
CapsLock & 2::SendGlaze("2")
CapsLock & 3::SendGlaze("3")
CapsLock & 4::SendGlaze("4")
CapsLock & 5::SendGlaze("5")
CapsLock & 6::SendGlaze("6")
CapsLock & 7::SendGlaze("7")
CapsLock & 8::SendGlaze("8")
CapsLock & 9::SendGlaze("9")
CapsLock & Left::SendGlaze("{Left}")
CapsLock & Right::SendGlaze("{Right}")
CapsLock & Up::SendGlaze("{Up}")
CapsLock & Down::SendGlaze("{Down}")
CapsLock & Space::SendGlaze("{Space}")
CapsLock & Enter::SendGlaze("{Enter}")
CapsLock & WheelUp::SendGlaze("+t")
CapsLock & WheelDown::SendGlaze("t")

; Swallow Caps Lock completely so it never toggles the native caps state.
*CapsLock::Return
*CapsLock Up::Return
