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

- Skyrim Special Edition with the **Anniversary Edition** upgrade installed.
  - Creations policy for Patch Pack development: keep enabled only the baseline 4 Creations (Fishing, Survival Mode, Saints and Seducers, Rare Curios). See `docs/decisions.md`.
- Mod Organizer 2
- SKSE matching your Skyrim runtime

Optional (useful for troubleshooting / power users):

- xEdit (SSEEdit) for conflict inspection
- LOOT (sanity checks only)

### How to use the Patch Pack (high level)

1. Install Skyrim SE and set up MO2.
2. Install the required third party mods yourself from their original sources (see the baseline exports referenced in `paths.md`).
3. Install the VistulaRim Patch Pack as an MO2 mod (it contains only VistulaRim-owned files).
4. Enable the VistulaRim patch plugin(s).
5. (Optional) Run LOOT as a sanity check, then launch and playtest.

Note: Generated outputs (LOD, BodySlide outputs, etc) are not redistributed in early versions. See `docs/generated-outputs-policy.md` for the standard MO2 workflow if you need to generate outputs locally.

### Current status

Current focus: Milestone 6 (Generated outputs policy). Milestones 4 (Followers; optional 18+ module) and 5 (audio and weather) are complete.

See `CHANGELOG.md` for milestone history and what changed per release.

## For maintainers

- Paths and authoritative repo locations: `paths.md`
- Process and milestone history: `CHANGELOG.md`
- Current and future milestone planning: `docs/vistularim-patch-pack.md`
- Reasoning, motivations, and policy decisions: `docs/decisions.md`
- Generated outputs policy and repo guardrails: `docs/generated-outputs-policy.md`

Local development requirements:

- Skyrim Special Edition with the **Anniversary Edition** upgrade installed (Steam recommended).
  - Creations policy for Patch Pack development: keep enabled only the baseline 4 Creations (Fishing, Survival Mode, Saints and Seducers, Rare Curios). See `docs/decisions.md`.
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
