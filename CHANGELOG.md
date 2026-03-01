# Changelog

This changelog is the source of truth for milestone history and the project process.

## [0.0.14] - 2026-03-01

Milestone 14 complete: cleaned vanilla DLC masters (Quick Auto Clean) and fixed an MO2 override gotcha.

### Changed
- Cleaned vanilla DLC masters in place via `SSEEditQuickAutoClean.exe` (launched from MO2): `Dawnguard.esm`, `HearthFires.esm`, `Dragonborn.esm`.
- MO2 gotcha fixed: MO2 mod root equals the `Data` folder. The cleaned masters must live in the mod root of `00 - Cleaned Vanilla Masters` (not in a `Data/` subfolder) so they actually override the real game/Stock Game Data masters.
- Cleaning scope kept minimal: do not clean `Skyrim.esm`. LOOT "dirty plugin" suggestions for `Update.esm`, `cc*` plugins, and third party plugins are intentionally ignored for Milestone 14.

### Notes
- Quick Auto Clean edits the selected plugin file in place; MO2 Overwrite may remain empty after cleaning. Validate by checking the files inside `00 - Cleaned Vanilla Masters`, not by expecting new files in Overwrite.
- Overwrite policy: do not package `SSEEdit Backups` as an MO2 mod. Keep backups transient; archive outside MO2 or delete after validation. Empty Overwrite is the desired steady state.

### Docs
- Added `docs/ubuntu-24-04.md` (Steam + Proton setup and AE CC bundle verification on Ubuntu 24.04).
- Added Linux installer guidance: recommend the Jackify fork and document the inline metadata repair workaround.

### Verification
- Run LOOT: the dirty plugin warnings for the three DLC masters should be cleared.
- In MO2, confirm `00 - Cleaned Vanilla Masters` is enabled and contains `Dawnguard.esm`, `HearthFires.esm`, `Dragonborn.esm` at the mod root (no `Data/Data` nesting).
- If the real game/Stock Game Data masters were modified by accident, restore them via platform verification, then repeat cleaning with the correct MO2 override in place.

### Why
- Keep vanilla masters reversible (MO2 override) while addressing common DLC master hygiene.

### What changed
- Cleaned the three DLC masters with Quick Auto Clean and documented the correct MO2 override layout and scope constraints.

### How to verify
- LOOT reports `Dawnguard.esm`, `HearthFires.esm`, and `Dragonborn.esm` as clean, and the game boots normally with `00 - Cleaned Vanilla Masters` enabled.

## [0.0.13] - 2026-03-01

Milestone 13 complete: major content pillar selection (optional) - Wyrmstooth.

### Added
- Major content pillar: Wyrmstooth (mod: `Wyrmstooth`, plugin: `Wyrmstooth.esp`).
- Wyrmstooth integration plugin present in baseline exports: `RealisticWaterTwo - Waves - Wyrmstooth.esp`.

### Verification
- Recommended: run the minimum playtest checklist after applying the Milestone 13 baseline (boot to menu, new game/load, inventory/magic/map, exterior/combat, save/load).
- Milestone 13 sanity (Wyrmstooth): enter the pillar content, reach the new worldspace, enter 1 interior, save/load on both sides, and return to Skyrim with another save/load.

## [0.0.12] - 2026-02-28

Milestone 12 complete: performance and FPS hygiene (targeted; baseline exports updated).

### Added
- UI: MEMOSPORE - UI Sound Effects (plugin: `MEMOSPORE - UI Sound Effects.esp`).
- UI/engine: SSE Display Tweaks (no plugin).
- Performance: Skyrim Project Optimization SE (plugin: `Skyrim Project Optimization - Full ESL Version.esm`).
- Performance: eFPS - Exterior FPS boost (plugin: `Occ_Skyrim_Tamriel.esp`).
- Performance: eFPS - Anniversary Edition (plugin: `Occ_Skyrim_AnnEdition.esp`).
- NPC: RS Children Overhaul (plugins: `RSkyrimChildren.esm`, `RSChildren.esp`).

### Changed
- Creations baseline finalized (strict): Skyrim Special Edition with the Anniversary Upgrade is required; install/download ALL AE CC bundle content. Verified Creations are not required and are not supported.
- Creations baseline: the baseline exports include the full AE CC bundle plugin set (`cc*.esm` / `cc*.esl` plus `_ResourcePack.esl`). Compare against `baseline/loadorder.txt`.
- Load order captured: `MEMOSPORE - UI Sound Effects.esp` loads before `Rumble - UI - Memospore.esp`.
- Baseline exports updated (see `baseline/modlist.txt`, `baseline/plugins.txt`, `baseline/loadorder.txt`).

### Reference
<details>
<summary>AE CC bundle plugins captured in load order</summary>

- `ccbgssse002-exoticarrows.esl`
- `ccbgssse003-zombies.esl`
- `ccbgssse004-ruinsedge.esl`
- `ccbgssse006-stendarshammer.esl`
- `ccbgssse007-chrysamere.esl`
- `ccbgssse008-wraithguard.esl`
- `ccbgssse010-petdwarvenarmoredmudcrab.esl`
- `ccbgssse013-dawnfang.esl`
- `ccbgssse014-spellpack01.esl`
- `ccbgssse016-umbra.esm`
- `ccbgssse018-shadowrend.esl`
- `ccbgssse019-staffofsheogorath.esl`
- `ccbgssse021-lordsmail.esl`
- `ccbgssse031-advcyrus.esm`
- `ccbgssse034-mntuni.esl`
- `ccbgssse035-petnhound.esl`
- `ccbgssse036-petbwolf.esl`
- `ccbgssse040-advobgobs.esl`
- `ccbgssse041-netchleather.esl`
- `ccbgssse043-crosselv.esl`
- `ccbgssse045-hasedoki.esl`
- `ccbgssse051-ba_daedricmail.esl`
- `ccbgssse057-ba_stalhrim.esl`
- `ccbgssse058-ba_steel.esl`
- `ccbgssse060-ba_dragonscale.esl`
- `ccbgssse062-ba_dwarvenmail.esl`
- `ccbgssse063-ba_ebony.esl`
- `ccbgssse064-ba_elven.esl`
- `ccedhsse001-norjewel.esl`
- `ccedhsse002-splkntset.esl`
- `cceejsse001-hstead.esm`
- `cceejsse002-tower.esl`
- `cceejsse003-hollow.esl`
- `ccffbsse001-imperialdragon.esl`
- `ccffbsse002-crossbowpack.esl`
- `ccfsvsse001-backpacks.esl`
- `ccmtysse001-knightsofthenine.esl`
- `ccmtysse002-ve.esl`
- `ccpewsse002-armsofchaos.esl`
- `ccqdrsse002-firewood.esl`
- `cctwbsse001-puzzledungeon.esm`
- `ccvsvsse001-winter.esl`
- `ccvsvsse002-pets.esl`

</details>

### Verification
- Recommended: run the minimum playtest checklist after applying the Milestone 12 baseline (boot to menu, new game/load, inventory/magic/map, exterior/combat, save/load).

## [0.0.11] - 2026-02-25

Milestone 11 complete: progression/economy/crafting systems (stability preserved).

### Added
- Progression: Experience (left-pane mod entry; no plugin in baseline exports).
- Economy: Trade and Barter (plugin: `trade & barter.esp`).
- Economy: Trade and Barter - Settings Loader (left-pane mod entry; no plugin).
- Crafting: Honed Metal (plugin: `HonedMetal.esp`).
- Crafting: Honed Metal -NPC Crafting and Enchanting Services- - Settings Loader (left-pane mod entry; no plugin).

### Changed
- Baseline exports updated to reflect Milestone 11 additions (see `baseline/modlist.txt`, `baseline/plugins.txt`, `baseline/loadorder.txt`).
- Load order captured: `HonedMetal.esp` and `trade & barter.esp` load before `Vokrii - Minimalistic Perks of Skyrim.esp` and before `VistulaRim_Patch.esp`.

### Patch
- `VistulaRim_Patch.esp`: No new forwardings were required for Milestone 11.

### Verified
- Boot to menu.
- New game (or load clean post-Helgen test save).
- Open inventory, magic, map.
- Walk outside, engage in 1 combat.
- Save, load.
- Milestone 11 sanity: vendors/barter feel sane; loot not obviously broken; basic crafting/enchanting flow works; no new crash loop.

## [0.0.10] - 2026-02-23

Milestone 10 complete: UI/HUD pass (basic).

### Added
- UI/HUD: Infinity UI.
- UI/HUD: Compass Navigation Overhaul.
- UI/HUD: TrueHUD - HUD Additions (plugin: `TrueHUD.esl`).

### Changed
- Baseline exports: added local LOD output mods (`VR - Output - xLODGen`, `VR - Output - TexGen`, `VR - Output - DynDOLOD`).
- Baseline exports: generated LOD plugins now appear in snapshots (`DynDOLOD.esm`, `Occlusion.esp`, `DynDOLOD.esp`).
- Baseline exports: removed `DynDOLOD Resources SE` and `xLODGen Resource - SSE Terrain Tamriel` entries from the snapshot.
- Baseline exports: removed `-_Local - ShaderCache` entry from the snapshot.
- Docs/policy: Creations baseline updated (Anniversary Upgrade required; install/download all AECC bundle content; Verified Creations are not required and are not supported).

### Verified
- Boot to menu
- Start a new game (or load the clean post-Helgen test save)
- Open inventory, magic menu, map
- Walk outside, engage in 1 combat
- Save, load

## [0.0.9] - 2026-02-23

Milestone 9 complete: LOD and world generation workflow (user-generated; validated in-game).

### Added
- Manual: `docs/manual-lod-generation.md` (xLODGen/SSELODGen terrain LOD -> TexGen -> DynDOLOD).

### Changed
- Docs cross-links and status updates to reflect Milestone 9 completion.
- Tool naming clarified in docs (`DynDOLODx64.exe` spelling; xLODGen/SSELODGen naming).

### Troubleshooting note
- DynDOLOD blocks running if `SSE-Terrain-Tamriel.esm` is enabled (disable it after the terrain LOD step).

## [0.0.8] - 2026-02-22

Milestone 8 complete: Modern visuals baseline (cross-platform; no ENB requirement).

### Added
- Shader framework baseline: Community Shaders.
- Lighting baseline: Relighting Skyrim SE (`RelightingSkyrim_SSE.esp`) + Luminosity Lighting Overhaul (Cathedral Concept) (`Luminosity Lighting Overhaul.esp`) + Luminosity SkyPatcher addon.
- Water baseline: Realistic Water Two SE (`RealisticWaterTwo - Resources.esm`, `RealisticWaterTwo.esp`).

### Changed
- Overwrite hygiene: shader cache is separated as `-_Local - ShaderCache` (DO NOT DISTRIBUTE).
- Overwrite hygiene: Community Shaders configuration is separated as `_Config - CommunityShaders`.

### Policy
- Behavior generation standard (2026): Pandora only. Keep generated behavior outputs in a dedicated MO2 output mod (never in Overwrite).

## [0.0.7] - 2026-02-22

Milestone 7 complete: fixes and utilities baseline.

### Added
- Crash Logger (SSE AE VR - PDB support) (AE build).
- More Informative Console.
- Scrambled Bugs.
- Bug Fixes SSE.
- Actor Limit Fix.

### Verified
- Minimum playtest checklist completed and stable (boot, load/new game, inventory/magic/map, 1 combat, save, load).
- No new crash loop introduced.
- Save/load baseline unchanged.

### Notes
- Runtime: Skyrim SE 1.6.1170.0.8; SKSE64 2.2.6.
- Crash Logger: crash logs appear in `Documents\My Games\Skyrim Special Edition\SKSE` and help diagnose CTDs.
- More Informative Console: console shows extra object info when clicking things.
- Scrambled Bugs / Bug Fixes SSE / Actor Limit Fix: installed as fixes; no gameplay identity change intended.

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

## [0.0.5] - 2026-02-21

Milestone 5 complete: audio and weather baseline (immersion upgrade with measurable performance).

### Added (audio and weather)
- Audio Overhaul for Skyrim.
- Immersive Sounds - Compendium.
- Reverb Interior Sounds Expansion.
- Acoustic Space Improvement Fixes.
- Sound Record Distributor (+ patch hub as needed).
- Cathedral Weathers and Seasons.
- True Storms Special Edition.
- Rumble Additions.

### Verified
- No new crash loop introduced.
- Boot/new game/load and save/load remain stable.

## [0.0.4] - 2026-02-18

Milestone 4 complete: followers (general). Serana is the first anchor.

### Added (followers)
- Serana Dialogue Add-On.
- Fuz Ro D-oh - Silent Voice.
- I'm Glad You're Here.
- SDA Patch Hub SE.
- Ashe - Crystal Heart (plus SDA x Ashe banter integration).
- SDA patches (plugins):
  - SDA Campfire Patch.esp
  - SDA GYH Patch.esp
  - SDA Wintersun Patch.esp
  - Ashe and Serana Banter Patch.esp

### Added (optional adults-only layer, 18+)
- OStim Standalone (plugin: OStim.esp).
- Open Animation Replacer.
- Animation Queue Fix.
- Paired Animation Improvements.

### Added (frameworks and fixes)
- Campfire (plugin: Campfire.esm).
- PapyrusUtil SE.

### Installed tooling (animation generation)
- FNIS.
- Nemesis.
- Pandora.

### Notes
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

## [0.0.3] - 2026-02-18

Milestone 3 complete: quest and content module (content expansion without destabilizing the base).

Note: see the MO2 exports referenced in `docs/paths.example.md` for the exact modlist delta.

### Added
- Content (baseline snapshot):
  - Missives
  - The Forgotten City

### Verified
- Baseline stability maintained (boot, load/new game, save/load).
- Content sanity check (travel/entry to content areas; no obvious script spam).

## [0.0.2] - 2026-02-18

Milestone 2 complete: gameplay module (first serious identity).

### Gameplay identity
- Combat: Wildcat - Combat of Skyrim (with Settings Loader for low-friction MCM).
- Perks: Vokrii - Minimalistic Perks of Skyrim.
- Magic baseline: Odin - Skyrim Magic Overhaul + Odin - Vokrii Compatibility Patch.
- Living world baseline: AI Overhaul SSE, Extended Encounters, Immersive Patrols II.

### Foundations
- UI: SkyUI, MCM Helper.
- Distribution: SPID, KID.
- Runtime helpers: powerofthree's Tweaks, MergeMapper (as installed).

### Verified
- Stable new game.
- Core mechanics verified (combat, perks, magic, encounters).
- xEdit pass completed (errors/conflicts reviewed).
- Patch policy maintained: Patch Pack contains only original files.

## [0.0.1] - 2026-02-18

Milestone 1 complete: VistulaRim Core 0.0.1 (stable boot, new game, 5 minutes playtest). Also started Milestone 2 combat baseline.

### Added
- MO2 profiles:
  - VistulaRim - Authoring
  - VistulaRim - Playtest
- Profile-specific INI files enabled.
- Patch container plugin created: `VistulaRim_Patch.esp`.
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

## Milestones

Status as of 2026-03-01:

- Milestone 0: complete (migration-friendly path conventions and centralized path tracking).
- Milestone 1: complete (core boot/new game baseline).
- Milestone 2: complete (gameplay identity baseline).
- Milestone 3: complete (quest + content module).
- Milestone 4: complete (followers; optional adults-only animation layer, 18+).
- Milestone 5: complete (audio and weather).
- Milestone 6: complete (generated outputs policy).
- Milestone 7: complete (fixes and utilities baseline).
- Milestone 8: complete (modern visuals baseline: Community Shaders + lighting + water; cross-platform; no ENB requirement).
- Milestone 9: complete (LOD and world generation workflow; user-generated).
- Milestone 10: complete (UI/HUD pass).
- Milestone 11: complete (progression/economy/crafting systems).
- Milestone 12: complete (performance and FPS hygiene).
- Milestone 13: complete (major content module selection; Wyrmstooth).
- Milestone 14: complete (cleaned vanilla DLC masters; MO2 override policy).
- Milestone 15: planned (widescreen support).
- Milestone 16: planned (VR support).

Notes:

- Example local path conventions live in `docs/paths.example.md` (maintainers can keep personalized paths in `.local/paths.md`, which is gitignored).
- The installed-mod snapshot is tracked as MO2 export text files; if their location changes later, update `docs/paths.example.md` and the references in docs (do not duplicate path lists in multiple places).

### Milestone 4 (complete): followers (optional 18+ module)

Goal: add follower mods as a separate iteration (stability-first, small batch). Serana is the first anchor, but Milestone 4 is not Serana-only.

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

### Milestone 5 (complete): audio and weather

Goal: upgrade immersion while keeping performance measurable.

Rule:

- Separate weather from ENB decisions.

Definition of done:

- No audio conflicts that affect core gameplay.
- Weather changes do not break lighting dramatically.
- Baseline stability remains unchanged (boot, new game/load, save/load).

## Process (how changes are made)

Primary KPI: stability. Every change must be testable and reversible.

Maintainer policy: Pandora is the standard behavior generator going forward (do not generate outputs with FNIS or Nemesis; keep behavior outputs in a dedicated MO2 output mod, not Overwrite).

### Iteration loop

1. Pick 1 goal for the iteration.
2. Add a small batch of mods (prefer 1 to 5).
3. Run LOOT only as a sanity check.
4. Use xEdit to identify conflicts.
5. Resolve conflicts by forwarding into the patch plugin.
6. Run the playtest checklist.
7. Update documentation and baseline exports.

### Minimum playtest checklist

- Boot to menu.
- Start a new game (or load the clean post-Helgen test save).
- Open inventory, magic menu, map.
- Walk outside, engage in 1 combat.
- Save, load.

Repo/documentation rules live in `docs/vistularim-patch-pack.md` (including where to put milestones, and the "do not duplicate paths" rule).
