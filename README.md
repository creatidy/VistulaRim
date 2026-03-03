# VistulaRim Patch Pack

VistulaRim is a Skyrim Special Edition project built independently, step by step.

It is inspired by Elysium Remastered as a private reference baseline for ideas and comparisons, but it is not a fork and it never reuses upstream files.

The shipped product is a Patch Pack: original patches and configuration that sit on top of mods you install yourself. A Wabbajack installer is a possible future/optional path, but it is not the current product.

## For players

### What this is

A Patch Pack is a small distributable package that contains only original work created for VistulaRim:

- VistulaRim patch plugin(s) (example: `VistulaRim_Patch.esp`)
- Profile-specific INIs
- Custom configuration and presets (only if created for VistulaRim)
- Documentation (this README, changelog, troubleshooting)

It does not include:

- Third party mods
- Third party assets
- Large generated outputs that embed third party assets

### Requirements

- Skyrim Special Edition (SSE) with the **Anniversary Upgrade** installed (required).
  - AE CC bundle requirement (required): install/download **ALL** Anniversary Edition Creation Club bundle content ("AE CC bundle content" / "AECC").
  - Verified Creations are not required and are not supported (do not build your baseline around them).
  - See `docs/decisions.md`.
- Mod Organizer 2
- SKSE matching your Skyrim runtime

Optional (useful for troubleshooting / power users):

- xEdit (SSEEdit) for conflict inspection
- LOOT (sanity checks only)

Modern visuals baseline (Milestone 8; complete):

- Shader framework (baseline, cross-platform): Community Shaders (Win11 + Ubuntu support).
- Config hygiene: Community Shaders configuration lives in the dedicated MO2 mod `_Config - CommunityShaders`.
- Local-only cache: shader cache is split into `-_Local - ShaderCache` and must never be distributed (DO NOT DISTRIBUTE).
- ENB: not required for the baseline. An optional Windows-only ENB preset may exist later as a separate module.

Animation generation standard (2026):

- Standardize on Pandora as the only behavior generator.
- Generated behavior outputs must live in a dedicated MO2 output mod (never in Overwrite).
- Do not generate outputs with FNIS or Nemesis.

### Verification checklist (AE CC bundle content + boot)

Use this checklist before troubleshooting load order, missing masters, or odd "cc" errors.

- Confirm you own the Anniversary Upgrade for Skyrim Special Edition.
- Launch the game once (not through MO2) and ensure it finishes downloading Creations content.
- In your Skyrim `Data` folder, you should see `_ResourcePack.esl` plus many `cc*.esm` / `cc*.esl` files.
- In MO2 (right pane -> Plugins), you should see the same `cc*.esm` / `cc*.esl` plugins present and enabled. Compare against `baseline/loadorder.txt` (source of truth).
- Boot the game through MO2 and reach the main menu without missing master errors.
  - Maintainers: do this in both profiles (`VistulaRim - Authoring` and `VistulaRim - Playtest`) after any baseline update.

MCM Helper note (troubleshooting):

- If you cannot find "MCM Helper" in the MCM list: that is normal. MCM Helper is a framework used by other mods to create MCM menus.
- If the MCM menu itself is missing, verify SkyUI.
- If other MCM menus do not appear, wait after loading a save (registration can be delayed) and verify SKSE plugin loading via logs (examples: `skse64.log`).

### How to use the Patch Pack (high level)

1. Install Skyrim SE and set up MO2.
   - Do the AE CC bundle download first (see the checklist above).
2. Install the required third party mods yourself from their original sources (use the baseline exports in `baseline/modlist.txt`, `baseline/plugins.txt`, and `baseline/loadorder.txt`).
3. Install the VistulaRim Patch Pack as an MO2 mod (it contains only VistulaRim-owned files).
4. Enable the VistulaRim patch plugin(s).
5. (Optional) Run LOOT as a sanity check, then launch and playtest.

Note: Generated outputs (LOD, BodySlide outputs, etc) are not redistributed in early versions. See `docs/generated-outputs-policy.md` for the standard MO2 workflow. For LOD specifically, see `docs/manual-lod-generation.md`.

### Current status

Optional 18+ module:

- VistulaRim supports an optional adults-only module (Milestone 4). It is not required for the baseline Patch Pack.
- The baseline exports include the optional 18+ stack (including OStim). Treat it as a separate module you can disable.

Release state:

- `0.0.14` is closed (completed on 2026-03-01).
- New cadence started on 2026-03-02 with version-coded milestones only.
- Active milestone: `0.1.1` (planning/version reset).
- Active iteration: `0.1.x` (UX expansion), targeting Wabbajack release `0.2.0`.

Cadence contract:

1. Milestones use `0.A.1` through `0.A.10`.
2. Iteration close is a Wabbajack release tag `0.(A+1).0`.
3. Current planning horizon uses a strict cycle: Expansion -> Stabilization -> Expansion.

Planning overview:

- `0.1.x` (Expansion): detailed milestone plan in `docs/iterations/0.1.md`.
- `0.2.x` (Stabilization): directional plan in `docs/iterations/0.2.md`.
- `0.3.x` (Expansion): directional plan in `docs/iterations/0.3.md`.

Skyrim LLM Runtime alignment:

- `skyrim-llm-runtime` is developed in parallel.
- `0.1.x` and `0.2.x` focus on preparation and interface constraints.
- First visible integration points are planned for `0.3.x`.

See `CHANGELOG.md` for player-facing release highlights.

## For maintainers

- Example local path conventions (copy to `.local/paths.md` if you want a personalized version): `docs/paths.example.md`
- Strategic roadmap: `docs/roadmap.md`
- Iteration plans: `docs/iterations/0.1.md`, `docs/iterations/0.2.md`, `docs/iterations/0.3.md`
- Milestone execution logs: `docs/execution/0.1/`
- Technical release notes: `docs/releases/`
- Player-facing release highlights: `CHANGELOG.md`
- Reasoning, motivations, and policy decisions: `docs/decisions.md`
- Generated outputs policy and repo guardrails: `docs/generated-outputs-policy.md`

### Ubuntu 24.04 support (experimental, maintainer-grade)

Target environment (known-good baseline):

- Ubuntu 24.04
- Steam + Skyrim Special Edition
- Proton (recommend Proton GE via ProtonUp-Qt)

Requirements are unchanged:

- Anniversary Upgrade required
- Full AE CC bundle content required (AECC)
- Verified Creations are not required and are not supported

Linux verification checklist (AECC + MO2):

- In the Skyrim `Data` folder, confirm `_ResourcePack.esl` exists and many `cc*` files exist (`cc*.esl` / `cc*.esm` and `cc*.bsa`).
- In MO2 (right pane -> Plugins), confirm the `cc*` plugins appear and are enabled. Compare against `baseline/loadorder.txt` (source of truth).
- Known Linux quirk: Skyrim may prompt to download Creations again even when the `cc*` files exist. Treat the prompt as non-authoritative and verify the on-disk files instead.

Installer on Linux:

- Recommended: Jackify fork (creatidy) for `.wabbajack` installs on Linux (inline metadata repair enabled by default): https://github.com/creatidy/Jackify
- Why: avoids "Installing Included Files" hash failures seen on Ubuntu for deterministic profile files (example: `profiles/.../plugins.txt` and `profiles/.../loadorder.txt`).

Main guide: `docs/ubuntu-24-04.md`

Local development requirements:

- Skyrim Special Edition (SSE) with the **Anniversary Upgrade** installed (Steam recommended).
  - AE CC bundle requirement (required): install/download **ALL** Anniversary Edition Creation Club bundle content ("AE CC bundle content" / "AECC").
  - Verified Creations are not required and are not supported (do not build your baseline around them).
  - See `docs/decisions.md`.
- Mod Organizer 2
- xEdit (SSEEdit) for conflict inspection and forwardings
- LOOT (sanity checks only)
- SKSE matching your Skyrim runtime

Two MO2 profiles are used:

- VistulaRim - Authoring
- VistulaRim - Playtest

Profile-specific INIs must be enabled.

## Legal and permissions

VistulaRim Patch Pack does not redistribute third party mods or assets.
All third party mods must be obtained from their original sources and used under their respective permissions and platform terms.
