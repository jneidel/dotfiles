ZSH=~/.zsh;

for i in $(ls $ZSH)
  do
    if [[ $i != "init.zsh" ]]; then
      source $ZSH/$i
    fi
done

