postde() {
  if [ -z "$1" ]; then
    echo "Missing the post title"
    return 1
  fi
  file="$(echo "$@.md" | tr ' ' -)"

  cd ~/code/blog
  hugo new content "$file"
  mv "content/en/$file" content/de/blog/
  $EDITOR "content/de/blog/$file"
}
posten() {
  if [ -z "$1" ]; then
    echo "Missing the post title"
    return 1
  fi
  file="$(echo "$@.md" | tr ' ' -)"

  cd ~/code/blog
  hugo new content "blog/$file"
  $EDITOR "content/en/blog/$file"
}
