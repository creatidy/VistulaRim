# VistulaRim Patch Pack (Maintainer Plan)

This document is the place for current and future milestone planning. Past milestones belong in `CHANGELOG.md`.

## Where things live

- End-user state and requirements: `README.md`
- Process and milestone history: `CHANGELOG.md`
- Reasoning, motivations, and policy decisions: `docs/decisions.md`
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

## Current milestone (in progress): Milestone 4 - Followers

Goal: add follower mods as a separate iteration (stability-first, small batch). Serana is the first anchor, but Milestone 4 is not Serana-only.

Follower stack (current exports):

- Serana Dialogue Add-On (SDA)
- Ashe - Crystal Heart (plus SDA x Ashe banter integration)
- Fuz Ro D-oh - Silent Voice
- I'm Glad You're Here
- SDA Patch Hub SE
- SDA patch plugins as needed (example: Campfire / GYH / Wintersun)

Optional module (18+): adults-only animation framework layer

- Purpose: mature roleplay and player choice.
- Scope: optional add-on that does not change the core experience if not installed.
- Policy: no redistribution of third party adult assets. Users download from original sources.
- Testing: treat as a separate add-on module with separate sanity checks (menu opens, no obvious animation framework errors).

Definition of done:

- Follower acquisition works.
- Recruit/dismiss works reliably.
- Travel across multiple cells with no new crash loop.
- Combat with followers works (at least 1-2 fights).
- Save/load works with follower recruited and dismissed.

## Future milestones (planned)

### Milestone 5 - Audio and weather

Goal: upgrade immersion while keeping performance measurable.

Rule:

- Separate weather from ENB decisions.

Definition of done:

- No audio conflicts that affect core gameplay.
- Weather changes do not break lighting dramatically.
- Baseline stability remains unchanged (boot, new game/load, save/load).

### Milestone 6 - Generated outputs policy

Goal: stop repeating the original fork pain (unclear file provenance and redistributability).

Policy:

- Do not distribute generated outputs in early Patch Pack versions.
- Provide instructions for users to generate outputs locally.
- If moving to a full installer later, treat outputs as a dedicated topic with explicit rules and permissions checks.

## Optional future: path to a full installer

Only after the Patch Pack is stable:

- Every third party mod is obtained from its original source.
- Every file in the installation has clear provenance.
- Generated outputs are either user-generated or handled by strict, permission-safe rules.
