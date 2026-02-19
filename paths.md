# Paths (active)

This is the single source of truth for paths referenced by this repo. Other docs should link here instead of repeating paths.

## Local machine paths (maintainers)

- VistulaRim workspace: `E:\Modding\VistulaRim`
- Wabbajack: `E:\Modding\Webbajack`
- Downloads: `E:\Modding\downloads\VistulaRim`
- Elysium reference: `E:\Modding\ElysiumRemastered_Upstream`

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
