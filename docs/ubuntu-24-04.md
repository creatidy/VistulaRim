# Ubuntu 24.04 (Steam + Proton) setup guide (maintainer-grade, experimental)

This guide documents a known-good Ubuntu 24.04 path for installing and running VistulaRim via Steam + Proton.

Scope and policy reminders:

- VistulaRim is a Patch Pack. It does not redistribute third party mods or generated outputs.
- You must obtain all third party mods from their original sources.
- Skyrim Special Edition (SSE) with the Anniversary Upgrade is required, and the full AE CC bundle content is required.
- Verified Creations are not required and are not supported.

See also:

- `README.md` (requirements, baseline verification checklist)
- `docs/decisions.md` (Creations policy, Linux installer tooling decision)
- `docs/generated-outputs-policy.md` (MO2 overwrite hygiene, outputs rules)

## 1) System prerequisites

- Ubuntu 24.04
- Steam installed and working
- Skyrim Special Edition installed via Steam
- Proton GE installed (recommended) using ProtonUp-Qt
- protontricks installed (Flatpak recommended)

Install protontricks (Flatpak, recommended):

```bash
flatpak install -y flathub com.github.Matoking.protontricks
```

Optional shell alias (makes commands shorter):

```bash
alias protontricks='flatpak run com.github.Matoking.protontricks'
```

## 2) Install AE CC bundle content (AECC) and verify it

1. In Steam, run Skyrim Special Edition once (do not use MO2 for this first run).
2. In-game, open Creations and download all owned Creation Club content (the AE CC bundle content).
3. Exit the game.

Verify in the Linux filesystem (Steam library install):

```bash
export GAME="$HOME/.local/share/Steam/steamapps/common/Skyrim Special Edition"
ls -la "$GAME/Data/_ResourcePack.esl"
ls -1 "$GAME/Data" | grep -E '^(cc|CC).*\.es[ml]$' | head
ls -1 "$GAME/Data" | grep -E '^(cc|CC).*\.bsa$' | head
```

Expected:

- `_ResourcePack.esl` exists
- Many `cc*.esl` / `cc*.esm` plugins exist
- Many `cc*.bsa` archives exist

Verify inside the Proton prefix via `protontricks` (example AppID 489830):

```bash
protontricks -c 'wine cmd /c dir "Z:\home\<user>\.local\share\Steam\steamapps\common\Skyrim Special Edition\Data\_ResourcePack.esl"' 489830
```

Replace `<user>` with your Linux username.

Known Linux quirk:

- Skyrim may sometimes prompt to "download Creations" again even when the `cc*` files already exist on disk.
- Treat that prompt as non-authoritative on Linux. Verify the on-disk files instead.

Shell quoting note (avoid common path bugs):

- Always quote variables when paths can contain spaces (example: `"$GAME"`).
- Do not store `~` inside quotes. Use `$HOME` instead.

## 3) Recommended installer path on Linux

Recommended Linux path: use the Jackify fork with inline metadata repair:

- https://github.com/creatidy/Jackify

Why:

- Some modlists can fail on Ubuntu during "Installing Included Files" with hash errors for deterministic profile files (example: `profiles/.../plugins.txt` and `profiles/.../loadorder.txt`).
- Root cause: inconsistent InlineFile metadata inside the `.wabbajack` archive (directive Hash/Size do not match the actual bytes referenced by SourceDataID).
- This Jackify fork repairs the InlineFile directive metadata before running the install.

Expected behavior (default):

- Repair runs automatically (enabled by default).
- A sibling archive is created next to the original: `*.jackify-repaired.wabbajack`.
- The engine runs using the repaired archive.
- Log marker: `[INLINE_REPAIR]`

Disable the repair step (not recommended unless debugging):

```bash
export JACKIFY_REPAIR_INLINE_METADATA=0
```

Installation discipline:

- Install into an empty folder.
- Do not launch MO2 until the install completes.
- Keep the Downloads folder persistent across reinstalls to avoid re-downloading large archives.

## 4) Troubleshooting

### Included Files hash error during install

Symptom example:

- "Installing Included Files" fails
- Error mentions `profiles/.../plugins.txt` or `profiles/.../loadorder.txt` with "expected X got Y"

Explanation:

- The `.wabbajack` archive can contain inconsistent InlineFile directive metadata.
- On Ubuntu, this can surface as deterministic profile file hash mismatches.

Fix:

- Use the Jackify fork above with inline repair enabled (default).

### Creations prompt appears in-game

- On Linux, this prompt can appear even when the AE CC bundle files exist.
- Verify `_ResourcePack.esl` and `cc*` files in the `Data` folder instead of trusting the prompt.

### Wabbajack under Proton: Nexus login fails (WebView)

If you insist on running Wabbajack under Proton:

- Nexus login can fail with "WebView failed to initialize" if WebView2 is missing in the Wabbajack Proton prefix.
- Install the WebView2 runtime into the Wabbajack prefix, or recreate the Wabbajack prefix and reinstall Wabbajack.

Recommended:

- Prefer the Jackify fork path on Linux to avoid this friction.

## 5) Minimal playtest checklist

Same baseline checklist as the repo standard:

- Boot to main menu (no missing masters).
- Load the test save (or start new game if needed).
- Open inventory, magic, and map.
- Walk outside and complete 1 short combat.
- Save, load the save.

Maintainers:

- Run the checklist in both profiles (`VistulaRim - Authoring` and `VistulaRim - Playtest`) after baseline updates.
