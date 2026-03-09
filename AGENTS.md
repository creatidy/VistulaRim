# AGENTS.md

## Project Overview

This repository is the source of truth for the VistulaRim Patch Pack's documentation and checked-in baseline exports.
It is a docs-first modlist maintenance repo, not a game asset archive.

Agents working here should optimize for:

- preserving Patch Pack scope and permissions safety
- keeping status, versioning, and planning documents internally consistent
- avoiding accidental commits of generated outputs, logs, caches, or third-party content

## Project Context

Core facts that should stay true unless the user explicitly changes project direction:

- VistulaRim is built independently, step by step.
- Elysium is a private reference only. It is never a source of files.
- The shipped product is a Patch Pack: original VistulaRim patches, config, and docs on top of mods the user installs separately.
- Do not add or redistribute third-party mods, third-party assets, or tool-generated outputs derived from them.
- Skyrim Special Edition with the Anniversary Upgrade is required.
- The full Anniversary Edition Creation Club bundle content (`AECC`) is required.
- Verified Creations are not required and are not supported.

Current planning state as of `2026-03-09`:

- `0.0.14` is closed (`2026-03-01`).
- Active milestone: `0.1.1`.
- Active iteration: `0.1.x`.
- Iteration close target: `0.2.0`.
- Current planning cycle: Expansion -> Stabilization -> Expansion.

If a task changes those status values, update the matching authoritative files together.

## Setup And Validation Commands

There is no conventional build step in this repo. The useful commands are maintenance and consistency checks:

- inspect the worktree: `git status --short`
- audit tracked generated outputs: `sh scripts/check-no-generated-outputs.sh`
- search touched docs for stale status, versions, or dates: `rg -n '<token>' README.md CHANGELOG.md docs baseline`
- review the exact patch before handoff: `git diff -- AGENTS.md` or `git diff -- <paths>`

If a task changes repository policy or status, run the smallest relevant checks above and report anything you could not verify.

## Authoritative Files

Use these files deliberately. Do not scatter the same information across new files without reason.

- `README.md`: player-facing overview, requirements, current status, maintainer entry points
- `CHANGELOG.md`: player-facing release highlights only
- `docs/roadmap.md`: cadence contract, iteration map, doc ownership
- `docs/decisions.md`: policy decisions, workflow constraints, baseline rules
- `docs/iterations/*.md`: iteration planning
- `docs/execution/<iteration>/<milestone>.md`: milestone execution detail
- `docs/releases/<version>.md`: technical release notes
- `docs/maintenance/*.md`: standalone maintenance notes for baseline changes outside milestone execution
- `baseline/modlist.txt`: checked-in MO2 mod snapshot
- `baseline/plugins.txt`: checked-in MO2 plugin snapshot
- `baseline/loadorder.txt`: checked-in MO2 load order snapshot
- `docs/generated-outputs-policy.md`: generated-output and repo hygiene policy
- `scripts/check-no-generated-outputs.sh`: tracked-file audit for generated outputs
- `docs/paths.example.md`: example local paths and repo-relative authoritative locations
- `.local/`: local-only notes; never commit its contents

## Editing Rules

### Scope And Permissions

- Never commit third-party mod files, game assets, generated outputs, tool caches, logs, dumps, or xEdit backup folders.
- Keep `.gitignore`, `docs/generated-outputs-policy.md`, and `scripts/check-no-generated-outputs.sh` aligned if generated-output rules change.
- Do not introduce instructions that imply Verified Creations are supported.
- Do not treat LOOT as an authoritative sorter. In this project it is a sanity check only.

### Documentation Style

- Use plain, factual Markdown.
- Prefer exact dates in `YYYY-MM-DD` format.
- Keep player-facing docs free of maintainer-only implementation detail unless the file already serves both audiences.
- Keep terminology stable: "Patch Pack", "AE CC bundle content", `AECC`, "Generated outputs", "Authoring profile", "Playtest profile".
- Do not claim a validation step happened unless the repo already records it or you performed it in this task.

### Status Sync Rules

When changing project status or planning, keep these files consistent:

- milestone/iteration/version status: `README.md`, `docs/roadmap.md`, `docs/decisions.md`
- player release messaging: `CHANGELOG.md`
- technical release detail: `docs/releases/<version>.md`
- baseline maintenance outside milestone execution: `docs/maintenance/<date>-*.md`

If you change only one of those files, make sure the omission is intentional.

## Testing Instructions

OpenAI's Codex guidance explicitly notes that agents may run tests mentioned in `AGENTS.md`. In this repository, "tests" usually means repository hygiene and document consistency, not a software test suite.

Use the following task-shaped validation:

- docs-only change: inspect `git diff` and search touched files for stale dates, versions, or contradictory wording
- baseline export change: update `baseline/modlist.txt`, `baseline/plugins.txt`, and `baseline/loadorder.txt` together, then review their diffs together
- generated-output policy change: run `sh scripts/check-no-generated-outputs.sh` and keep `.gitignore`, `docs/generated-outputs-policy.md`, and `scripts/check-no-generated-outputs.sh` aligned
- release or roadmap change: cross-check `README.md`, `docs/roadmap.md`, `docs/decisions.md`, and any touched release or maintenance note

Do not claim validation that was not actually performed.

## Security And Repo Safety

- Never commit third-party mods, third-party assets, generated outputs, logs, dumps, caches, or local machine path leaks.
- Treat `baseline/` files as snapshots exported from MO2, not as hand-edited freeform docs, unless the task is explicitly a corrective edit.
- Keep `.local/` local-only.
- Do not add guidance that weakens the repo's permissions boundary around redistributed content.

## Change-Specific Workflow

### Baseline Export Changes

If the task updates the checked-in MO2 baseline:

- update `baseline/modlist.txt`, `baseline/plugins.txt`, and `baseline/loadorder.txt` together unless there is a documented reason not to
- add or update a maintenance note in `docs/maintenance/`
- record observed delta, validation actually performed, and remaining risks
- do not claim gameplay smoke tests if none were run

### Release And Planning Changes

- `CHANGELOG.md` uses the player-facing contract: `Highlights`, `Compatibility`, `Upgrade Notes`, `Known Issues`.
- Technical packaging and regression detail belongs in `docs/releases/`.
- Iteration plans should stay aligned with the cadence contract in `docs/roadmap.md`.
- If you add external research snapshots to planning docs, date-stamp them explicitly.

### Generated-Output And Tooling Changes

Current high-signal policy decisions to preserve unless intentionally changed:

- generated outputs are local-only and must not be committed or shipped
- Community Shaders is the cross-platform visuals baseline
- ENB is optional and not required for the baseline
- Pandora is the standardized behavior generator
- generated behavior outputs belong in a dedicated MO2 output mod, never in Overwrite

## Notes For Agents

- `AGENTS.md` is living documentation. Keep it concrete and repo-specific.
- The nearest `AGENTS.md` to the file being edited should be treated as the most specific instruction layer.
- If this repo later grows subprojects with different workflows, add nested `AGENTS.md` files near those subtrees instead of overloading this root file.
- If you could not run a relevant check, say so explicitly in your handoff.
