function quickvm -d "Start a QuickEMU VM from anywhere"
  set vm_name $argv[1]

  # Set the user
  if test $argv[2]
    set user $argv[2]
  else
    set user YOUR_USER_HERE
  end

  cd ~/Data/VM/quickvm/

  quickemu --vm $vm_name.conf --display none; ssh-keygen -R [localhost]:22220; ssh $user@localhost -p 22220; cat $vm_name/$vm_name.pid | xargs kill

  cd -
end
