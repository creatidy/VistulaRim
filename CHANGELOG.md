# Changelog

## [0.0.1] - 2026-02-18

Milestone 1 complete: VistulaRim Core 0.0.1 (stable boot, new game, 5 minutes playtest). Also started Milestone 2 combat baseline.

### Added
- MO2 profiles:
  - VistulaRim - Authoring
  - VistulaRim - Playtest
- Profile-specific INI files enabled.
- Patch container plugin created: VistulaRim_Patch.esp
- LOOT installed and registered as an MO2 executable (sanity checks only).
- SKSE installed and confirmed working (getskseversion reports 2.2.6).
- Test baseline: clean post-Helgen save for repeatable playtests.

### Gameplay (Milestone 2 in progress)
- Wildcat enabled as the initial combat baseline.
- Reduced MCM friction by using MCM Helper + Wildcat Settings Loader (one-time setup, then persistent settings).

### Verified
- Launch to main menu.
- New game starts.
- Reached open world (out of Helgen).
- 5+ minutes playtest without crashes.

### Notes
- Patch Pack policy: do not distribute third party mods or generated outputs. Only ship original patch plugin, INIs, and original configs/docs.


## [0.0.2] - 2026-02-18

Milestone 2 complete: Gameplay module (first serious identity).

### Gameplay identity
- Combat: Wildcat - Combat of Skyrim (with Settings Loader for low-friction MCM).
- Perks: Vokrii - Minimalistic Perks of Skyrim.
- Magic baseline: Odin - Skyrim Magic Overhaul + Odin - Vokrii Compatibility Patch.
- Living world baseline: AI Overhaul SSE, Extended Encounters, Immersive Patrols II.

### Foundations
- UI: SkyUI, MCM Helper.
- Distribution: SPID, KID.
- Runtime helpers: powerofthree's Tweaks, MergeMapper (as installed).

### Verification
- Stable new game.
- Core mechanics verified (combat, perks, magic, encounters).
- xEdit pass completed (errors/conflicts reviewed).
- Patch policy maintained: Patch Pack contains only original files.


## [0.0.3] - 2026-02-18

Milestone 3 complete: Quest and content module (content expansion without destabilizing the base).

Note: see `baseline/` exports for the exact modlist delta.

### Added
- Content (baseline snapshot):
  - Missives
  - The Forgotten City

### Verified
- Baseline stability maintained (boot, load/new game, save/load).
- Content sanity check (travel/entry to content areas; no obvious script spam).


## [0.0.4] - 2026-02-18 (In progress)

Milestone 4 in progress (current focus): Followers (Serana-first).

### Target follower stack
- Serana Dialogue Add-On (SDA)
- Fuz Ro D-oh - Silent Voice
- Optional: Serana Dialogue Add-On Patch Hub (only if needed)

### Verification checklist
- Acquire Serana.
- Recruit and dismiss Serana.
- Travel with Serana across multiple cells.
- Combat with Serana.
- Save/load with Serana recruited and dismissed.
