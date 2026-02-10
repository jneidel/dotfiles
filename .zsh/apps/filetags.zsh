tagtree() {
  (
    cd $ORG;
    rm -r $ORG_RESOURCES/tags
    filetags --tagtrees --tagtrees-handle-no-tag ignore -R --tagtrees-dir $ORG_RESOURCES/tags 2>/dev/null &
  )
}

taggarden() {
  (
    cd $ORG;
    filetags --tag-gardening -R 2>/dev/null &
  )
}
