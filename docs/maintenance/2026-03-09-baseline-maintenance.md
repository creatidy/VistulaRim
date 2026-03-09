# Maintenance Note 2026-03-09

## Scope

- Type: baseline maintenance follow-up
- Date: 2026-03-09
- Related milestone: none
- Related iteration: none
- Previous maintenance note: `docs/maintenance/2026-03-07-baseline-maintenance.md`

## Changes

- Added `Survival Mode Improved - SKSE`.
- Added `SoulsyHUD`.
- Added `Yes Im Sure`.
- Regenerated `baseline/modlist.txt`, `baseline/loadorder.txt`, and `baseline/plugins.txt`.

## Observed Export Delta

- `SoulsyHUD.esl` now appears in the exported load order and plugins list.
- `SurvivalModeImproved.esp` now appears in the exported load order and plugins list.
- `Yes Im Sure` is present in the mod baseline and does not add a plugin entry.

## Validation

- Baseline exports in the repo match the current MO2 export state for the new maintenance additions.
- No gameplay smoke test was recorded in-repo for this maintenance pass.

## Risks

- `SoulsyHUD` should be checked in-game for HUD overlap or control conflicts alongside `TrueHUD`, `Compass Navigation Overhaul`, `Infinity UI`, and `SkyUI`.
- `Survival Mode Improved - SKSE` should be checked against the current AE/Survival setup for duplicated effects or unintended balance changes.
- Removal of `Rumble - UI - Memospore.esp` should be treated as intentional only if the associated UI audio path was deliberately retired.
