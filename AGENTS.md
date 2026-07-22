# AGENTS.md

## Project Overview

VistulaRim is a Skyrim SE Patch Pack: original patches, config, and docs on top of mods the user installs separately.

This is a docs-first maintenance repo for a solo developer. Keep it lean.

## Core Rules

- Never commit third-party mods, assets, generated outputs, tool caches, logs, dumps, or xEdit backups.
- The shipped product ships only VistulaRim-owned files (patches, configs, docs).
- Elysium is a private reference only — never a source of files.
- Skyrim SE + Anniversary Upgrade + full AE CC bundle required. Verified Creations not supported.
- Keep `.local/` local-only.

## Authoritative Files

| File | Purpose |
|---|---|
| `README.md` | Player-facing overview, requirements, current status (single source of truth for status) |
| `CHANGELOG.md` | Player-facing release highlights |
| `docs/roadmap.md` | Goals and versioning |
| `docs/decisions.md` | Policy decisions and rationale |
| `docs/generated-outputs-policy.md` | Generated-output and repo hygiene policy |
| `docs/maintenance/*.md` | Baseline change history |
| `baseline/modlist.txt` | MO2 mod snapshot (source of truth for mod list) |
| `baseline/plugins.txt` | MO2 plugin snapshot |
| `baseline/loadorder.txt` | MO2 load order snapshot |
| `scripts/check-no-generated-outputs.sh` | Tracked-file audit for generated outputs |
| `docs/paths.example.md` | Example local paths |
| `docs/manual-lod-generation.md` | LOD workflow reference |
| `docs/ubuntu-24-04.md` | Linux support guide |
| `docs/deferred/skyrim-llm-runtime.md` | Postponed sub-project (not actively planned) |

## Versioning

- Simple sequential: `0.1`, `0.2`, `0.3`, ...
- Each version is one focused batch of work.
- Status lives in `README.md` and `docs/roadmap.md` only — no status duplication.

## Status Sync

When changing project status, update **only**:

- `README.md` (current status block)
- `docs/roadmap.md` (goals/current version)

That's it. No more multi-file status synchronization.

## Editing Rules

### Documentation Style

- Plain, factual Markdown.
- Exact dates in `YYYY-MM-DD` format.
- Player-facing docs (`README.md`, `CHANGELOG.md`) stay free of maintainer-only detail.
- Stable terminology: "Patch Pack", "AE CC bundle content" / `AECC`, "Generated outputs", "Authoring profile", "Playtest profile".

### Baseline Export Changes

- Update `baseline/modlist.txt`, `baseline/plugins.txt`, and `baseline/loadorder.txt` together.
- Add a maintenance note in `docs/maintenance/` with date, observed delta, and validation performed.
- Do not claim gameplay smoke tests unless actually run.

### Generated-Output Policy Changes

- Run `sh scripts/check-no-generated-outputs.sh`.
- Keep `.gitignore`, `docs/generated-outputs-policy.md`, and `scripts/check-no-generated-outputs.sh` aligned.

## Validation Checks

No build step. Useful commands:

```
git status --short
sh scripts/check-no-generated-outputs.sh
rg -n '<token>' README.md CHANGELOG.md docs baseline
git diff -- <paths>
```

Use these after changes to verify consistency. Do not claim validation that was not performed.

## Current Policy Decisions (preserve unless intentionally changed)

- Generated outputs are local-only, never committed or shipped.
- Community Shaders is the cross-platform visuals baseline. ENB is optional.
- Pandora is the only behavior generator. Outputs go in a dedicated MO2 output mod, never Overwrite.
- LOOT is a sanity check only, not an authoritative sorter.