# Arnis World Browser Explorer

## Purpose

This viewer is a standalone HTML explorer for an Arnis-generated world folder. It is designed to survive the main local-file failure mode:

- browsers sometimes refuse local `fetch("metadata.json")`
- users may open the HTML file directly from disk
- agents need a manual fallback that does not require a server

The viewer therefore supports:

1. Auto-loading `arnis_world_map.png` from the same folder
2. Best-effort auto-loading `metadata.json`
3. Manual PNG loading through a file picker
4. Manual metadata loading through a file picker
5. Embedded default metadata for the known `Arnis World 2` folder

## Files

- `play-map-deluxe.html`
- `arnis_world_map.png`
- `metadata.json`

The HTML file should live in the same folder as the PNG for the auto-load path to work.

## Runtime Model

The renderer is not Minecraft and does not parse `level.dat` or `.mca`.

Instead it:

1. Loads the world image into an offscreen canvas
2. Samples colors into a lower-resolution terrain grid
3. Infers terrain height from image luminance and color bias
4. Smooths the grid once
5. Renders a first-person voxel-style surface plus visible vertical walls

This is why the result is a browser explorer, not an actual Minecraft launcher.

## Main State Objects

### `DEFAULT_WORLD`

Contains default metadata values for this world:

- image path
- image width and height
- Minecraft bounds
- geographic bounds

### `state`

Holds runtime state:

- `started`
- `ready`
- `keys`
- `terrain`
- `gw`, `gh`
- `sx`, `sz`
- `pix`
- `imageUrl`
- `meta`
- `pickedMap`
- `pickedMeta`

### `cam`

Camera state:

- `x`, `z`
- `y`
- `yaw`, `pitch`
- `fly`

## Loading Flow

### Auto path

`tryAuto()`:

1. Starts from embedded metadata
2. Tries to `fetch("metadata.json")`
3. Falls back silently if fetch is blocked
4. Loads `arnis_world_map.png`

### Manual path

The menu allows:

1. picking a PNG
2. optionally picking a JSON metadata file
3. loading both through `URL.createObjectURL()` and `File.text()`

This avoids local-origin fetch restrictions.

## Key Functions

### `loadWorld(mapUrl, meta)`

Responsible for:

- loading the image
- syncing metadata width/height to actual image size
- extracting image pixels
- updating the blurred background
- building terrain
- marking the viewer ready

### `buildTerrain()`

Creates the terrain grid and smooths it.

### `drawTerrain()`

Renders:

- top faces
- east-facing walls
- south-facing walls
- boundary faces on the outer edge

These wall faces are the main fix for the “looks 2D” complaint.

### `startExplorer()`

Hides the menu, sets `started`, and requests pointer lock if available.

## Known Constraints

1. The viewer does not launch Minecraft.
2. The viewer does not parse real Minecraft chunk data.
3. Terrain is inferred from the top-down map image, so buildings and elevation are approximations.
4. Local browser behavior varies by browser and security settings.

## Recommended Agent Changes

If another agent needs to improve the viewer, use this order:

1. Protect the loading path first
2. Keep manual file loading working
3. Preserve same-folder auto-load behavior
4. Improve renderer fidelity second
5. Do not promise real Minecraft launch support from HTML

## Safe Extension Ideas

1. Add landmark bookmarks
2. Add click-to-teleport on minimap
3. Add quality presets for terrain resolution
4. Add optional building extrusion heuristics
5. Add touch controls for mobile
