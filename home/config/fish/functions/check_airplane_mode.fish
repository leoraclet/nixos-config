function check_airplane_mode
    set backup_file ~/.cache/airplane_backup

    set bluetooth_status (rfkill list bluetooth | grep -i -o "Soft blocked: yes")
    set wifi_status (rfkill list wifi | grep -i -o "Soft blocked: yes")
    
    if [ -nz "$wifi_status" ] || [ -nz "$bluetooth_status"]
        echo "{ \"text\":\" 󰀝 \", \"tooltip\": \"airplane-mode <span color='#a6da95'>on</span>\", \"class\": \"on\" }"
    else
        echo "{ \"text\":\" 󰀞 \", \"tooltip\": \"airplane-mode <span color='#ee99a0'>off</span>\", \"class\": \"off\" }"
    end
end
