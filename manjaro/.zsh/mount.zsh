# mounting
# functions for easy [un]mounting

# usage:
# $ lsblk
# to find out what to mount
# strip the sd, eg sdb1 -> b1
# $ mo b1
# or
# $ mo b1 usb
# usb means /media/usb as mount point
# $ umo usb

function mo() {
  # pass volume, eg. b1 for /dev/sdb1
  # and optionally the mount point, eg. usb for /media/usb
  if [ -z $1 ]; then
    echo "Please supply the volume to be mounted ('b1' for /dev/sdb1)."
  elif [ -z $2 ]; then
    sudo mount -o nonempty "/dev/sd"$1 /media/usb;
    cd /media/usb;
  else
    sudo mount -o nonempty "/dev/sd"$1 "/media/"$2;
    cd "/media/"$2;
  fi
}

function umo() {
  # pass mount point, eg. usb for /media/usb
  if [ -z $1 ]; then
    sudo umount /media/usb;
  else
    sudo umount "/media/"$1;
  fi
}


