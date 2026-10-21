# Komorebi Config

My personal komorebi configuration, with an Ubuntu-inspired theme. It uses AutoHotkey to make caps lock the modifier key for every hotkey (be aware that caps lock functionality will be disabled on your system). The Win key is left alone for regular Windows shortcuts.

This repo previously held my GlazeWM config. That version is still in the commit history.

## What is included

- `komorebi.json`: window manager settings (gaps, borders, animations, workspaces for two monitors, Ubuntu colour theme)
- `komorebi.bar.json` / `komorebi.bar.monitor2.json`: one bar per monitor, using the Ubuntu font and colours
- `komorebi.ahk`: caps lock keybindings, plus restart, reload and bar toggle helpers
- `applications.json`: community rules for apps that need special handling ([komorebi-application-specific-configuration](https://github.com/LGUG2Z/komorebi-application-specific-configuration))
- Extra rules so Claude Desktop tiles properly

## What is not included

- PowerToys configuration (alt + space to launch your app launcher, highly recommend. You have to install this yourself)
- The Ubuntu font (see install steps)
- Other Windows personalization settings

## Current compatibility

This config was written for komorebi `0.1.41` and AutoHotkey `2.0`. Newer komorebi versions may need small updates; the `$schema` line at the top of each JSON file will flag anything that changed in your editor.

The workspace layout assumes two monitors. With one monitor, the second monitor's workspaces and bar are simply unused.

## Install on a new Windows machine

1. Install komorebi and AutoHotkey v2:

```text
winget install LGUG2Z.komorebi
winget install AutoHotkey.AutoHotkey
```

2. Clone this repo to:

```text
C:\Users\<USER>\.config\komorebi
```

3. Set the `KOMOREBI_CONFIG_HOME` user environment variable to that folder (PowerShell):

```powershell
[Environment]::SetEnvironmentVariable('KOMOREBI_CONFIG_HOME', "$env:USERPROFILE\.config\komorebi", 'User')
```

4. Install the plain **Ubuntu** font from [Google Fonts](https://fonts.google.com/specimen/Ubuntu). Do not use the Ubuntu Nerd Font for the bar; its icons replace the bar's built-in ones (the battery shows as a signal icon, for example).

5. Optionally refresh the application rules:

```text
komorebic fetch-asc
```

6. Add this startup command so the hotkeys load at login:

```text
"C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe" "C:\Users\<USER>\.config\komorebi\komorebi.ahk"
```

7. Start komorebi with both bars:

```text
komorebic start --bar
```

   Or, once the AHK script is running, press CapsLock + Ctrl + R.

8. Configure PowerToys manually if you want launcher shortcuts that match this machine.

If workspace names or layouts don't update after editing `komorebi.json`, delete `%TEMP%\komorebi.state.json` and restart komorebi; it restores the previous session from that file.

## Keybinds

  Keybinds

  - CapsLock + H/J/K/L or CapsLock + Arrow keys: focus left/down/up/right
  - Alt + CapsLock + H/J/K/L or Shift + CapsLock + Arrow keys: move window left/down/up/right
  - CapsLock + Space or CapsLock + V: toggle floating
  - CapsLock + F: toggle monocle (fullscreen the focused window)
  - CapsLock + T: flip layout horizontally
  - CapsLock + P: toggle window container behaviour (new windows stack instead of splitting)
  - CapsLock + C: close window
  - CapsLock + 1..9, 0: focus workspace 1..10
  - Shift + CapsLock + 1..9, 0: move focused window to workspace 1..10
  - CapsLock + WheelDown: next workspace
  - CapsLock + WheelUp: previous workspace
  - CapsLock + Q: open Windows Terminal
  - CapsLock + E: open File Explorer
  - Alt + CapsLock + O: open Brave
  - CapsLock + PrintScreen: screenshot (Snipping Tool)
  - Shift + CapsLock + R: reload komorebi config and hotkeys
  - Ctrl + CapsLock + R: restart komorebi and both bars
  - Shift + CapsLock + B: show/hide the bars
  - Shift + CapsLock + M: stop komorebi
  - Shift + CapsLock + L: sleep the computer

Workspace hotkeys act on the monitor that currently has focus. The second monitor has 5 workspaces, so CapsLock + 6..0 do nothing there.
