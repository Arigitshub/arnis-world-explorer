# Deployment

## Current Situation

The repo is live on GitHub Pages using branch-based publishing from `main:/docs`.

Backup hosting also exists on Surge.

## Hosting Options

### Surge

The site is already published here:

- `https://arnis-world-explorer-20260410.surge.sh`

Example publish command:

```powershell
surge D:\arnis-world-explorer\public arnis-world-explorer-20260410.surge.sh
```

### GitHub Pages

- Published URL: `https://arigitshub.github.io/arnis-world-explorer/`
- Source branch: `main`
- Source folder: `/docs`

### GitHub Pages Without Actions

This repo also contains a `docs/` mirror of the static site.

If Actions are blocked, keep Pages configured as:

- Source branch: `main`
- Folder: `/docs`

This path avoids the Actions workflow entirely.

### Netlify

Use a static site deploy with:

- Publish directory: `public`
- Build command: none

### Cloudflare Pages

Use:

- Framework preset: none
- Build command: none
- Output directory: `public`

### Local Static Server

```powershell
cd D:\arnis-world-explorer\public
python -m http.server 8080
```

Then open `http://localhost:8080`.

## Why Static Hosting Works

The project is entirely static:

- HTML
- CSS
- JavaScript
- PNG and JSON assets

No backend or build pipeline is required.

## PWA Notes

Hosted deployments should also publish:

- `manifest.webmanifest`
- `sw.js`

These enable installable-app behavior and offline caching on `https` origins. They do not run when the app is opened directly from `file:`.
