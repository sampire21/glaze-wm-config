#Requires AutoHotkey v2.0
#SingleInstance Force

A_MenuMaskKey := "vkE8"

; komorebi.json resolves its paths from this, so make sure anything launched from here has it.
EnvSet("KOMOREBI_CONFIG_HOME", A_ScriptDir)

; Caps Lock is the komorebi modifier; its normal toggle is disabled.
; The Win key is left alone for regular Windows shortcuts.
SetStoreCapsLockMode False
SetCapsLockState "AlwaysOff"
*CapsLock::return

terminal := "wt.exe"
fileManager := "explorer.exe"
browserPath := EnvGet("ProgramFiles") "\BraveSoftware\Brave-Browser\Application\brave.exe"
powerLauncherPath := EnvGet("LOCALAPPDATA") "\Microsoft\PowerToys\PowerToys.PowerLauncher.exe"
komorebicPath := "C:\Program Files\komorebi\bin\komorebic.exe"

Komorebic(args) {
    global komorebicPath
    try RunWait('"' komorebicPath '" ' args, , "Hide")
}

RunIfExists(path, fallback := "") {
    if path != "" && FileExist(path) {
        Run(path)
        return
    }

    if fallback != "" {
        Run(fallback)
    }
}

SleepComputer() {
    try DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)
}

ToggleNightLight() {
    ; Windows Night light does not expose a stable built-in CLI toggle.
    ; Replace this with your preferred tool if you use one on Windows.
}

ReloadAll() {
    Komorebic("reload-configuration")
    Reload()
}

StopBars() {
    RunWait("taskkill.exe /IM komorebi-bar.exe /F", , "Hide")
}

StartBars() {
    for config in ["komorebi.bar.json", "komorebi.bar.monitor2.json"] {
        Run('"C:\Program Files\komorebi\bin\komorebi-bar.exe" --config "' A_ScriptDir '\' config '"', , "Hide")
    }
}

ToggleBar() {
    if ProcessExist("komorebi-bar.exe") {
        StopBars()
        return
    }

    StartBars()
}

RestartKomorebi() {
    StopBars()
    Komorebic("stop")
    ; Force-kill only if a graceful stop did not finish in time.
    if ProcessWaitClose("komorebi.exe", 5) {
        RunWait("taskkill.exe /IM komorebi.exe /F", , "Hide")
    }

    Run('"C:\Program Files\komorebi\bin\komorebi.exe" --config "' A_ScriptDir '\komorebi.json"', , "Hide")
    ; Bars need komorebi running to read workspace state.
    Sleep(3000)
    StartBars()
}

#HotIf GetKeyState("CapsLock", "P")

; App launchers
q::Run(terminal)
e::Run(fileManager)
PrintScreen::Send("#+s")

; Window management
c::Komorebic("close")
f::Komorebic("toggle-monocle")
v::Komorebic("toggle-float")
Space::Komorebic("toggle-float")
p::Komorebic("toggle-window-container-behaviour")
t::Komorebic("flip-layout horizontal")

; System / session actions
+m::Komorebic("stop")
+r::ReloadAll()
^r::RestartKomorebi()
+l::SleepComputer()
n::ToggleNightLight()
+b::ToggleBar()

; Focus movement
h::Komorebic("focus left")
j::Komorebic("focus down")
k::Komorebic("focus up")
l::Komorebic("focus right")
Left::Komorebic("focus left")
Right::Komorebic("focus right")
Up::Komorebic("focus up")
Down::Komorebic("focus down")

; Move windows
!h::Komorebic("move left")
!j::Komorebic("move down")
!k::Komorebic("move up")
!l::Komorebic("move right")
+Left::Komorebic("move left")
+Right::Komorebic("move right")
+Up::Komorebic("move up")
+Down::Komorebic("move down")

; Workspace switching
1::Komorebic("focus-workspace 0")
2::Komorebic("focus-workspace 1")
3::Komorebic("focus-workspace 2")
4::Komorebic("focus-workspace 3")
5::Komorebic("focus-workspace 4")
6::Komorebic("focus-workspace 5")
7::Komorebic("focus-workspace 6")
8::Komorebic("focus-workspace 7")
9::Komorebic("focus-workspace 8")
0::Komorebic("focus-workspace 9")

; Send active window to workspace
+1::Komorebic("move-to-workspace 0")
+2::Komorebic("move-to-workspace 1")
+3::Komorebic("move-to-workspace 2")
+4::Komorebic("move-to-workspace 3")
+5::Komorebic("move-to-workspace 4")
+6::Komorebic("move-to-workspace 5")
+7::Komorebic("move-to-workspace 6")
+8::Komorebic("move-to-workspace 7")
+9::Komorebic("move-to-workspace 8")
+0::Komorebic("move-to-workspace 9")

; Workspace cycling with Caps Lock + mouse wheel
WheelDown::Komorebic("cycle-workspace next")
WheelUp::Komorebic("cycle-workspace previous")

; Browser autostart equivalent from your Hyprland session
!o::RunIfExists(browserPath, "brave.exe")

#HotIf
