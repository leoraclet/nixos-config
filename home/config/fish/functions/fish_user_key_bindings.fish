function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert

    # Nullify fzf default keybindings
    bind \cR '' -M insert
    bind \cT '' -M insert

    bind \e\ch fzf-history-widget -M insert
    bind \e\cd fzf-cd-preview-widget -M insert
    bind \e\cp fzf-ps-widget -M insert
    bind \e\cr recent_directories -M insert
    bind \e\cy yazi_cd_quit -M insert
    bind \cl clear -M insert
    bind \cf fzf-file-preview-widget -M insert

    bind down _atuin_search -M insert

    fzf_configure_bindings --git_status=\cg --processes=\cp --history=\ch --directory=\cd --variables=
end
