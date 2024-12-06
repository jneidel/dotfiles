
# formulae
insert_header_formulae() {
  profitLossColumn="$1"
  echo "@>$profitLossColumn=vsum(@I..@II)::$(total_formula)::$(hit_rate_formula $profitLossColumn)::$profitLossColumn='(hide-zero-cell @0\$0)\n"
}
total_formula() {
  echo '@>$2=total(vlen(@I..@II))'
}
hit_rate_formula() {
  profitLossColumn="$1"
  echo "@>\$1=(vcount(map(<if(gt(#1,0), 1, [])>, @I$profitLossColumn..@II$profitLossColumn))/vcount(map(<if(neq(#1,0), 1, [])>, @I$profitLossColumn..@II$profitLossColumn)));hr(%.2f)"
  # countif: https://stackoverflow.com/a/9190914
}
