# Maintenance Note 2026-07-22

## Scope

- Type: baseline maintenance (corrective + scope expansion)
- Date: 2026-07-22
- Related milestone: none
- Related iteration: none
- Previous maintenance note: `docs/maintenance/2026-03-09-baseline-maintenance.md`

## Problem

- Ashe (from `Ashe - Crystal Heart`) shipped with broken hair.
- Root cause: `Ashe - SMP_Hair.esp` was enabled in the load order (`baseline/loadorder.txt` line 127, `baseline/plugins.txt` line 48) without any SMP/HDT physics solver present in the mod list.
- SMP (Shape Memory Physics) hair meshes require a runtime solver to compute mesh deformation/collision. Without a solver, the hair renders incorrectly (common symptoms: invisible patches, stretched/distorted hair, or frozen spike geometry).
- A repo-wide search for `SMP`, `HDT`, `FSMP`, `CBP`, `CBPC`, and `physics` returned zero matches in the baseline and docs prior to this change. The visuals baseline was Community Shaders only (see `docs/decisions.md` -> "Modern visuals baseline").

## Changes

- Added `Faster HDT-SMP` (FSMP) 4.0.1 as the SMP physics solver so `Ashe - SMP_Hair.esp` has a supported runtime.
  - Installed location (live MO2): `E:\Modding\VistulaRim\MO2\mods\Faster HDT-SMP`
  - Installed version: 4.0.1 (Nexus mod id 57339; installer file `FSMP 4.0.1`).
  - Key runtime asset: `SKSE/Plugins/hdtsmp64.dll` (SKSE DLL plugin; no ESP/ESM/ESL).
  - Menu UI: FSMP 4.0.1 ships its config menu via SKSE Menu Framework rather than a classic SkyUI MCM. This affects only the in-game settings UI; the physics solver itself is independent of the menu framework. The standalone "FSMP MCM" add-on mod is unnecessary with 4.0.1 and is not present in this list.
- Regenerated `baseline/modlist.txt`. `baseline/plugins.txt` and `baseline/loadorder.txt` were also re-exported and confirmed; they are unchanged because FSMP is DLL-only and registers no plugin entry.

## Observed Export Delta

- `Faster HDT-SMP` now appears in `baseline/modlist.txt` under the `Behavior engines_separator` group, placed directly above `Auto Skeleton Patch - Universal Behaviour Runtime`.
- `baseline/loadorder.txt` is unchanged (FSMP adds no plugin).
- `baseline/plugins.txt` is unchanged (FSMP adds no plugin).
- No change to `Ashe - SMP_Hair.esp`, `Ashe - Fire and Blood.esp`, or any Ashe-related patch plugins.

## Validation

- Confirmed `Faster HDT-SMP` 4.0.1 is installed in the live MO2 instance (per `meta.ini` `version=4.0.1.0`, Nexus mod id 57339) and contains `SKSE/Plugins/hdtsmp64.dll` plus the standard config presets (`Default`, `Performance`, `Quality`, `Reasonable`, `Debug`).
- Confirmed the three baseline export files are mutually consistent after the re-export.
- User confirmed in-game that Ashe's hair now renders/animates correctly with FSMP enabled. No automated smoke test was run by the maintainer in this task; framerate-impact profiling is still pending.

## Risks

- FSMP is a CPU-cost SKSE plugin and is Windows-leaning; this introduces mild tension with the cross-platform Community Shaders baseline. On Ubuntu/Proton it may need separate validation.
- FSMP config tuning may be required if hair clipping or framerate drops appear; the default preset is in effect until tuned.
- This is a deliberate visuals-baseline scope expansion (policy recorded in `docs/decisions.md` -> "SMP hair physics (Faster HDT-SMP)"). It does not change the Patch Pack's no-redistribution rule: FSMP is a third-party mod users install themselves.