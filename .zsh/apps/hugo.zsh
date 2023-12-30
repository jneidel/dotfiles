BLOG=$HOME/code/blog

postde() {
  if [ -z "$1" ]; then
    echo "Missing the post title"
    return 1
  fi
  file="$(echo "$@.md" | tr ' ' -)"

  cd $BLOG
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

  cd $BLOG
  hugo new content "blog/$file"
  $EDITOR "content/en/blog/$file"
}
wcu() {
  file="weekly-challenge-$(date +%Y-%U --date 'last week').md"

  cd $BLOG
  hugo new content -k weekly-challenge-update blog/$file
  $EDITOR "content/en/blog/$file"
}
