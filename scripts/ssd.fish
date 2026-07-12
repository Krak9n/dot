#!/usr/bin/env fish

set operation $argv[1]
if test (count $argv) -lt 1
    echo "Usage: ssd <Option>"
    echo "Options:"
    echo "-mount    mounts the ssd detected under /dev/sd something"
    echo "-umount   unmounts the very same ssd detected previosly"
    exit 1
end

# detect the name of ssd  
set SSD $(echo -e $0 | ls /dev/sd*1)
if test $status -eq 0 
    if string match -q "-mount" $operation
        mounting $SSD
    else if string match -q "-umount" $operation
        umounting
    end
else if mount | grep /mnt > /dev/null
    echo "/mnt is already mounted"
    read --prompt "echo 'unmounting? (Yes/No)' " confirm
    test "$confirm" == "Yes"; and umounting 
end

function mounting -d "Mounts the ssd found under the SSD variable" -a ssd_to_mount
    sudo mount $ssd_to_mount /mnt
    if test $status -eq 0
        echo "$ssd_to_mount is mounted!"
    else 
        echo "$ssd_to_mount has failed"
    end
end

function umounting -d "Unmount the ssd" 
    sudo umount /mnt
end
