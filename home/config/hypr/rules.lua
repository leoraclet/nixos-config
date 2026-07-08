-------------------------------------------------------
-- Window rules
-------------------------------------------------------

-- Centering al floating windows
hl.window_rule({ match = { float = true }, center = true })

-- Disable blur for xwayland context menus
hl.window_rule({ match = { class = "^()$", title = "^()$" }, no_blur = true })

-- Disable blur for every window
hl.window_rule({ match = { class = ".*" }, no_blur = true })

-- Floating
hl.window_rule({ match = { class = "^(qalculate-gtk)$" }, center = true, float = true, size = { "(monitor_w*0.45)", "(monitor_w*0.45)" } })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, center = true, float = true, size = { "(monitor_w*0.45)", "(monitor_w*0.45)" } })
hl.window_rule({ match = { class = "^(pavucontrol)$" }, center = true, float = true, size = { "(monitor_w*0.45)", "(monitor_w*0.45)" } })
hl.window_rule({ match = { class = "^(com.saivert.pwvucontrol)$" }, center = true, float = true, size = { "(monitor_w*0.45)", "(monitor_w*0.45)" } })
hl.window_rule({ match = { title = "^(nm-connection-editor)$" }, center = true, float = true, size = { "(monitor_w*0.45)", "(monitor_w*0.45)" } })
hl.window_rule({ match = { title = "^(.blueman-manager-wrapped)$" }, center = true, float = true, size = { "(monitor_w*0.45)", "(monitor_w*0.45)" } })
hl.window_rule({ match = { title = "^(Open File)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Save As)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Select a File)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Open Folder)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(File Upload)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Library)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(.*)(wants to save)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(flamehost)$" }, center = true, float = true })

-- Terminal opacity
hl.window_rule({ match = { class = "kitty" }, opacity = "0.995 0.97" })

-- No shadow for tiled windows
hl.window_rule({ match = { float = 0 }, no_shadow = true })

-- Screen sharing
hl.window_rule({ match = { title = ".*is sharing (a window|your screen).*" }, float = true })
hl.window_rule({ match = { title = ".*is sharing (a window|your screen).*" }, pin = true })
hl.window_rule({ match = { title = ".*is sharing (a window|your screen).*" }, move = { "(monitor_w*.5-window_w*.5)", "(monitor_h-window_h-12)" } })
hl.window_rule({
    match = {
        class = "xwaylandvideobridge"
    },
    no_focus = true,
    no_anim = true,
    no_blur = true,
    max_size = "1 1",
    opacity = 0.0
})

-- App assigned workspaces
hl.window_rule({ match = { class = "brave-browser" }, workspace = 2 })
hl.window_rule({ match = { class = "codium" }, workspace = 3 })
hl.window_rule({ match = { class = "dev.zed.Zed" }, workspace = 3 })
hl.window_rule({ match = { class = "librewolf" }, workspace = 4 })
hl.window_rule({ match = { class = "spotify" }, workspace = 5 })
hl.window_rule({ match = { class = "vesktop" }, workspace = 6 })
hl.window_rule({ match = { class = "sublime_text" }, workspace = 7 })
hl.window_rule({ match = { class = "spicy" }, workspace = 7 })
hl.window_rule({ match = { class = "libreoffice" }, workspace = 8 })
hl.window_rule({ match = { class = "ONLYOFFICE" }, workspace = 8 })
hl.window_rule({ match = { class = "obsidian" }, workspace = 9 })
hl.window_rule({ match = { class = "thunderbird" }, workspace = 10 })
hl.window_rule({ match = { title = "btop" }, workspace = "special:btop" })


-- ######## Layer rules ########
hl.layer_rule({ match = { namespace = "hyprpicker" }, no_anim = true })
hl.layer_rule({ match = { namespace = "noctalia-background-.*$" }, ignore_alpha = 0.2, blur = true, blur_popups = true })
hl.layer_rule({
    name = "noctalia",
    match = {
        namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
    },
    no_anim = true,
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true,
})

-------------------------------------------------------
-- Workspace Rules
-------------------------------------------------------

hl.workspace_rule({ workspace = 20, monitor = "HDMI-A-1", default = true, })
hl.workspace_rule({ workspace = 20, monitor = "HDMI-A-2", default = true, })
hl.workspace_rule({ workspace = 20, monitor = "DP-2", default = true, })

-------------------------------------------------------
-- Default workspaces
-------------------------------------------------------

local apps = {
    [1] = "kitty",
    [2] = "brave",
    [3] = "zeditor",
}

hl.workspace_rule({ workspace = "special:btop", layout = "scrolling", on_created_empty = "kitty btop", gaps_out = 30 })
hl.workspace_rule({ workspace = 20, monitor = "" })

for i = 1, 9 do
    hl.workspace_rule({ workspace = i, layout = "scrolling", on_created_empty = apps[i] })
end

for i = 10, 19 do
    hl.workspace_rule({ workspace = i, layout = "dwindle", })
end
