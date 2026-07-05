-------------------------------------------------------
-- Binds
-------------------------------------------------------

hl.config({
    binds = {
        allow_workspace_cycles = true
    },
})

local function layout_bind(bind_table)
    return function()
        local workspace = hl.get_active_special_workspace() or
            hl.get_active_workspace()

        if not workspace then
            return
        end

        local layout = workspace.tiled_layout

        if bind_table[layout] then
            hl.dispatch(bind_table[layout])
        end
    end
end

-------------------------------------------------------
-- Apps and basic keybindings
-------------------------------------------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local ipc = "noctalia-shell ipc call"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty ~/Downloads"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("kitty zellij"))
hl.bind(mainMod .. " + Delete", hl.dsp.window.kill())
hl.bind(mainMod .. " + Backspace", hl.dsp.window.kill())
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(ipc .. " sessionMenu toggle"))
hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd(ipc .. " launcher toggle"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + W", hl.dsp.window.float())
hl.bind(mainMod .. " + P", hl.dsp.window.pin())
hl.bind(mainMod .. " + P", hl.dsp.layout("promote"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("pkill nemo || nemo"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("pkill subl || subl"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("pkill btop || kitty btop"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(ipc .. " plugin:screen-toolkit colorPicker"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(ipc .. " launcher emoji"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(ipc .. " darkMode toggle"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(ipc .. " nightLight toggle"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(ipc .. " launcher clipboard"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(ipc .. " launcher windows"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(ipc .. " launcher toggle"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(ipc .. " lockScreen lock"))

hl.bind("ALT + L", hl.dsp.exec_cmd(ipc .. " lockScreen lock"))
hl.bind("ALT + Return", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("ALT + F4", hl.dsp.window.kill())

-------------------------------------------------------
-- Utils
-------------------------------------------------------

-- Zoom
require("utils.zoom")
-- Layout toggle
require("utils.layout-toggle")

-------------------------------------------------------
-- ALT+TAB behaviour
-------------------------------------------------------

hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("snappy-switcher next --mod super --workspace "))
hl.bind("ALT + Tab", hl.dsp.exec_cmd("snappy-switcher next --mod alt"))

-- To switch between windows in a floating workspace:
hl.bind("ALT + A", hl.dsp.window.bring_to_top())
hl.bind("ALT + A", layout_bind({
    monocle   = hl.dsp.window.cycle_next({ tiled = true }),
    scrolling = hl.dsp.window.cycle_next(),
}))

-------------------------------------------------------
-- Screenshot
-------------------------------------------------------

hl.bind("Print", hl.dsp.exec_cmd("flameshot gui -c"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("flameshot gui -c -s"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("flameshot screen -c"))

-------------------------------------------------------
-- Media keys
-------------------------------------------------------

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume increase"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume muteOutput"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(ipc .. " volume muteInput"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness decrease"), { locked = true, repeating = true })

hl.bind("XF86PowerOff", hl.dsp.exec_cmd(ipc .. " sessionMenu toggle"), { locked = true })
hl.bind("XF86Sleep", hl.dsp.exec_cmd(ipc .. " sessionMenu toggle"), { locked = true })
hl.bind("XF86Standby", hl.dsp.exec_cmd(ipc .. " sessionMenu toggle"), { locked = true })
hl.bind("XF86Calculator", hl.dsp.exec_cmd("pkill qalculate-gtk || qalculate-gtk"), { locked = true })
hl.bind("XF86Search", hl.dsp.exec_cmd(ipc .. " launcher toggle"), { locked = true })

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprctl dispatch dpms off"), { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl dispatch dpms on"), { locked = true })

-------------------------------------------------------
-- Windows
-------------------------------------------------------

hl.bind("SUPER + S", function()
    if hl.get_workspace("special:minimized") then
        hl.dispatch(hl.dsp.window.move({ workspace = hl.get_active_workspace(), window = "tag:minimized" }))
        hl.dispatch(hl.dsp.window.clear_tags({ window = "tag:minimized" }))
    else
        hl.dispatch(hl.dsp.window.tag({ tag = "minimized", window = hl.get_active_window() }))
        hl.dispatch(hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
    end
end)

-------------------------------------------------------
-- Scrolling layout
-------------------------------------------------------

hl.bind(mainMod .. " + comma", hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + Semicolon", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + SHIFT + Semicolon", hl.dsp.layout("move -col"))

hl.bind("SHIFT + KP_ADD", hl.dsp.layout("colresize +conf"))
hl.bind("SHIFT + KP_SUBTRACT", hl.dsp.layout("colresize -conf"))

-------------------------------------------------------
-- Mouse
-------------------------------------------------------

hl.bind("ALT + mouse:272", hl.dsp.window.drag(), { mouse = true })   -- ALT + LMB: Move a window
hl.bind("ALT + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- ALT + RMB: Resize a window

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + CTRL", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + ALT_L", hl.dsp.window.resize(), { mouse = true })

-------------------------------------------------------
-- Focus
-------------------------------------------------------

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", layout_bind({
    scrolling = hl.dsp.layout("focus l"),
    dwindle = hl.dsp.focus({ direction = "left" }),
    master = hl.dsp.focus({ direction = "left" }),
    monocle = hl.dsp.focus({ direction = "left" }),
}))
hl.bind(mainMod .. " + right", layout_bind({
    scrolling = hl.dsp.layout("focus r"),
    dwindle = hl.dsp.focus({ direction = "right" }),
    master = hl.dsp.focus({ direction = "right" }),
    monocle = hl.dsp.focus({ direction = "right" }),
}))
hl.bind(mainMod .. " + up", layout_bind({
    scrolling = hl.dsp.layout("focus u"),
    dwindle = hl.dsp.focus({ direction = "up" }),
    master = hl.dsp.focus({ direction = "up" }),
    monocle = hl.dsp.focus({ direction = "up" }),
}))
hl.bind(mainMod .. " + down", layout_bind({
    scrolling = hl.dsp.layout("focus d"),
    dwindle = hl.dsp.focus({ direction = "down" }),
    master = hl.dsp.focus({ direction = "down" }),
    monocle = hl.dsp.focus({ direction = "down" }),
}))

hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })

-------------------------------------------------------
-- Workspaces
-------------------------------------------------------

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + CTRL + left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + up", hl.dsp.focus({ workspace = "r+10" }))
hl.bind(mainMod .. " + CTRL + down", hl.dsp.focus({ workspace = "r-10" }))

hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("btop"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:btop" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]

local keypad_keys = {
    "KP_End", "KP_Down", "KP_Next", "KP_Left", "KP_Begin",
    "KP_Right", "KP_Home", "KP_Up", "KP_Prior", "KP_Insert",
}
local number_keys = {
    "ampersand", "eacute", "quotedbl", "apostrophe", "parenleft",
    "minus", "egrave", "underscore", "ccedilla", "agrave",
}

-- Using numpad keys
for i = 1, #keypad_keys do
    hl.bind(mainMod .. " + " .. keypad_keys[i], hl.dsp.focus({ workspace = i }), { dont_inhibit = true })
    hl.bind(mainMod .. " + SHIFT + " .. keypad_keys[i], hl.dsp.window.move({ workspace = i }), { dont_inhibit = true })
    hl.bind(mainMod .. " + ALT + " .. keypad_keys[i], hl.dsp.focus({ workspace = i + 10 }), { dont_inhibit = true })
    hl.bind(mainMod .. " + CTRL + " .. keypad_keys[i], hl.dsp.window.move({ workspace = i + 10 }),
        { dont_inhibit = true })
end

-- Using numbers on AZERTY French keyboard layout
for i = 1, #number_keys do
    hl.bind(mainMod .. " + " .. number_keys[i], hl.dsp.focus({ workspace = i }), { dont_inhibit = true })
    hl.bind(mainMod .. " + SHIFT + " .. number_keys[i], hl.dsp.window.move({ workspace = i }), { dont_inhibit = true })
    hl.bind(mainMod .. " + ALT + " .. number_keys[i], hl.dsp.focus({ workspace = i + 10 }), { dont_inhibit = true })
    hl.bind(mainMod .. " + CTRL + " .. number_keys[i], hl.dsp.window.move({ workspace = i + 10 }),
        { dont_inhibit = true })
end

-- Using numbers on default keyboard layout
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { dont_inhibit = true })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { dont_inhibit = true })
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.focus({ workspace = i + 10 }), { dont_inhibit = true })
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i + 10 }), { dont_inhibit = true })
end
