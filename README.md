# Arnis World Explorer

[![Repo](https://img.shields.io/badge/GitHub-Arigitshub%2Farnis--world--explorer-181717?logo=github)](https://github.com/Arigitshub/arnis-world-explorer)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](./LICENSE)
[![Pages](https://img.shields.io/badge/GitHub%20Pages-configured-blue)](https://arigitshub.github.io/arnis-world-explorer/)
[![Live Demo](https://img.shields.io/badge/live-surge-0f172a)](https://arnis-world-explorer-20260410.surge.sh)

Browser-based first-person explorer for an Arnis-generated world.

This project is a polished local viewer for an exported Arnis map image and metadata. It is meant for cases where you have an Arnis-generated world folder but do not want to open it in Minecraft itself.

## Live Links

- Repo: `https://github.com/Arigitshub/arnis-world-explorer`
- GitHub Pages: `https://arigitshub.github.io/arnis-world-explorer/`
- Backup live demo: `https://arnis-world-explorer-20260410.surge.sh`

## What it is

- A standalone HTML explorer
- First-person movement with mouse look
- Manual file loader for local browser security restrictions
- Same-folder auto-load when the browser allows it
- Embedded fallback metadata for the included sample world
- Quality presets for faster or denser terrain rendering
- Landmark jump chips and minimap click-to-teleport
- Reopenable in-app menu and fullscreen toggle
- Touch controls for phones and tablets
- Installable static app shell with offline caching on hosted deployments
- Agent-facing notes for future maintenance

## What it is not

- Not a real Minecraft launcher
- Not a parser for `level.dat` or `.mca` files
- Not block-perfect Minecraft rendering

The explorer approximates terrain from `arnis_world_map.png` and uses `metadata.json` for coordinate mapping.

## Project Structure

- `.github/workflows/deploy-pages.yml`
- `.github/ISSUE_TEMPLATE/`
- `DEPLOYMENT.md`
- `PROJECT_STATE.md`
- `ROADMAP.md`
- `CONTRIBUTING.md`
- `CODE_OF_CONDUCT.md`
- `PULL_REQUEST_TEMPLATE.md`
- `SECURITY.md`
- `LICENSE`
- `docs/`
- `public/index.html`
- `public/arnis_world_map.png`
- `public/metadata.json`
- `public/icon.png`
- `public/manifest.webmanifest`
- `public/sw.js`
- `AGENT_GUIDE.md`
- `AGENT_NOTES.md`
- `launch-local.ps1`

## Run Locally

### Fast path

Open `public/index.html` directly in a browser.

If the browser blocks local same-folder loading:

1. Click `Choose Map PNG`
2. Pick `public/arnis_world_map.png`
3. Optionally pick `public/metadata.json`
4. Click `Load Selected Files`
5. Click `Enter Loaded World`

### Optional local server

If you want cleaner browser behavior, serve the `public` folder with any static server.

Example with Python:

```powershell
cd D:\arnis-world-explorer\public
python -m http.server 8080
```

Then open `http://localhost:8080`.

### Local launcher script

Run:

```powershell
.\launch-local.ps1
```

If Python is available, the script starts a local static server on `http://localhost:8080` and opens the browser there. If Python is missing, it falls back to opening the HTML file directly.

## GitHub Pages

The repository now publishes through branch-based GitHub Pages from `main:/docs`.

The repo still contains a workflow for Actions-based publishing, but the reliable fallback is the `/docs` mirror of the static app.

When the repo exists on GitHub:

1. Push the repository to `main`
2. Keep Pages source set to `main` and `/docs`
3. GitHub will publish the site from `docs/index.html`

If Pages ever needs an alternate host, see `DEPLOYMENT.md` for Surge, Netlify, Cloudflare Pages, and local static server options.

## Controls

- `W A S D`: move
- Mouse: look around after pointer lock
- `Shift`: sprint
- `F`: toggle fly mode
- `Space` / `Ctrl`: rise and fall in fly mode
- `R`: reset camera
- `Esc`: reopen the menu
- Minimap click: teleport
- Landmark chips: jump to preset locations
- Touch buttons: move, run, rise, fall
- Touch look pad: drag to rotate camera

## PWA Behavior

On hosted deployments over `https`, the app registers a service worker and can be installed like a lightweight app shell.

- Manifest: `public/manifest.webmanifest`
- Offline cache: `public/sw.js`

Direct `file:` use still works, but service workers are intentionally skipped there because browsers do not allow them for local file origins.

## Notes For Future Work

Read `AGENT_GUIDE.md` first. `AGENT_NOTES.md` is kept for older context, but `AGENT_GUIDE.md` is the preferred agent entrypoint.

It explains:

- why local file loading fails in some browsers
- how the fallback file picker works
- how terrain is inferred from the top-down image
- which assumptions are embedded for this sample world

For durable project continuity:

- read `PROJECT_STATE.md` for the current live setup and recovery checklist
- read `ROADMAP.md` for the next likely improvements

## Community

- See `CONTRIBUTING.md` for contribution workflow
- See `CODE_OF_CONDUCT.md` for participation standards
- See `SECURITY.md` for security reporting guidance
- Use the issue templates for bugs and feature requests
