# Decisions

## Product and scope
- VistulaRim is built independently, step by step.
- Elysium is a private reference only, never a source of files.
- First product is a Patch Pack: original patch plugin + INIs + original configs + docs (no third party assets).

## Milestones (status)
- Milestone 1: complete and tested.
- Milestone 2: complete and tested.
- Milestone 3: complete and tested (quest + content module). Note: see `baseline/` exports for the exact modlist delta.
- Milestone 4 (current focus): Followers (Serana-first).

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

## Followers (Milestone 4) scope
- Stability-first, small batch.
- Serana-first follower stack: Serana Dialogue Add-On (SDA) + Fuz Ro D-oh - Silent Voice (+ optional SDA Patch Hub only if needed).
- Scope rule: do not introduce a full follower framework in the first Serana iteration. If a framework is ever needed, treat it as a separate milestone.

## SDA permissions and AI policy (Milestone 4)
- SDA voice recordings must not be used for AI training or AI voice generation.
- SDA files must not be redistributed (Patch Pack policy: ship original VistulaRim files only).


## Milestone 2 - gameplay identity

- Direction: Elysium-inspired feel (rich, immersive, live world) but not a 1:1 copy.
- Goal: more fun while keeping balance and avoiding feature creep.
- Combat baseline: Wildcat.
- Perk overhaul: Vokrii (balanced, vanilla-plus).
- Magic: Odin + official Vokrii compatibility patch.
- Living world: AI Overhaul SSE + Extended Encounters + Immersive Patrols II.
- Scope boundary: no progression/loot/crafting mega-systems in Milestone 2 (postponed by design).

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
