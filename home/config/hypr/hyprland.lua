-------------------------------------------------------
-- Hyperland Lua Configuration
-------------------------------------------------------

-- Get hostname from envvars or something
local handle = io.popen("hostname")
Hostname = "unknown" -- Default fallback

-- If there is a hostname at all
if handle then
    local result = handle:read("*l") -- Read the first line
    handle:close()
    if result then
        Hostname = result:gsub("%s+", "") -- Remove whitespace/newlines
    end
end

require("modules.animations")
require("modules.binds")
require("modules.options")
require("modules.gestures")
require("modules.env")
require("modules.monitors")
require("modules.rules")
require("modules.events")
require("modules.devices")

hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia -d")                            -- Noctalia shell (v5)
    hl.exec_cmd("noctalia-shell")                         -- Noctalia shell (v4)
    hl.exec_cmd("snappy-switcher --daemon")               -- Snappy switcher daemon
    hl.exec_cmd("modprobe rtsx_pci")                      -- SD Card reader fix (DELL Latitude 5520)
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24") -- Apply cursor theme (just in case)
    hl.exec_cmd("mpris-proxy")                            -- mpris-proxy

    -- DBus environment
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
