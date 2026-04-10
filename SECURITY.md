# Security Policy

## Scope

This project is a static browser app.

Relevant issues include:

- malicious asset-loading behavior
- service-worker caching mistakes
- unsafe local file handling assumptions
- dependency or hosting misconfiguration in deployment workflows

## Reporting

For now, report security issues privately to the repository owner instead of opening a public issue with exploit details.

If private contact is unavailable, open a minimal public issue without reproduction details and ask for a private follow-up channel.

## Notes

- This app does not execute Minecraft world files.
- Local `file:` browser restrictions are expected behavior, not a security vulnerability.
- Hosted deployments should be served over `https`.
