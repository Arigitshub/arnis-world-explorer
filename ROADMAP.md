# Roadmap

This file lists the most plausible next steps in priority order.

## Highest Value

### 1. Visual Fidelity

Current terrain is inferred from a top-down image. The biggest quality improvement would be stronger building heuristics:

- detect dense urban blocks
- extrude likely buildings more aggressively
- distinguish water, roads, parks, and rooftops more clearly

### 2. Repo Presentation

The repo is functional, but it still needs stronger presentation assets:

- screenshots
- a short animated preview
- a cleaner social preview image

### 3. Mobile UX

Touch support exists, but it is still version-one:

- resize and reposition controls
- add sensitivity settings
- improve touch look damping
- refine HUD overlap on small screens

## Medium Value

### 4. Better Metadata

If richer metadata becomes available, use it for:

- named landmarks
- bounding-box presets
- stronger coordinate displays
- more accurate teleport targets

### 5. Performance Modes

Current quality presets only change terrain density. More complete modes could also change:

- fog strength
- wall rendering density
- minimap refresh cadence
- internal render resolution

## Low Value

### 6. Workflow Cleanup

The repo still contains a GitHub Actions Pages workflow even though branch-based Pages is the working path. This is acceptable, but it can be removed later if it becomes confusing.

### 7. Legacy Notes Consolidation

`AGENT_NOTES.md` is still present for historical context. It can eventually be archived or merged once there is no need to preserve earlier iteration notes.
