# Maintenance Note 2026-03-07

## Scope

- Type: baseline maintenance
- Date: 2026-03-07
- Related milestone: none
- Related iteration: none

## Changes

- Documented external config tweaks in `E:\Modding\VistulaRim\MO2\mods\Engine Fixes - Main File\SKSE\Plugins\EngineFixes.toml`:
  - `bRegularQuicksaves = true`
  - `fSleepWaitTimeModifier = 0.5`
- Removed standalone `MEMOSPORE - UI Sound Effects` from the exported mod baseline.
- Added `Complete Crafting Overhaul Remastered` and captured its plugin in the baseline exports.
- Added `Quest Journal Fixes` as a SkyUI compatibility fix.
- Regenerated `baseline/modlist.txt`, `baseline/loadorder.txt`, and `baseline/plugins.txt`.

## Observed Export Delta

- `SSE-Terrain-Tamriel.esm` is present where the previous baseline carried `DynDOLOD.esm`.
- `Weapons Armor Clothing & Clutter Fixes.esp` and `FormList Manipulator - FLM` now appear in the baseline.
- `VistulaRim_Patch.esp`, `DynDOLOD.esp`, and `Occlusion.esp` are absent from the current export.
- `Rumble - UI - Memospore.esp` and `MEMOSPORE - UI Sound Effects` were removed.

## Validation

- Baseline exports in the repo match the current MO2 export state.
- No gameplay smoke test was recorded in-repo for this maintenance pass.

## Risks

- `Complete Crafting Overhaul Remastered` needs in-game verification alongside `Honed Metal`, `Trade and Barter`, `Vokrii`, and `Odin`.
- The MEMOSPORE-related export state should be checked for missing-master or asset dependency issues.
- If the removed generated/plugin outputs were not intentional, this maintenance state should not be treated as packaging-ready.
