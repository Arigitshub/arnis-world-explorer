# Agent Guide

Use this file before touching the explorer.

## Core Constraints

1. This is not a Minecraft launcher.
2. This does not parse `level.dat` or `.mca`.
3. The browser world is inferred from `arnis_world_map.png`.
4. Local `file:` browser restrictions are a first-class product constraint.

## Load Model

The product must keep all of these paths working:

1. Same-folder auto-load for browsers that allow local asset access
2. Manual PNG file selection
3. Optional metadata JSON file selection
4. Embedded default metadata fallback

Never remove the manual file-picker path.

## Main Files

- `public/index.html` is the app
- `public/arnis_world_map.png` is the sample world image
- `public/metadata.json` is the sample coordinate metadata
- `README.md` is for humans
- `AGENT_NOTES.md` is legacy notes
- `AGENT_GUIDE.md` is the preferred agent entrypoint

## Runtime State

### `DEFAULT_WORLD`

Default dimensions and coordinate bounds for the bundled sample world.

### `LANDMARKS`

Normalized fast-travel points used for HUD chips and minimap orientation.

### `state`

Contains:

- render readiness
- keyboard state
- terrain grid
- sampled image pixels
- selected local files
- active metadata
- current quality preset

### `cam`

Contains:

- `x`, `z`, `y`
- `yaw`, `pitch`
- `fly`

## High-Value Behavior

### Terrain

The scene becomes legibly 3D because `drawTerrain()` renders:

- top faces
- side walls
- boundary faces

If the app starts looking flat again, inspect wall rendering first.

### Enter Flow

The world-entry buttons stay disabled until a map is successfully loaded.

If a user says “I can’t enter the world,” inspect:

- `setReadyUi`
- `loadWorld`
- `startExplorer`

### Navigation

The current app supports:

- WASD movement
- pointer lock look
- fly toggle
- landmark jump chips
- minimap click-to-teleport
- quality presets
- reopenable menu
- fullscreen toggle

## Safe Improvement Order

1. Keep loading resilient
2. Keep state transitions obvious
3. Improve performance
4. Improve fidelity
5. Improve polish

## Things Not To Promise

- real Minecraft execution
- chunk-accurate rendering
- exact building heights from the map image alone
