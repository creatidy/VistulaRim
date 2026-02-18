# VistulaRim Patch Pack

VistulaRim is a Skyrim Special Edition project built independently, step by step.

It is inspired by Elysium Remastered as a private reference baseline for ideas and comparisons, but it is not a fork and it never reuses upstream files.

The shipped product is a Patch Pack: original patches and configuration that sit on top of mods you install yourself. A Wabbajack installer is a possible future/optional path, but it is not the current product.

## What this is

Product v1: Patch Pack

A Patch Pack is a small distributable package that contains only original work created for VistulaRim:

- VistulaRim_Patch.esp (and possibly additional VistulaRim plugins)
- Profile specific INIs
- Custom configuration and presets (only if created for VistulaRim)
- Custom branding assets (only if created for VistulaRim)
- Documentation (this README, troubleshooting, changelog)

It does not include:

- Third party mods
- Third party assets
- Large generated outputs that embed third party assets

## Current status

- Milestone 1 complete: stable boot, new game, 5+ minutes playtest, reached open world (out of Helgen).
- Milestone 2 complete: gameplay identity baseline (combat/perks/magic/living world).
- Milestone 3 complete and tested: quest + content module. Note: see `baseline/` exports for the exact modlist delta.
- Milestone 4 in progress (current focus): Followers (general). Serana is the first anchor, but Milestone 4 is not Serana-only.
- Milestone 4 optional module (18+): Adults-only animation framework layer. This is optional, clearly labeled, and does not change the core experience if not installed.

## Requirements (for local development)

- Skyrim Special Edition (Steam recommended)
- Mod Organizer 2
- xEdit (SSEEdit) for conflict inspection and forwardings
- LOOT (sanity checks only)
- SKSE matching your Skyrim runtime

Two MO2 profiles are used:

- VistulaRim - Authoring
- VistulaRim - Playtest

Profile specific INIs must be enabled.

## Paths (maintainers)

See docs/paths.md. Current active paths:

- VistulaRim workspace: `C:\Modding\VistulaRim`
- Wabbajack: `C:\Modding\Webbajack`
- Downloads: `S:\Modding\downloads\VistulaRim`
- Elysium reference: `D:\Modding\ElysiumRemastered_Upstream`

## How to use the Patch Pack (end user model)

1. Install Skyrim SE and set up MO2.
2. Download and install all third party mods yourself from their original sources.
3. Install the VistulaRim Patch Pack as an MO2 mod (it contains only VistulaRim owned files).
4. Enable VistulaRim_Patch.esp and any other VistulaRim plugins included in the Patch Pack.
5. Run LOOT as a sanity check, then launch and playtest.

Note: The Patch Pack may include instructions for any local generation steps later (LOD, BodySlide outputs, etc). Early versions do not redistribute generated outputs.

## Workflow (maintainers)

Rule: Stability is the main KPI. Every change must be testable and reversible.

Iteration loop:

1. Pick 1 goal for the iteration.
2. Add a small batch of mods (prefer 1 to 5).
3. Run LOOT only as a sanity check.
4. Use xEdit to identify conflicts.
5. Resolve conflicts by forwarding into VistulaRim_Patch.esp.
6. Run the playtest checklist.
7. Update docs (CHANGELOG, README, decisions).

Minimum playtest checklist:

- Boot to menu
- Start a new game (or load the clean post-Helgen test save)
- Open inventory, magic menu, map
- Walk outside, engage in 1 combat
- Save, load

## Installed mods (current baseline)

Important: this repo does not redistribute third party mods. The list below is generated from the MO2 exports currently checked into this repo:

- baseline/modlist.txt
- baseline/plugins.txt

TODO: If this repo is meant to store exports under repo/profiles/**, move/copy the current files into that structure and update this section to point at the new location.

Adults-only module note (18+):
- Optional module for mature roleplay and player choice.
- Consent oriented and player controlled.
- Does not change the core experience if not installed.
- No redistribution of adult assets: users download all third party content from original sources.

### Plugins (enabled)
From baseline/plugins.txt:

```
unofficial skyrim special edition patch.esp
Campfire.esm
SkyUI_SE.esp
MCMHelper.esp
AI Overhaul.esp
SeranaDialogAddon.esp
Odin - Skyrim Magic Overhaul.esp
Wintersun - Faiths of Skyrim.esp
Wildcat - Combat of Skyrim.esp
Extended Encounters.esp
Immersive Patrols II.esp
ForgottenCity.esp
Missives.esp
FNIS.esp
RaceMenu.esp
RaceMenuPlugin.esp
XPMSE.esp
SDA Campfire Patch.esp
OStim.esp
ImGladYoureHere.esp
SDA GYH Patch.esp
SDA Wintersun Patch.esp
Vokrii - Minimalistic Perks of Skyrim.esp
Odin - Vokrii Compatibility Patch.esp
VistulaRim_Patch.esp
```

Policy: VistulaRim_Patch.esp loads last.

### MO2 mods (enabled, non-CC)
From baseline/modlist.txt (lines starting with `+`):

```
SDA Patch Hub SE
I'm Glad You're Here - a follower and spouse appreciation mod - SSE
Fuz Ro D-oh - Silent Voice
Serana Dialogue Add-On
The Forgotten City
Missives
VistulaRim - Patch
Wildcat - Combat of Skyrim - Settings Loader
Wintersun - Faiths of Skyrim
Immersive Patrols (Main)
Extended Encounters
AI Overhaul SSE
Odin - Vokrii Compatibility Patch
Odin - Skyrim Magic Overhaul
Vokrii - Minimalistic Perks of Skyrim
Wildcat - Combat of Skyrim
SkyUI
MCM Helper
Spell Perk Item Distributor
powerofthree's Tweaks
Keyword Item Distributor
MergeMapper
VR Address Library for SKSEVR
Address Library for SKSE Plugins
Campfire - Complete Camping System (Supports Skyrim VR)
OStim Standalone - Advanced Adult Animation Framework
Open Animation Replacer
Animation Queue Fix
Paired Animation Improvements
XP32 Maximum Skeleton Special Extended
Fores New Idles in Skyrim SE - FNIS SE
USSEP Nemesis or Pandora Patch
Project New Reign - Nemesis Unlimited Behavior Engine
RaceMenu
Pandora Behaviour Engine Plus
Skyrim Script Extender (SKSE64)
Unofficial Skyrim Special Edition Patch
```

Baseline Creations and DLC (from baseline/modlist.txt, lines starting with `*`):

```
Creation Club: _ResourcePack
Creation Club: ccbgssse001-fish
Creation Club: ccbgssse025-advdsgs
Creation Club: ccbgssse037-curios
Creation Club: ccqdrsse001-survivalmode
DLC: Dawnguard
DLC: Dragonborn
DLC: HearthFires
```


## Legal and permissions

VistulaRim Patch Pack does not redistribute third party mods or assets.
All third party mods must be obtained from their original sources and used under their respective permissions and platform terms.
