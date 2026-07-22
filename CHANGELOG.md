# Changelog

Player-facing release highlights for VistulaRim.

Versioning is now simple sequential: `0.1`, `0.2`, `0.3`, ... (entries before `0.1` use the old `0.0.N` numbering).

Each entry uses: `Highlights`, `Compatibility`, `Upgrade Notes`, `Known Issues`.

## [0.0.14] - 2026-03-01

### Highlights
- Baseline install stability improved by cleaning core DLC masters.
- Ubuntu 24.04 maintainer guide added.

### Compatibility
- Skyrim SE + Anniversary Upgrade with full AE CC bundle content.

### Upgrade Notes
- Keep a clean MO2 override for cleaned DLC masters.
- Re-verify game files if base masters were edited outside MO2.

### Known Issues
- None blocking in baseline path.

## [0.0.13] - 2026-03-01

### Highlights
- Optional major content pillar added: Wyrmstooth.

### Compatibility
- Designed as optional layer on top of baseline setup.

### Upgrade Notes
- Validate worldspace transitions and save/load after enabling.

### Known Issues
- Larger content pillars increase patch/testing surface.

## [0.0.12] - 2026-02-28

### Highlights
- Performance-focused update (display/runtime tuning + exterior optimization).
- UI sound polish and NPC baseline improvements.

### Compatibility
- Requires full AE CC bundle alignment with baseline exports.

### Upgrade Notes
- Refresh baseline export files after update.

### Known Issues
- Platform-specific performance variance is expected.

## [0.0.11] - 2026-02-25

### Highlights
- Progression/economy/crafting systems refined.
- Character progression flow and vendor economy made more intentional.

### Compatibility
- Stable with baseline Patch Pack flow.

### Upgrade Notes
- Re-check settings after first launch on existing profiles.

### Known Issues
- Economy balance may vary by personal mod stack additions.

## [0.0.10] - 2026-02-23

### Highlights
- UI/HUD baseline expanded.
- Generated LOD outputs captured in baseline snapshot workflow.

### Compatibility
- Requires matching generated outputs for full distant-visual consistency.

### Upgrade Notes
- Ensure your local generated outputs are enabled in MO2.

### Known Issues
- Missing or stale generated outputs can cause visual regressions.

## [0.0.9] - 2026-02-23

### Highlights
- LOD/world generation workflow formalized.

### Compatibility
- User-generated outputs are still required locally.

### Upgrade Notes
- Follow LOD workflow guide before expecting distant-asset parity.

### Known Issues
- Tool ordering mistakes can break LOD consistency.

## [0.0.8] - 2026-02-22

### Highlights
- Modern visuals baseline established (cross-platform path).

### Compatibility
- ENB is not required for baseline.

### Upgrade Notes
- Keep shader cache local-only and non-distributed.

### Known Issues
- Optional visual stacks may need additional tuning per machine.

## [0.0.7] - 2026-02-22

### Highlights
- Utility/fixes baseline strengthened for crash visibility and stability.

### Compatibility
- Targets Skyrim SE runtime + matching SKSE.

### Upgrade Notes
- Confirm logs and fix plugins initialize correctly after upgrade.

### Known Issues
- CTD root causes can still come from user-added mods outside baseline.

## [0.0.6] - 2026-02-21

### Highlights
- Generated outputs policy and repository guardrails introduced.

### Compatibility
- Patch Pack distribution remains original-files-only.

### Upgrade Notes
- Keep generated artifacts local and untracked.

### Known Issues
- Accidental Overwrite growth remains a common user maintenance issue.

## [0.0.5] - 2026-02-21

### Highlights
- Audio and weather immersion baseline expanded.

### Compatibility
- Built for baseline Patch Pack path.

### Upgrade Notes
- Re-test interior/exterior transitions after enabling.

### Known Issues
- Subjective audio/weather preference differences are expected.

## [0.0.4] - 2026-02-18

### Highlights
- Follower experience expanded (with optional 18+ layer support).

### Compatibility
- Optional module can be disabled without breaking core baseline.

### Upgrade Notes
- Test recruit/dismiss and cross-cell travel before long saves.

### Known Issues
- Optional module quality depends on user-maintained animation stack.

## [0.0.3] - 2026-02-18

### Highlights
- Quest/content expansion step completed.

### Compatibility
- Added content remains baseline-compatible with patching discipline.

### Upgrade Notes
- Perform short content sanity route after update.

### Known Issues
- Additional content always raises conflict surface.

## [0.0.2] - 2026-02-18

### Highlights
- Gameplay identity baseline established (combat/perks/magic/living world).

### Compatibility
- Requires standard foundation stack and baseline conflict checks.

### Upgrade Notes
- Validate combat and progression feel on a fresh test save.

### Known Issues
- Balance tuning may require future iteration adjustments.

## [0.0.1] - 2026-02-18

### Highlights
- Core baseline created (boot/new game stability path).

### Compatibility
- Requires MO2 + SKSE + baseline Skyrim SE setup.

### Upgrade Notes
- Start from clean profile and verify basic boot/play/save loop.

### Known Issues
- None beyond expected early baseline limitations.
