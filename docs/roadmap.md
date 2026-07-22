# VistulaRim Roadmap

## Versioning

- Simple sequential versioning: `0.1`, `0.2`, `0.3`, ...
- Each version is one focused batch of work, tagged when done.
- No milestone sub-versions, no iteration cycles, no cadence contract.

## Current state (2026-07-22)

- Closed: `0.0.14` (2026-03-01) — last release under the old numbering.
- Active: `0.1` — UX-focused expansion, baseline already partially populated.
- Baseline source of truth: `baseline/modlist.txt`, `baseline/plugins.txt`, `baseline/loadorder.txt`.

## Goals

### 0.1 — UX expansion (active)

What's already in the baseline from this goal:
- Compass Navigation Overhaul, Infinity UI, TrueHUD, SoulsyHUD, Yes Im Sure
- Survival Mode Improved - SKSE, Faster HDT-SMP

Still to do:
- Playtest the current HUD overlap cluster as a unit (Compass Navigation + Infinity UI + TrueHUD + SoulsyHUD)
- Evaluate and add UI theme (Dear Diary or Untarnished)
- Evaluate moreHUD / moreHUD Inventory for information readability
- Evaluate loot/selection QoL (QuickLoot, Better Third Person Selection)
- Evaluate Wheeler for quick-access fun
- Widescreen/ultrawide hardening
- First-run onboarding + MCM Recorder preset

### Next

- `0.2` — stabilization and release hardening (cross-platform parity, regression pass, packaging)
- Wabbajack package is a goal after the baseline is playtest-stable.

## Deferred

- `skyrim-llm-runtime` integration — postponed. See `docs/deferred/skyrim-llm-runtime.md`. Not planned in detail.

## Documentation ownership

- Player-facing status and usage: `README.md`
- Player-facing release highlights: `CHANGELOG.md`
- Goals and versioning: this file (`docs/roadmap.md`)
- Policy and rationale: `docs/decisions.md`, `docs/generated-outputs-policy.md`
- Baseline change history: `docs/maintenance/*.md`
- Reference guides: `docs/manual-lod-generation.md`, `docs/ubuntu-24-04.md`, `docs/paths.example.md`