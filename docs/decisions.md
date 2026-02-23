# Decisions

## Product and scope
- VistulaRim is built independently, step by step.
- Elysium is a private reference only, never a source of files.
- First product is a Patch Pack: original patch plugin + INIs + original configs + docs (no third party assets).

## Project status

- Milestone history and current status are tracked in `CHANGELOG.md`.
- Current focus: Milestone 10 (UI/HUD pass).
- Completed recently: Milestone 7 (Fixes and utilities baseline) and Milestone 8 (modern visuals baseline, cross-platform).
- Milestone 9 (LOD workflow; user-generated) is complete. Manual: `docs/manual-lod-generation.md`.

## Stability and workflow
- Stability is the primary KPI.
- Changes are introduced in small batches (1 to 5 mods).
- LOOT is used only as a sanity check.
- Conflicts are resolved via forwardings into VistulaRim_Patch.esp.
- A clean post-Helgen save is the default playtest starting point.

## Gameplay direction (Elysium-inspired, not a copy)
- Target feel: rich and immersive living world, fun combat, and balanced "vanilla plus" direction.
- Avoid feature creep: postpone progression/loot/crafting mega-systems until the base is stable.

Gameplay identity (Milestone 2 baseline):
- Wildcat + Vokrii + Odin + living world mods (AI Overhaul SSE, Extended Encounters, Immersive Patrols II).

## Combat baseline
- Wildcat is enabled as the first combat identity piece.
- MCM friction is reduced via MCM Helper + Wildcat Settings Loader (persistent settings).

## Plugin format choices
- Prefer ESL/light variants when offered, unless a specific patch requires a non-ESL plugin.

## Followers (Milestone 4; complete) scope
- Stability-first, small batch.
- Followers in general. Serana is the first anchor, but Milestone 4 is not Serana-only.
- Baseline follower stack (current exports):
  - Serana Dialogue Add-On
  - Ashe - Crystal Heart (plus SDA x Ashe banter integration)
  - Fuz Ro D-oh - Silent Voice
  - I'm Glad You're Here
  - SDA Patch Hub SE + SDA patch plugins as needed (example: Campfire / GYH / Wintersun)
- Scope rule: do not introduce a full follower framework in the first follower iteration. If a framework is ever needed, treat it as a separate milestone.

## SDA permissions and AI policy (Milestone 4; complete)
- SDA voice recordings must not be used for AI training or AI voice generation.
- SDA files must not be redistributed (Patch Pack policy: ship original VistulaRim files only).

## Adults-only module policy (Milestone 4 optional, 18+; complete)
- Optional module, clearly labeled 18+.
- Consent oriented and player controlled.
- No redistribution of third party adult assets (Patch Pack policy still applies).
- Keep the adult layer separate from the core stability baseline when possible (optional module mindset).

## Animation generation tooling (decision)
- Tooling may be installed (FNIS / Nemesis / Pandora), but do not mix outputs.
- If outputs are generated, keep them in a dedicated MO2 output mod and place it with deliberate priority.

## Generated outputs policy (Milestone 6)

- No generated outputs are distributed in early Patch Pack versions.
- All generated outputs must be produced locally by the user (or maintainer) in MO2.
- Overwrite is a temporary bucket only. Persistent outputs must be moved into dedicated MO2 output mods.
- This repo must not commit generated outputs. Use `.gitignore` plus a pre-release audit (see `docs/generated-outputs-policy.md`).

Rationale:

- Clear file provenance (what is VistulaRim-owned vs derived from third party assets).
- Redistributability and permissions safety.
- Fewer support problems caused by stale or mismatched outputs.

## Patch plugin policy

- VistulaRim_Patch.esp must load last and is used only for explicit, justified forwardings.
- If no forwardings are required, that is documented explicitly.

xEdit warnings (known benign):
- ccBGSSSE025 (Saints & Seducers): some dialogue INFO conditions reference a quest stage that is not present in the quest record. Treated as harmless CC data quirk unless in-game symptoms appear.

## Creations (Creation Club) policy

Goal: reduce feature creep and patch/testing noise while the base modlist is still evolving.

- Keep enabled only the baseline 4 Creations:
  - Fishing
  - Survival Mode
  - Saints and Seducers (AdvDSGS)
  - Rare Curios (Curios)
- Disable all other cc* plugins for now.
- Re-enable additional Creations only when a chosen mod explicitly requires them.

### Creations filename mapping (internal ID -> store name)
- ccBGSSSE025-AdvDSGS = Saints and Seducers
  - internal ID in modlist.txt: `ccbgssse025-advdsgs`
  - plugin file: `ccBGSSSE025-AdvDSGS.esm`
  - archive file: `ccBGSSSE025-AdvDSGS.bsa`

- ccBGSSSE037-Curios = Rare Curios
  - internal ID in modlist.txt: `ccbgssse037-curios`
  - plugin file: `ccBGSSSE037-Curios.esl`
  - archive file: `ccBGSSSE037-Curios.bsa`

## Modern visuals baseline (Milestone 8; complete)
- Cross-platform visuals baseline uses Community Shaders (baseline does not require ENB).
- Optional Windows-only ENB may exist later only as a separate module.
- Shader cache is local-only (`-_Local - ShaderCache`) and is never distributed (DO NOT DISTRIBUTE).
- Community Shaders configuration is kept in `_Config - CommunityShaders`.
- Behavior generation standard (2026): Pandora only. Keep generated behavior outputs in a dedicated MO2 output mod (never in Overwrite).
