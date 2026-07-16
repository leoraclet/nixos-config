-------------------------------------------------------
-- General
-------------------------------------------------------

hl.config({
    general = {
        gaps_in          = 0,
        gaps_out         = 0,
        border_size      = 1,
        resize_on_border = true,
        allow_tearing    = true,


        col    = {
            inactive_border = "rgba(eed49f88)",
            active_border   = "rgb(b8c0e0)"
        },

        snap   = {
            enabled = true,
            window_gap = 30,
        },
        layout = "master"
    },

    decoration = {
        rounding           = 4,
        active_opacity     = 1,
        inactive_opacity   = 1,
        fullscreen_opacity = 1.0,
        shadow             = { enabled = false },

        blur               = {
            enabled = true,
            size = 3,
            passes = 2,
            vibrancy = 0.1696,
        },
        glow = {
            enabled = true,
            range = 3,
            render_power = 3,
        },
        -- motion_blur = {
        --     enabled = true,
        -- },
    },

    input = {
        kb_layout                   = "fr",
        kb_variant                  = "",
        kb_options                  = "grp:alt_shift_toggle,fkeys:basic_13-24",
        follow_mouse                = 1,
        float_switch_override_focus = 0,
        focus_on_close              = 2,
        numlock_by_default          = true,
        sensitivity                 = 0,

        touchpad                    = {
            clickfinger_behavior = true,
            natural_scroll       = true,
            disable_while_typing = false
        }
    },

    group = {
        merge_floated_into_tiled_on_groupbar = true,
        groupbar = {
            gradients = true,
        },
    },

    -------------------------------------------------------
    -- Mics
    -------------------------------------------------------

    misc = {
        force_default_wallpaper         = 0,
        disable_hyprland_logo           = true,
        on_focus_under_fullscreen       = 2,
        focus_on_activate               = true,
        background_color                = "0x24273a",
        disable_splash_rendering        = true,
        disable_scale_notification      = true,
        close_special_on_empty          = true,
        middle_click_paste              = true,
        mouse_move_enables_dpms         = true,
        key_press_enables_dpms          = true,
        disable_hyprland_guiutils_check = true,
        disable_xdg_env_checks          = true,
    },

    xwayland = {
        force_zero_scaling  = true,
        create_abstract_socket = true
    },

    cursor = {
        hide_on_key_press = true,
        hide_on_tablet = true,
        no_break_fs_vrr   = 1,
        no_warps          = true,
        zoom_rigid        = true,
        zoom_detached_camera = false,
        zoom_disable_aa = false,
    },

    ecosystem = {
        no_update_news      = true,
        no_donation_nag     = true,
        enforce_permissions = false
    },

    render = {
        new_render_scheduling = true,
    },

    -------------------------------------------------------
    -- Layouts
    -------------------------------------------------------

    scrolling = {
        fullscreen_on_one_column = true,
        focus_fit_method         = 1,
        column_width             = 0.5,
        direction                = "right",
        follow_min_visible       = 0.0,
        follow_focus             = true,
    },
    dwindle = {
        preserve_split     = true,
        smart_split        = true,
        precise_mouse_move = true
    },

    master = {
        new_status = "master"
    },
})
