# GlazeWM Config

My personal GlazeWM configuration. It uses AutoHotKey to rebind your super key to caps lock (be aware that caps lock functionality will be disabled on your system). 

## What is included

- GlazeWM bar configuration
- Workspace definitions
- Gaps and focus border settings
- Keybindings from the active GlazeWM config
- Cursor follow behavior
- Window rules supported by the current GlazeWM install
- Optional helper scripts for the current keyboard and restart workflow

## What is not included

- PowerToys configuration (alt + space to launch your app launcher, highly recommend. You have to install this yourself)
- Other Windows personalization settings

## Current compatibility

This config was copied from a machine running GlazeWM `2.1.1`. Newer GlazeWM versions may require validation or small syntax updates before use.

## Install on a new Windows machine

1. Install GlazeWM.
2. Copy `glazewm/config.yaml` from this repo to:

```text
C:\Users\<USER>\.glaze-wm\config.yaml
```

3. Copy `scripts/restart-glazewm.cmd` to:

```text
C:\Users\<USER>\restart-glazewm.cmd
```

4. If you want the same `Caps Lock` modifier workflow, copy `scripts/caps-to-alt.ahk` to:

```text
C:\Users\<USER>\caps-to-alt.ahk
```

5. Install AutoHotkey v2 and add this startup command:

```text
"C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe" "C:\Users\<USER>\caps-to-alt.ahk"
```

6. Start or restart GlazeWM.
7. Configure PowerToys manually if you want launcher shortcuts that match this machine.

## Keybinds

  Keybinds

  - CapsLock + H/J/K/L or CapsLock + Arrow keys: focus left/down/up/right
  - Alt + CapsLock + H/J/K/L or Alt + CapsLock + Arrow keys: move window left/down/up/right
  - CapsLock + U/P/O/I: resize width - / + and height + / -
  - CapsLock + R: enter resize mode
  - In resize mode: H/J/K/L or arrows resize, Enter or Esc exits resize mode
  - CapsLock + V: toggle tiling direction
  - CapsLock + Space: cycle focus
  - Alt + CapsLock + Space: toggle floating
  - CapsLock + X: toggle fullscreen/maximized
  - CapsLock + M: minimize window
  - Alt + CapsLock + Q: close window
  - Alt + CapsLock + E: exit GlazeWM
  - Alt + CapsLock + G: reload GlazeWM config
  - Alt + CapsLock + R: restart GlazeWM
  - CapsLock + Enter: open cmd
  - CapsLock + Y: focus recent workspace
  - CapsLock + T: next workspace
  - Alt + CapsLock + T: previous workspace
  - CapsLock + WheelDown: next workspace
  - CapsLock + WheelUp: previous workspace
  - CapsLock + 1..9: focus workspace 1..9
  - Alt + CapsLock + 1..9: move focused window to workspace 1..9 and follow it
  - CapsLock + A/F/D/S: move current workspace left/right/up/down
