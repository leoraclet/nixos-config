function rainbow-border
    hyprctl keyword general:col.active_border $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) 270deg
end

function random_hex
    set random_hex "0xff$(openssl rand -hex 3)"
    echo $random_hex
end
