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

- PowerToys configuration
- Old `komorebi` files
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

## Expected result

After copying the config and restarting GlazeWM, the new machine should match this machine's GlazeWM-managed desktop behavior as closely as GlazeWM allows, including the top bar, workspaces, keybindings, and cursor-follow behavior. Copying the helper scripts reproduces the current `Caps Lock`-as-super workflow and GlazeWM restart shortcut as well.
