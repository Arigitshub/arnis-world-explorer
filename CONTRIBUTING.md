# Contributing

Thanks for contributing.

## Scope

This project is a browser-based explorer for Arnis-generated map exports. Good contributions include:

- renderer improvements
- loading and fallback improvements
- accessibility and UX fixes
- performance tuning
- documentation
- mobile and touch support

## Workflow

1. Fork the repository
2. Create a branch for your change
3. Keep changes focused
4. Test the viewer in direct `file:` mode and in a local HTTP server
5. Open a pull request with before/after notes

## Expectations

- Preserve the manual file-loader fallback
- Do not claim the project launches real Minecraft
- Keep the project static and easy to host on GitHub Pages unless there is a strong reason not to
- Document behavioral changes in `README.md` and `AGENT_NOTES.md` when relevant

## Testing Checklist

- `public/index.html` opens directly from disk
- manual PNG loading works
- optional metadata loading works
- pointer lock failure does not break the page
- the UI remains usable on narrower screens

