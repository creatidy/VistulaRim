# Changelog

This changelog is the source of truth for milestone history and the project process.

## Process (how changes are made)

Primary KPI: stability. Every change must be testable and reversible.

Iteration loop:

1. Pick 1 goal for the iteration.
2. Add a small batch of mods (prefer 1 to 5).
3. Run LOOT only as a sanity check.
4. Use xEdit to identify conflicts.
5. Resolve conflicts by forwarding into the patch plugin.
6. Run the playtest checklist.
7. Update documentation and baseline exports.

Minimum playtest checklist:

- Boot to menu
- Start a new game (or load the clean post-Helgen test save)
- Open inventory, magic menu, map
- Walk outside, engage in 1 combat
- Save, load

Repo/documentation rules live in `docs/vistularim-patch-pack.md` (including where to put milestones, and the "do not duplicate paths" rule).

## Milestones (definition and status)

Status as of 2026-02-21:

- Milestone 0: complete (migration-friendly path conventions and centralized path tracking).
- Milestone 1: complete (core boot/new game baseline).
- Milestone 2: complete (gameplay identity baseline).
- Milestone 3: complete (quest + content module).
- Milestone 4: complete (Followers; optional adults-only animation layer, 18+).
- Milestone 5: complete (audio and weather).
- Milestone 6: complete (generated outputs policy).
- Milestone 7: in progress (fixes and utilities baseline).
- Milestone 8: planned (lighting and water baseline; no ENB requirement).
- Milestone 9: planned (LOD and world generation workflow; user-generated).
- Milestone 10: planned (UI/HUD pass).
- Milestone 11: planned (progression/economy/crafting systems).
- Milestone 12: planned (performance and FPS hygiene).
- Milestone 13: planned (major content module selection).
- Milestone 14: planned (cleaning and Wabbajack-friendly policy).
- Milestone 15: planned (widescreen support).
- Milestone 16: planned (VR support).

Notes:

- Authoritative repo paths and locations are centralized in `paths.md`.
- The installed-mod snapshot is tracked as MO2 export text files; if their location changes later, update `paths.md` and the references in docs (do not duplicate path lists in multiple places).

### Milestone 4 (complete): Followers (with optional 18+ module)

Goal: add follower mods as a separate iteration (stability-first, small batch). Serana is the first anchor, but Milestone 4 is not Serana-only.

Follower stack (baseline exports):

- Serana Dialogue Add-On (SDA)
- Ashe - Crystal Heart (plus SDA x Ashe banter integration)
- Fuz Ro D-oh - Silent Voice
- I'm Glad You're Here
- SDA Patch Hub SE
- SDA patch plugins as needed (example: Campfire / GYH / Wintersun)

Optional module (18+): adults-only animation framework layer

- Purpose: mature roleplay and player choice.
- Scope: optional add-on that does not change the core experience if not installed.
- Policy: no redistribution of third party adult assets. Users download from original sources.
- Testing: treat as a separate add-on module with separate sanity checks (menu opens, no obvious animation framework errors).

Definition of done:

- Follower acquisition works.
- Recruit/dismiss works reliably.
- Travel across multiple cells with no new crash loop.
- Combat with followers works (at least 1-2 fights).
- Save/load works with follower recruited and dismissed.

### Milestone 5 (complete): Audio and weather

Goal: upgrade immersion while keeping performance measurable.

Rule:

- Separate weather from ENB decisions.

Baseline audio/weather stack (baseline exports):

- Audio Overhaul for Skyrim
- Immersive Sounds - Compendium
- Reverb Interior Sounds Expansion
- Acoustic Space Improvement Fixes
- Sound Record Distributor (+ patch hub as needed)
- Cathedral Weathers and Seasons
- True Storms Special Edition
- Rumble Additions

Definition of done:

- No audio conflicts that affect core gameplay.
- Weather changes do not break lighting dramatically.
- Baseline stability remains unchanged (boot, new game/load, save/load).

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

Note: see the MO2 exports referenced in `paths.md` for the exact modlist delta.

### Added
- Content (baseline snapshot):
  - Missives
  - The Forgotten City

### Verified
- Baseline stability maintained (boot, load/new game, save/load).
- Content sanity check (travel/entry to content areas; no obvious script spam).


## [0.0.4] - 2026-02-18

Milestone 4 complete: Followers (general). Serana is the first anchor.

### Added (followers)
- Serana Dialogue Add-On
- Fuz Ro D-oh - Silent Voice
- I'm Glad You're Here
- SDA Patch Hub SE
- Ashe - Crystal Heart (plus SDA x Ashe banter integration)
- SDA patches (plugins):
  - SDA Campfire Patch.esp
  - SDA GYH Patch.esp
  - SDA Wintersun Patch.esp
  - Ashe and Serana Banter Patch.esp

### Added (optional adults-only layer, 18+)
- OStim Standalone (plugin: OStim.esp)
- Open Animation Replacer
- Animation Queue Fix
- Paired Animation Improvements

### Added (frameworks and fixes)
- Campfire (plugin: Campfire.esm)
- PapyrusUtil SE

### Installed tooling (animation generation)
- FNIS
- Nemesis
- Pandora

Notes:
- Only one generation path should be active at a time. Do not mix outputs.
- If you generate outputs, keep them in a dedicated MO2 output mod and place it with deliberate priority.

### Verification checklist
- Acquire Serana.
- Recruit and dismiss Serana.
- Travel with Serana across multiple cells.
- Combat with Serana.
- Save/load with Serana recruited and dismissed.
- OStim sanity check (optional 18+ module): menu opens, no obvious animation framework errors.
- General stability: boot to menu, load/new game, no new crash loop, save/load.

## [0.0.5] - 2026-02-21

Milestone 5 complete: audio and weather baseline (immersion upgrade with measurable performance).

### Added (audio and weather)
- Audio Overhaul for Skyrim
- Immersive Sounds - Compendium
- Reverb Interior Sounds Expansion
- Acoustic Space Improvement Fixes
- Sound Record Distributor (+ patch hub as needed)
- Cathedral Weathers and Seasons
- True Storms Special Edition
- Rumble Additions

### Verified
- No new crash loop introduced.
- Boot/new game/load and save/load remain stable.

## [0.0.6] - 2026-02-21

Milestone 6 complete: generated outputs policy and repo guardrails.

Rule recap:
- This repo ships a Patch Pack only (original VistulaRim work).
- Generated outputs must be produced locally by the user and must not be committed or redistributed in early Patch Pack versions.

### Added
- Policy doc: `docs/generated-outputs-policy.md` (definition, MO2 Overwrite workflow, per-tool notes, repo hygiene checks).
- Repo guardrails: `.gitignore` plus `scripts/check-no-generated-outputs.sh`.

### Changed
- Docs cross-links so the policy is discoverable from `README.md`, `docs/decisions.md`, and `docs/vistularim-patch-pack.md`.
