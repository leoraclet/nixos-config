function kalilinux
    set current_dir "$(pwd)"
    set dir "$(find ~/Data/VM -name "kalilinux" -type d)"
    cd "$dir"
    quickemu --vm kali-kali-weekly.conf --fullscreen --keyboard_layout fr-fr --public-dir ~/ --display spice --extra_args -enable-kvm
    cd "$current_dir"
end
