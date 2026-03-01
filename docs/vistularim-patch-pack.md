# VistulaRim Patch Pack (Maintainer Plan)

This document is the place for current and future milestone planning. Past milestones belong in `CHANGELOG.md`.

## Where things live

- End-user state and requirements: `README.md`
- Process and milestone history: `CHANGELOG.md`
- Reasoning, motivations, and policy decisions: `docs/decisions.md`
- Generated outputs policy and repo guardrails: `docs/generated-outputs-policy.md`
- LOD generation manual (user-generated outputs): `docs/manual-lod-generation.md`
- Example local path conventions: `docs/paths.example.md` (copy to `.local/paths.md` if you want a personalized version)

## Docs and repo update rules

Keep these rules intact when updating docs and repo layout:

1. `README.md` is end-user facing and reflects current state (keep meaningful info, config requirements, and any maintainer notes that remain useful).
2. The whole process and the milestone history live in `CHANGELOG.md`.
3. `docs/vistularim-patch-pack.md` tracks only current and future milestones; past milestones move to `CHANGELOG.md`.
4. Do not store paths in several places; reference `docs/paths.example.md` (and keep your real local paths in `.local/paths.md`, which is gitignored).
5. Keep reasoning, motivations, decisions, and logical choices in `docs/decisions.md`.
6. Keep these rules in this document (this section).

## Product definition (Patch Pack)

Product v1 is a Patch Pack: original patches and configuration that sit on top of mods the user installs themselves. A full automated installer (Wabbajack) is a possible future/optional path, but it is not the current product.

A Patch Pack may contain only original work created for VistulaRim:

- Patch plugin(s) (example: `VistulaRim_Patch.esp`)
- Profile-specific INIs
- Original configuration/presets (only if created for VistulaRim)
- Original branding assets (only if created for VistulaRim)
- Documentation

It must not include:

- Third party mods
- Third party assets
- Large generated outputs that embed third party assets

## Current milestone: none (Milestones 13 and 14 complete)

See `CHANGELOG.md` for milestone history.

Milestone 14 is complete as of 2026-03-01; see `CHANGELOG.md` ([0.0.14]).
Milestone 13 is complete as of 2026-03-01; see `CHANGELOG.md` ([0.0.13]).

Next milestone: Milestone 15 (planned) - widescreen support.

Milestone 14 outcomes (concrete):

- Cleaned the three vanilla DLC masters with xEdit Quick Auto Clean (launched from MO2): `Dawnguard.esm`, `HearthFires.esm`, `Dragonborn.esm`.
- `Skyrim.esm` is not cleaned.
- Cleaning scope for Milestone 14 is locked: ignore LOOT "dirty plugin" suggestions for `Update.esm`, `cc*` plugins, and third party plugins unless there is a separately justified issue.
- LOOT now reports the DLC master cleaning warnings as resolved.

Troubleshooting note (Milestone 14):

- Overwrite may remain empty after cleaning: Quick Auto Clean edits the selected plugin file in place. Validate by checking the files in `00 - Cleaned Vanilla Masters`, not by expecting new files in Overwrite.
- Ensure cleaning does not touch the real game/Stock Game Data folder: the target masters must be supplied by an MO2 mod override before you run Quick Auto Clean. If the override is missing or incorrect, Quick Auto Clean will edit the underlying vanilla files.
- Correct `00 - Cleaned Vanilla Masters` layout: MO2 mod root equals `Data`, so the masters must be at the mod root (no `Data/` subfolder):
  - `00 - Cleaned Vanilla Masters/Dawnguard.esm`
  - `00 - Cleaned Vanilla Masters/HearthFires.esm`
  - `00 - Cleaned Vanilla Masters/Dragonborn.esm`
  - Do not use `00 - Cleaned Vanilla Masters/Data/*.esm` (this becomes `Data/Data` and overrides nothing).
- If you accidentally cleaned the game folder: restore vanilla masters via platform verification (Steam/GOG), then repeat the process with the correct `00 - Cleaned Vanilla Masters` override enabled.

Baseline prerequisites (unchanged):

- Skyrim Special Edition with the Anniversary Upgrade is required.
- Install/download ALL Anniversary Edition Creation Club bundle content ("AE CC bundle content" / "AECC").
- Verified Creations are not required and are not supported.

## Reference workflows

### Milestone 13 - Major content module selection (optional)

Goal: add one larger content pillar (example: large questline or "collection" mod) as an explicit, isolated iteration.

Rule:

- Treat this as a dedicated milestone because it can multiply patch surface and testing cost.
- Pick exactly one major content pillar per iteration (do not stack multiple large pillars in one milestone).

Mini-procedure (reproducible):

1) Pick exactly one pillar.
2) Install/tune in `VistulaRim - Authoring`.
3) Validate in `VistulaRim - Playtest`.
4) Run LOOT for sanity checks only (do not treat "dirty plugin" messages as an automatic cleaning obligation).
5) Review conflicts in xEdit. Forward only when justified into `VistulaRim_Patch.esp` (keep patch scope deliberate).
6) If the pillar adds a major new worldspace, expect LOD regeneration later; follow `docs/manual-lod-generation.md` and keep outputs local-only per `docs/generated-outputs-policy.md`.

Definition of done:

- Entry/exit works (start, progress, leave area) with no obvious script spam.
- Conflicts reviewed and handled in the patch plugin when justified.
- Baseline stability remains unchanged (boot, new game/load, save/load).

Candidate pillars (recommended order):

- Wyrmstooth (recommended first; relatively isolated).
- Beyond Skyrim: Bruma (alternative; heavier; requires strict installation discipline).
- Legacy of the Dragonborn (postpone; patch-heavy; treat as its own dedicated iteration if ever added).

Fast test route (generic):

- Force start via MCM if available.
- Reach the new worldspace.
- Enter 1 interior.
- Save/load on both sides of the transition.
- Return to Skyrim.
- Save/load again.

## Optional future: path to a full installer

Only after the Patch Pack is stable:

- Every third party mod is obtained from its original source.
- Every file in the installation has clear provenance.
- Generated outputs are either user-generated or handled by strict, permission-safe rules.

Linux note (Ubuntu 24.04 maintainers):

- Stock Game (separate copied game root) vs non-Stock Game is a disk and support tradeoff. Current Ubuntu 24.04 maintainer workflow runs without Stock Game to save disk.
- Do not ignore `profiles/` during installer compilation: profile files (notably `profiles/*/plugins.txt` and `profiles/*/loadorder.txt`) are deterministic state and must be included.
- If an Ubuntu install fails on "Installing Included Files" with profile hash errors, prefer the Jackify fork with inline metadata repair (see `docs/decisions.md`).

## Final milestones (planned)

### Milestone 15 - Widescreen support

Goal: ensure the modlist and UI stack are usable on ultrawide/widescreen aspect ratios without layout breakage.

Scope:

- Widescreen UI fixes and configs (SkyUI, messagebox/dialogue controls, TrueHUD, etc).
- Keep this isolated to UI layout and scaling (do not change gameplay).

Definition of done:

- No major UI clipping/overlap in common menus (inventory/magic/map/MCM).
- HUD elements align correctly at common widescreen resolutions.
- Baseline stability remains unchanged (boot, new game/load, save/load).

### Milestone 16 - VR support

Goal: explicitly support Skyrim VR as a first-class target, with VR-only dependencies and choices isolated here.

Rule:

- Any VR-only requirement or configuration belongs in this milestone (if something earlier becomes VR-only, move it here).

Definition of done:

- VR runtime boots and reaches playable state (menu, load/new game, locomotion).
- VR interaction basics work (menus, inventory, combat sanity check).
- Baseline stability remains unchanged (no new crash loop, save/load).
