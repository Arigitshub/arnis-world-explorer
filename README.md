# Arnis World Explorer

[![Repo](https://img.shields.io/badge/GitHub-Arigitshub%2Farnis--world--explorer-181717?logo=github)](https://github.com/Arigitshub/arnis-world-explorer)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](./LICENSE)
[![Pages](https://img.shields.io/badge/GitHub%20Pages-configured-blue)](https://arigitshub.github.io/arnis-world-explorer/)

Browser-based first-person explorer for an Arnis-generated world.

This project is a polished local viewer for an exported Arnis map image and metadata. It is meant for cases where you have an Arnis-generated world folder but do not want to open it in Minecraft itself.

## Live Links

- Repo: `https://github.com/Arigitshub/arnis-world-explorer`
- Live demo: `https://arnis-world-explorer-20260410.surge.sh`
- Intended Pages URL: `https://arigitshub.github.io/arnis-world-explorer/`

Note: GitHub reported that workflow runs are currently blocked by an account billing issue, so the Pages deploy will not go live until that account issue is resolved.

## What it is

- A standalone HTML explorer
- First-person movement with mouse look
- Manual file loader for local browser security restrictions
- Same-folder auto-load when the browser allows it
- Embedded fallback metadata for the included sample world
- Quality presets for faster or denser terrain rendering
- Landmark jump chips and minimap click-to-teleport
- Reopenable in-app menu and fullscreen toggle
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
- `CONTRIBUTING.md`
- `CODE_OF_CONDUCT.md`
- `PULL_REQUEST_TEMPLATE.md`
- `LICENSE`
- `public/index.html`
- `public/arnis_world_map.png`
- `public/metadata.json`
- `public/icon.png`
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

## GitHub Pages

The repository is set up for GitHub Pages deployment through Actions.

When the repo exists on GitHub:

1. Push the repository to `main`
2. In GitHub settings, set Pages to use GitHub Actions
3. The workflow in `.github/workflows/deploy-pages.yml` will publish the contents of `public/`

The published site entrypoint is `public/index.html`.

If GitHub Actions are unavailable, see `DEPLOYMENT.md` for Netlify, Cloudflare Pages, and local static server options.

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

## Notes For Future Work

Read `AGENT_GUIDE.md` first. `AGENT_NOTES.md` is kept for older context, but `AGENT_GUIDE.md` is the preferred agent entrypoint.

It explains:

- why local file loading fails in some browsers
- how the fallback file picker works
- how terrain is inferred from the top-down image
- which assumptions are embedded for this sample world

## Community

- See `CONTRIBUTING.md` for contribution workflow
- See `CODE_OF_CONDUCT.md` for participation standards
- Use the issue templates for bugs and feature requests
