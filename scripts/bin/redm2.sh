#!/usr/bin/bash

decrypted="$(lsblk -l -o NAME,FSTYPE,MOUNTPOINT | grep 'redm2')"
mountpoint="$(echo $decrypted | awk '{print $3}')"
device="$(lsblk -l -o NAME,FSTYPE | grep 'crypto_LUKS' | awk '{print $1}')"
if [[ -n $decrypted ]]; then
    echo $decrypted
    sudo umount $mountpoint && sudo cryptsetup luksClose redm2
    echo "$device unmounted and encrypted"
else
    sudo cryptsetup luksOpen /dev/$device redm2 && sudo mount /dev/mapper/redm2 /media/red
    #echo "sudo cryptsetup luksOpen /dev/$device redm2 && sudo mount /dev/mapper/redm2 /media/red"
    echo "$device decrypted and mounted"
fi

