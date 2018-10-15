#!/usr/bin/zsh
# run system update

echo ":: updating system..."

if (( $+commands[packer-aur] )) ; then
  packer-aur -Syu;
else
  sudo pacman -Syu;
fi

echo " "
echo ":: update complete..."
echo " "
sleep 2s

# function to check for and remove orphan packages
function orphanage {
  echo ":: checking if orphan packages exist on the system..."
  ORPHANS=`pacman -Qqdt`
  if [ -z "$ORPHANS" ]
  then
      echo ":: system is clean, will exit..."
      sleep 3s
      exit
  else
    echo -e ":: orphans found on the system.\n$ORPHANS\n\n:: Removing..."
    sudo pacman -R --nosave $ORPHANS
  fi
}

# infinite loop to find and remove orphan packages
# script exits when none found
while [ 1 ]
do
  orphanage
done

# choose echo error message or zenity error message
echo ":: ** update script did not exit normally!"
exit
