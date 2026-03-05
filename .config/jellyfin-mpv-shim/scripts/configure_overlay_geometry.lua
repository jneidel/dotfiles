-- My mpv.conf defines a the video to act like an overlay in the bottom right corner.
-- Jellyfin-mpv-shim overwrite the geometry and this script overwrites it back.

local function apply_geometry()
    mp.set_property("geometry", "30%-20-20")
end
mp.register_event("file-loaded", apply_geometry)
