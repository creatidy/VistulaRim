# VistulaRim Patch Pack (Maintainer Plan)

This document is the place for current and future milestone planning. Past milestones belong in `CHANGELOG.md`.

## Where things live

- End-user state and requirements: `README.md`
- Process and milestone history: `CHANGELOG.md`
- Reasoning, motivations, and policy decisions: `docs/decisions.md`
- Generated outputs policy and repo guardrails: `docs/generated-outputs-policy.md`
- Paths and authoritative repo locations: `paths.md`

## Docs and repo update rules

Keep these rules intact when updating docs and repo layout:

1. `README.md` is end-user facing and reflects current state (keep meaningful info, config requirements, and any maintainer notes that remain useful).
2. The whole process and the milestone history live in `CHANGELOG.md`.
3. `docs/vistularim-patch-pack.md` tracks only current and future milestones; past milestones move to `CHANGELOG.md`.
4. Do not store paths in several places; reference `paths.md`.
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

## Current milestone (in progress): Milestone 8 - Lighting and water baseline (no ENB requirement)

Goal: improve visual consistency with measurable performance impact and without committing to an ENB path.

Rule:

- Keep weather decisions separate (already handled in Milestone 5; do not re-tune weather as part of this milestone unless required by a chosen lighting solution).

Definition of done:

- Interiors/exteriors readability improved (no widespread "too dark / too bright" regressions).
- Water visuals improved with no obvious seam/flow issues in common locations.
- Baseline stability remains unchanged (boot, new game/load, save/load).

## Future milestones (planned)

### Milestone 9 - LOD and world generation workflow (user-generated)

Goal: define a reproducible, permission-safe workflow for LOD/gen outputs (xLODGen/TexGen/DynDOLOD/grass cache), without redistributing generated assets.

Definition of done:

- Clear, step-by-step generation docs exist.
- Outputs land in dedicated MO2 output mods (never in the real game folder).
- Overwrite policy from Milestone 14 remains achievable (no "always-dirty" Overwrite).

### Milestone 10 - UI/HUD pass (platform-neutral)

Goal: improve moment-to-moment usability (HUD, compass, widgets) while keeping the core UI stable. Keep choices VR-friendly when possible, but do not introduce VR-only dependencies here.

Definition of done:

- No broken menus (inventory/magic/map).
- HUD additions do not cause persistent script spam or UI errors.
- Baseline stability remains unchanged (boot, new game/load, save/load).

### Milestone 11 - Progression/economy/crafting systems (postpone until stable)

Goal: only after the base is stable, consider progression (XP), economy (trade), and crafting overhauls as deliberate, isolated iterations.

Definition of done:

- Clear design intent documented (what problem is being solved).
- No widespread economy breakage (vendors, loot, crafting).
- Baseline stability remains unchanged (boot, new game/load, save/load).

### Milestone 12 - Performance and FPS hygiene (targeted)

Goal: reduce stutter and problematic hotspots with targeted, well-understood performance mods (avoid "mystery gains").

Definition of done:

- Measured improvement in at least one known hotspot or scenario.
- No new visual or gameplay regressions in common playtest routes.
- Baseline stability remains unchanged (boot, new game/load, save/load).

### Milestone 13 - Major content module selection (optional)

Goal: add one larger content pillar (example: large questline or "collection" mod) as an explicit, isolated iteration.

Rule:

- Treat this as a dedicated milestone because it can multiply patch surface and testing cost.

Definition of done:

- Entry/exit works (start, progress, leave area) with no obvious script spam.
- Conflicts reviewed and handled in the patch plugin when justified.
- Baseline stability remains unchanged (boot, new game/load, save/load).

### Milestone 14 - Cleaning and Wabbajack-friendly policy

Goal: make the setup reproducible, reversible, and future-proof for a later Wabbajack installer.

This milestone defines two things:

A) What "cleaning" means, what to clean, and how to do it safely.

B) A strict MO2 policy for outputs (Overwrite hygiene) and for root-level files, so the future installer does not inherit random files with unclear provenance.

#### What "cleaning" means (plain language)

xEdit "cleaning" is a controlled edit of a plugin file (ESM/ESP/ESL) that removes or fixes known problematic record patterns:

- ITM (Identical To Master) records: useless overrides that increase conflict surface.
- UDR (Deleted References): dangerous deletions that can cause crashes if another plugin later touches the deleted object.
- Deleted Navmeshes: can cause serious AI/pathing issues and sometimes crashes.

Cleaning is not an "optimization". It is conflict and stability hygiene.

#### Reversible-by-design rule (do not destroy your future)

Rule: do not modify the real Skyrim game folder.

Instead:

- Keep the Steam (or GOG) Skyrim install vanilla.
- Any cleaned masters must live as a separate MO2 mod (or inside a Stock Game copy used by the modlist).
- Reverting must be as simple as disabling a single MO2 mod.

If you ever accidentally touch the game folder, restore it using the platform's file verification, then re-apply the MO2-side solution.

#### What to clean (minimal, stability-first)

Clean only what LOOT explicitly reports as needing cleaning and what the community considers safe to clean:

- Dawnguard.esm
- HearthFires.esm
- Dragonborn.esm

Do not clean Skyrim.esm.

Creation Club / Creations policy:

- For Patch Pack development: keep the baseline 4 Creations only (Fishing, Survival, Saints and Seducers, Rare Curios) and disable all other cc* plugins.
- For a future public Wabbajack list: do not require paid Creations. Treat them as an optional addon module at most.

#### How to clean safely (MO2 + Quick Auto Clean)

Preparation:

- Add xEdit Quick Auto Clean as an MO2 executable (SSEEditQuickAutoClean.exe).
- Run it through MO2 so outputs land in MO2's Overwrite folder rather than the real game directory.

Process (do one file at a time):

1) Start SSEEditQuickAutoClean from MO2.

2) When asked to select plugins, pick exactly one target, for example Dawnguard.esm.

3) Let it finish, then close xEdit.

4) In MO2, right click Overwrite and create a mod named:
   00 - Cleaned Vanilla Masters

5) Ensure this mod contains the cleaned ESM(s) and is enabled early in the left pane.

6) Repeat for HearthFires.esm and Dragonborn.esm.

Verification:

- Re-run LOOT. The cleaning warnings for these masters should disappear.
- Keep SSEEdit backups for a short time, then archive or delete them.

#### Overwrite and root-level file policy (Wabbajack-friendly)

Overwrite is not a mod. It is a temporary bucket for tool outputs that need human sorting.

Rule: Overwrite must be close to empty most of the time.

Whenever new files appear in Overwrite, decide which category they belong to and move them into a dedicated MO2 mod:

A) Root-level files (SKSE, preloader, Creations staging)

- Create a dedicated mod, example:
  00 - Root (SKSE + Preloader + Creations)

- This mod may contain a Root folder structure used by Root Builder or equivalent tooling.

- Do not keep logs long-term (example: d3dx9_42.log). Delete after validation.

B) Generated configuration for SKSE plugins

- Create a dedicated mod, example:
  99 - SKSE Plugin INIs (Generated)

- Put generated INIs and plugin config folders there (examples: po3_Tweaks.ini, OpenAnimationReplacer.ini).

C) Tool caches and transient files

- ShaderCache: delete (never ship).
- Other caches: delete unless a tool explicitly requires persistence.

D) Tool backups

- SSEEdit Backups: keep temporarily while validating, then archive outside MO2 or delete.

Definition of done for this section:

- Overwrite is empty (or contains only short-lived files you are actively sorting).
- All persistent outputs are in named output mods with clear purpose.
- No random files are copied into the real Skyrim game folder.

#### Stock Game decision (future Wabbajack path)

If you later build a Wabbajack installer, prefer the Stock Game approach:

- The end-user's vanilla game folder stays untouched.
- Wabbajack copies game files into a Stock Game folder inside the modlist install.
- Root-level changes and cleaned masters are applied in a controlled, reproducible way.

This reduces update breakage and makes support easier.

#### Definition of done (Milestone 14)

- DLC masters cleaned using Quick Auto Clean, stored in 00 - Cleaned Vanilla Masters, no edits in the real Skyrim folder.
- A strict Overwrite policy is followed: outputs are sorted into dedicated output mods, caches deleted, backups handled intentionally.
- Creations policy is enforced (baseline only for Patch Pack development; no paid Creations required for a future public Wabbajack list).
- The resulting setup remains stable at the baseline test level (boot, new game/load, save/load).

## Optional future: path to a full installer

Only after the Patch Pack is stable:

- Every third party mod is obtained from its original source.
- Every file in the installation has clear provenance.
- Generated outputs are either user-generated or handled by strict, permission-safe rules.

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
