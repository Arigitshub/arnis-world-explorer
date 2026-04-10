# Project State

This file is the fastest way to recover context without reading commit history.

## Current Status

- Repo: `https://github.com/Arigitshub/arnis-world-explorer`
- Primary live site: `https://arigitshub.github.io/arnis-world-explorer/`
- Backup live site: `https://arnis-world-explorer-20260410.surge.sh`
- Default branch: `main`
- GitHub Pages source: `main:/docs`

## What Exists

- Browser-based first-person explorer for an Arnis map image
- Manual PNG loader and optional metadata JSON loader
- Same-folder auto-load when browser policy allows it
- Terrain inference from `arnis_world_map.png`
- Landmark jump chips
- Minimap click-to-teleport
- Quality presets
- Fullscreen support
- Touch controls and touch look pad
- Manifest and service worker for hosted installs

## Canonical Files

- App source: `public/index.html`
- Pages publish mirror: `docs/index.html`
- Main human docs: `README.md`
- Deployment details: `DEPLOYMENT.md`
- Agent handoff: `AGENT_GUIDE.md`
- Security/reporting: `SECURITY.md`
- Local launcher: `launch-local.ps1`

## Deployment Rules

1. Edit `public/` first.
2. Mirror `public/` into `docs/` before relying on GitHub Pages.
3. Push `main`.
4. Keep GitHub Pages set to `main:/docs`.
5. If Pages has trouble, Surge remains the fallback.

## Local Run Rules

Preferred:

```powershell
.\launch-local.ps1
```

Fallback:

```powershell
cd D:\arnis-world-explorer\public
python -m http.server 8080
```

Avoid relying on direct `file:` open unless necessary, because browser local-origin restrictions are part of the product constraints.

## Constraints That Must Stay True

- Do not claim this is a real Minecraft launcher.
- Do not claim it parses `level.dat` or `.mca`.
- Do not remove the manual file picker path.
- Do not assume `fetch()` from local `file:` origins will work.
- Do not change Pages back to workflow-only publishing unless there is a clear reason.

## Likely Next Work

- Better visual fidelity for buildings and skyline extrusion
- Mobile HUD polish
- Landmark labels and richer world metadata
- Performance presets beyond the current terrain density toggle
- Better screenshots and preview assets for the repo landing page

## Recovery Checklist

If someone returns later and needs to verify the project quickly:

1. Confirm `public/index.html` and `docs/index.html` both exist.
2. Confirm GitHub Pages still points to `main:/docs`.
3. Open the live Pages URL.
4. Open the local launcher script.
5. Read `AGENT_GUIDE.md` before changing renderer or loader behavior.
