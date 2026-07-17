hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0
    }
})

hl.window_rule({
    match = { class = "^(sddm-greeter)$" },
    center = true,
    float = true,
    pin = true,
    no_anim = true,
    no_shadow = true,
    no_blur = true,
    no_dim = true,
    decorate = false,
    stay_focused = true,
    rounding = 0,
    border_size = 0
})
