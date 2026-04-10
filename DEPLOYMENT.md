# Deployment

## Current Situation

The repo is configured for GitHub Pages through Actions, but GitHub reported that the account is locked due to a billing issue, so workflow-based deployment cannot start until that account issue is resolved.

## Hosting Options

### GitHub Pages

Use this when the account billing issue is fixed.

- Repository already contains `.github/workflows/deploy-pages.yml`
- Site root is `public/`
- Homepage should be `https://arigitshub.github.io/arnis-world-explorer/`

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
