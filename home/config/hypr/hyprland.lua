-------------------------------------------------------
-- Hyperland Lua Configuration
-------------------------------------------------------

require("animations")
require("binds")
require("options")
require("gestures")
require("env")
require("monitors")
require("rules")
require("events")

hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia -d")                            -- Noctalia shell (v5)
    hl.exec_cmd("noctalia-shell")                         -- Noctalia shell (v4)
    hl.exec_cmd("snappy-switcher --daemon")               -- Snappy switcher daemon
    hl.exec_cmd("modprobe rtsx_pci")                      -- SD Card reader fix (DELL Latitude 5520)
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24") -- Apply cursor theme (just in case)

    -- DBus environment
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
