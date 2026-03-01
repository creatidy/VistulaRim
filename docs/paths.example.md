# Paths (example)

This file documents **example** local paths and the repo-relative locations referenced by the docs.

If you maintain this project, copy this file to `.local/paths.md` and customize it for your machine.
The `.local/` directory is gitignored by design.

## Local machine paths (examples)

- VistulaRim workspace: `D:\Modding\VistulaRim`
- Wabbajack: `D:\Modding\Wabbajack`
- Downloads: `D:\Modding\downloads\VistulaRim`
- Optional private reference baseline: `D:\Modding\ElysiumRemastered_Upstream`

Notes:
- Keep paths stable to make SSD migration easier.
- Prefer moving data + junctions later so logical paths stay unchanged.

## Repo authoritative files (repo-relative)

- Patch Pack content (original work only): `mods/VistulaRim/Patch/`
- Patch plugin (loads last): `mods/VistulaRim/Patch/VistulaRim_Patch.esp`
- Installed mods/plugins snapshot (MO2 exports checked into this repo):
  - `baseline/modlist.txt`
  - `baseline/plugins.txt`
  - `baseline/loadorder.txt`
