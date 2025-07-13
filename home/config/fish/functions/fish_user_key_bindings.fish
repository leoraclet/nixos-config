function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert

    # Nullify fzf default keybindings
    bind \cT '' -M insert
    bind \cR '' -M insert

    bind \e\cr fzf-history-widget -M insert
    bind \e\cf fzf-file-preview-widget -M insert
    bind \e\cd fzf-cd-preview-widget -M insert
    bind \e\cp fzf-ps-widget -M insert
    bind \e\ce fzf-path-preview-widget -M insert

    bind \e\co recent_directories -M insert
    bind \e\cy yazi_cd_quit -M insert

    bind \ea aichat_fish -M insert

    bind down _atuin_search -M insert
end
