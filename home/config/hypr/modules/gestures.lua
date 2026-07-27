-------------------------------------------------------
-- Gestures
-------------------------------------------------------

hl.gesture({ fingers = 3, direction = "vertical", action = "workspace", disable_inhibit = true, scale = 1.0 })
hl.gesture({ fingers = 3, direction = "horizontal", action = "scroll_move", disable_inhibit = true, scale = 3.0 })
hl.gesture({ fingers = 4, direction = "horizontal", action = "special", workspace_name = "btop", disable_inhibit = true })
hl.gesture({ fingers = 4, direction = "vertical", action = "special", workspace_name = "btop", disable_inhibit = true })
hl.gesture({ fingers = 2, direction = "pinch", mods = "CTRL", action = "cursor_zoom", zoom_level = 1, mode = "live", disable_inhibit = true })

hl.config({
    gestures = {
        workspace_swipe_distance           = 100,
        workspace_swipe_touch              = true,
        workspace_swipe_create_new         = true,
        workspace_swipe_min_speed_to_force = 1,
        workspace_swipe_cancel_ratio       = 0.2
    },
})
