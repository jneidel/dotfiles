#!/usr/bin/zsh
# run system update

# Sync:
#   -Sy upate dbs
#   -Syy force update dbs
#   -Su upgrade pkgs
#   -Sc clear old pkg cache
# Remove:
#   -Rs remove with dependencies
#   -Rn remove with system files
# Info:
#   -Q list all installed programms
#   -Qe list non-dependency programms (directly installed)
#   -Qn list pacman programms
#   -Qm list AUR programms
#   -Qdt list unused dependecies
# Args:
#   -q omit version number

echo ":: updating system..."

if [[ $+commands[packer-aur] ]]; then
  packer-aur --noconfirm --noedit -Syyuu;
else
  sudo pacman -Syyuu;
fi

echo ":: updating global npm packages..."
sudo npm -g -s upgrade

echo ":: update complete..."

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
#while [ 1 ]
#do
#  orphanage
#done

exit

