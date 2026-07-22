# Decisions

## Product and scope
- VistulaRim is built independently, step by step.
- Elysium is a private reference only, never a source of files.
- First product is a Patch Pack: original patch plugin + INIs + original configs + docs (no third party assets).

## Stability and workflow
- Stability is the primary KPI.
- Changes are introduced in small batches (1 to 5 mods).
- LOOT is used only as a sanity check.
- Conflicts are resolved via forwardings into VistulaRim_Patch.esp.
- A clean post-Helgen save is the default playtest starting point.
- Workflow: install/tune in the Authoring profile, validate in the Playtest profile.

## Gameplay direction (Elysium-inspired, not a copy)
- Target feel: rich and immersive living world, fun combat, and balanced "vanilla plus" direction.
- Avoid feature creep: postpone progression/loot/crafting mega-systems until the base is stable.
- Gameplay identity baseline: Wildcat + Vokrii + Odin + living world mods (AI Overhaul SSE, Extended Encounters, Immersive Patrols II).
- Combat: Wildcat enabled; MCM friction reduced via MCM Helper + Wildcat Settings Loader.
- Progression: Experience (XP-based leveling). Economy: Trade and Barter. Crafting: Honed Metal (NPC services as gold sink).

## Plugin format choices
- Prefer ESL/light variants when offered, unless a specific patch requires a non-ESL plugin.

## Followers (complete)
- Stability-first, small batch. Serana is the anchor but not the only follower.
- Baseline follower stack: Serana Dialogue Add-On, Ashe - Crystal Heart, Fuz Ro D-oh, I'm Glad You're Here, SDA Patch Hub SE + patches as needed.
- No full follower framework in the first follower iteration.
- SDA voice recordings must not be used for AI training or AI voice generation.
- SDA files must not be redistributed.

## Adults-only module policy (optional, 18+; complete)
- Optional module, clearly labeled 18+.
- Consent oriented and player controlled.
- No redistribution of third party adult assets.
- Keep the adult layer separate from the core stability baseline when possible.

## Animation generation tooling
- Tooling may be installed (FNIS / Nemesis / Pandora), but do not mix outputs.
- If outputs are generated, keep them in a dedicated MO2 output mod and place it with deliberate priority.

## Generated outputs policy
- No generated outputs are distributed in early Patch Pack versions.
- All generated outputs must be produced locally by the user (or maintainer) in MO2.
- Overwrite is a temporary bucket only. Persistent outputs must be moved into dedicated MO2 output mods.
- This repo must not commit generated outputs. Use `.gitignore` plus a pre-release audit (see `docs/generated-outputs-policy.md`).

## DLC cleaning scope
- Clean only `Dawnguard.esm`, `HearthFires.esm`, and `Dragonborn.esm`. Do not clean `Skyrim.esm`.
- LOOT "dirty plugin" suggestions for `Update.esm`, `cc*` plugins, and third party plugins are advisory only.
- Technical note: MO2 mod root equals `Data`. For a masters override mod like `00 - Cleaned Vanilla Masters`, masters go at the mod root (no `Data/` subfolder).

## Patch plugin policy
- VistulaRim_Patch.esp must load late and after any plugins it forwards; used only for explicit, justified forwardings.
- Generated-output plugins (example: DynDOLOD/Occlusion) may load after it.
- If no forwardings are required, that is documented explicitly.
- Known benign xEdit warning: ccBGSSSE025 (Saints & Seducers) dialogue INFO conditions — harmless CC data quirk unless in-game symptoms appear.

## Creations (Creation Club) policy
- Skyrim Special Edition with the Anniversary Upgrade is required.
- Install/download ALL Anniversary Edition Creation Club bundle content (AECC).
- Verified Creations are not required and are not supported. Do not build baseline dependencies on them.

## Modern visuals baseline (complete)
- Cross-platform visuals baseline: Community Shaders (Win11 + Ubuntu). ENB not required for baseline.
- Shader cache is local-only (`-_Local - ShaderCache`), never distributed.
- Community Shaders configuration: `_Config - CommunityShaders`.
- Behavior generation standard (2026): Pandora only. Generated behavior outputs in a dedicated MO2 output mod (never in Overwrite).

## SMP hair physics (Faster HDT-SMP)
- `Faster HDT-SMP` (FSMP) is the SMP/HDT physics solver for the baseline.
- Supports SMP hair meshes already in the load order (specifically `Ashe - SMP_Hair.esp`). Without a solver, SMP hair renders broken.
- FSMP is a third-party SKSE DLL plugin; adds no ESP/ESM/ESL, so it only appears in `baseline/modlist.txt`.
- Windows-leaning. Ubuntu/Proton playtest validation required before treating SMP hair as guaranteed cross-platform. Fallback: disable `Ashe - SMP_Hair.esp` and FSMP.
- Maintenance reference: `docs/maintenance/2026-07-22-ashe-smp-hair-fsmp.md`

## Linux installer tooling (Ubuntu 24.04)
- Default for Linux `.wabbajack` installs: Jackify fork (creatidy): https://github.com/creatidy/Jackify
- Reason: handles inconsistent InlineFile directive metadata in some `.wabbajack` archives.
- Control: `JACKIFY_REPAIR_INLINE_METADATA=0` disables the pre-install repair step.
- Wabbajack under Proton can fail Nexus login if WebView2 is missing in the prefix. Prefer Jackify on Linux.