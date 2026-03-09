# VistulaRim Roadmap

## Current state

- `0.0.14` is closed (completed on 2026-03-01).
- New cadence starts on 2026-03-02 with version-coded milestones only.
- Active milestone: `0.1.1` (planning/version reset).
- Active iteration: `0.1.x` (UX expansion), targeting Wabbajack release `0.2.0`.
- Iteration cycle is strict for current planning horizon: Expansion -> Stabilization -> Expansion.

## Versioning and cadence contract

1. Milestones use `0.A.B` where `B` is `1..10`.
2. Milestones increment only the 3rd digit.
3. Iteration close is a Wabbajack release tag `0.(A+1).0`.
4. Global milestone numbering is retired.
5. `1.0.0+` is reserved for post-project maintenance.

## Iteration map

| Iteration | Type | Milestone range | Close tag |
|---|---|---|---|
| `0.1.x` | Expansion (UX) | `0.1.1` -> `0.1.10` | `0.2.0` |
| `0.2.x` | Stabilization | `0.2.1` -> `0.2.10` | `0.3.0` |
| `0.3.x` | Expansion | `0.3.1` -> `0.3.10` | `0.4.0` |

## Iteration plans

- Detailed plan: `docs/iterations/0.1.md`
- Directional plan: `docs/iterations/0.2.md`
- Directional plan: `docs/iterations/0.3.md`

## Runtime alignment

`skyrim-llm-runtime` is developed in parallel.

- `0.1.x` and `0.2.x`: prepare foundations and constraints only (non-visible integration work).
- `0.3.x`: first visible integration points, optional and low-conflict.

## Documentation ownership

- Player-facing status and usage: `README.md`
- Player-facing release highlights: `CHANGELOG.md`
- Strategic planning: `docs/roadmap.md`
- Iteration planning: `docs/iterations/*.md`
- Milestone execution detail: `docs/execution/<iteration>/<milestone>.md`
- Standalone maintenance notes: `docs/maintenance/*.md`
- Technical release notes: `docs/releases/<version>.md`
- Policy and rationale: `docs/decisions.md`, `docs/generated-outputs-policy.md`
