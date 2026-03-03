# Decisions

## Product and scope
- VistulaRim is built independently, step by step.
- Elysium is a private reference only, never a source of files.
- First product is a Patch Pack: original patch plugin + INIs + original configs + docs (no third party assets).

## Project status

- `0.0.14` is closed (completed 2026-03-01).
- New cadence started on 2026-03-02 with version-coded milestones.
- Active milestone: `0.1.1` (planning/version reset).
- Active iteration: `0.1.x` (expansion), targeting Wabbajack release `0.2.0`.
- Roadmap and iteration planning live in `docs/roadmap.md` and `docs/iterations/*.md`.
- Player-facing release highlights are tracked in `CHANGELOG.md`.

## Versioning contract (decision)

- Milestones use `0.A.1` through `0.A.10`.
- Each milestone increments only the 3rd digit.
- Iteration close is a Wabbajack release tag `0.(A+1).0`.
- Global milestone numbering is retired.
- `1.0.0+` is reserved for post-project maintenance.

## Stability and workflow
- Stability is the primary KPI.
- Changes are introduced in small batches (1 to 5 mods).
- LOOT is used only as a sanity check.
- Conflicts are resolved via forwardings into VistulaRim_Patch.esp.
- A clean post-Helgen save is the default playtest starting point.
- Workflow: install/tune in the Authoring profile, validate in the Playtest profile.

## Milestone 13 decision guidance (major content pillars)

- One major content pillar per iteration (do not install multiple large pillars in one milestone).
- Prefer isolated pillars first to minimize conflict surface and patch cost.
- LOOT is sanity only. Do not treat "dirty plugin" messages as an automatic cleaning obligation for third party mods.
- MCM Helper is a framework and is not expected to appear as its own MCM menu entry.
  - Troubleshooting (concise): verify SkyUI MCM works, then verify SKSE plugin loading via logs (example: `skse64.log`). Some MCM menus register with delay after loading a save.
- Playtest checklist remains unchanged (boot, new game/load, save/load) and is still required after any baseline change.

## Milestone 11 (complete) decision: progression/economy/crafting systems

- Progression: use Experience to make character leveling XP-based (decoupled from skill grinding).
- Economy: use Trade and Barter to reduce gold inflation and keep vendor prices sane.
- Crafting: use Honed Metal to shift crafting/enchanting power toward NPC services (gold sink; less crafting dominance).
- Settings: use settings loader mods where available to reduce MCM friction and keep baseline settings consistent across new games.
- Persistence: prefer config-driven/persistent settings over per-playthrough MCM tweaking.
- Guardrails: stability KPI unchanged; small-batch iteration; LOOT sanity only; forwardings only when justified; keep `VistulaRim_Patch.esp` late in the load order and after any plugins it forwards.

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

## Milestone 14 cleaning scope and MO2 layout (decision)

- Scope rule: Milestone 14 cleans only `Dawnguard.esm`, `HearthFires.esm`, and `Dragonborn.esm`.
- Do not clean `Skyrim.esm`.
- LOOT "dirty plugin" suggestions for `Update.esm`, `cc*` plugins, and third party plugins are advisory only. Ignore them unless there is a separately justified issue to fix later (example: deleted navmeshes with in-game symptoms).
- Technical note (MO2): MO2 mod root equals `Data`. For a masters override mod like `00 - Cleaned Vanilla Masters`, the masters must be placed at the mod root (do not use a `Data/` subfolder).

## Patch plugin policy

- VistulaRim_Patch.esp must load late and after any plugins it forwards; it is used only for explicit, justified forwardings.
- Generated-output plugins (example: DynDOLOD/Occlusion) may load after it.
- If no forwardings are required, that is documented explicitly.

xEdit warnings (known benign):
- ccBGSSSE025 (Saints & Seducers): some dialogue INFO conditions reference a quest stage that is not present in the quest record. Treated as harmless CC data quirk unless in-game symptoms appear.

## Creations (Creation Club) policy (decision)

Statement (baseline requirement):

- Skyrim Special Edition with the Anniversary Upgrade is required.
- Install/download ALL Anniversary Edition Creation Club bundle content ("AE CC bundle content" / "AECC").
- Verified Creations are not required and are not supported.
  - Do not build baseline dependencies on Verified Creations.

Rationale:

- Reproducibility: the baseline exports and patching assume the full AE CC bundle plugin set is present; missing `cc*.esm` / `cc*.esl` files can cause missing masters and unpredictable conflicts.
- Cross-platform stability: keep the baseline consistent across Win11 and Ubuntu by depending only on the fixed AE CC bundle set.
- Support risk: Verified Creations can vary and introduce moving-target behavior; the baseline does not account for them.

## Linux installer tooling (Ubuntu 24.04) (decision)

Default (Linux local `.wabbajack` installs):

- Use the Jackify fork (creatidy): https://github.com/creatidy/Jackify
- Reason: some `.wabbajack` archives contain inconsistent InlineFile directive metadata (Hash/Size mismatch vs the actual SourceDataID bytes). On Ubuntu this can surface as "Installing Included Files" hash failures (example: `profiles/.../plugins.txt`, `profiles/.../loadorder.txt`).
- Control: set `JACKIFY_REPAIR_INLINE_METADATA=0` to disable the pre-install repair step.

Note:

- Wabbajack under Proton can fail Nexus login with "WebView failed to initialize" if WebView2 is missing in the Wabbajack prefix. Prefer the Jackify fork path on Linux.

## Modern visuals baseline (Milestone 8; complete)
- Cross-platform visuals baseline uses Community Shaders (baseline does not require ENB).
- Optional Windows-only ENB may exist later only as a separate module.
- Shader cache is local-only (`-_Local - ShaderCache`) and is never distributed (DO NOT DISTRIBUTE).
- Community Shaders configuration is kept in `_Config - CommunityShaders`.
- Behavior generation standard (2026): Pandora only. Keep generated behavior outputs in a dedicated MO2 output mod (never in Overwrite).
