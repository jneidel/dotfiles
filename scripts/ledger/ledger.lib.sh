calculate_split_amounts() {
  amount_input=$1
  split="$2"
  [ -z "$split" ] && split="50/50"

  export AMOUNT_TOTAL=$(node -e "console.log( ($amount_input).toFixed(2) )")

  if [ "$split" = "50/50" ]; then
    split_1=$(node -e "console.log( ($AMOUNT_TOTAL/2).toFixed(2) )")
    split_2=$split_1
  else
    split_1_ratio="$(echo $split | cut -d/ -f1)"
    split_2_ratio="$(echo $split | cut -d/ -f2)"

    split_1=$(node -e "console.log( ($AMOUNT_TOTAL*0.$split_1_ratio).toFixed(2) )")
    split_2=$(node -e "console.log( ($AMOUNT_TOTAL*0.$split_2_ratio).toFixed(2) )")
  fi

  if [ $(echo "$split_1 + $split_2 == $AMOUNT_TOTAL" | bc) -ne 1 ]; then
    export AMOUNT_SPLIT_1=$split_1
    export AMOUNT_SPLIT_2=$(echo "$split_2 + .01" | bc)
    if [ $(echo "$AMOUNT_SPLIT_1 + $AMOUNT_SPLIT_2 == $AMOUNT_TOTAL" | bc) -ne 1 ]; then
      export AMOUNT_SPLIT_1=$split_1
      export AMOUNT_SPLIT_2=$(echo "$split_2 - .01" | bc)
    fi
  else
    export AMOUNT_SPLIT_1=$split_1
    export AMOUNT_SPLIT_2=$split_2
  fi
}

determine_month_in_question() {
  if [ `date +%d` -lt 10 ]; then
    date --date "last month"
  else
    date
  fi
}

parse_date_input() {
  date_input="$1"
  [ -z "$date_input" ] && date_input="tod"

  if echo "$date_input" | grep "^t" >/dev/null; then # today/this month
    parsed_day="$(echo $date_input | grep -Po "\d*" )"
    if [ -n "$parsed_day" ]; then
      export DATE="$(date +%Y-%m-)${parsed_day}"
    else
      export DATE="$(date +%Y-%m-%d)"
    fi
  elif [ -n "$date_input" ]; then # determine month based on current date
    full_month_in_question="$(determine_month_in_question)"
    export DATE="$(date +%Y-%m- -d "$full_month_in_question" )${date_input}"
  else
    echo "empty $date_input given"
    exit 1
  fi
}

date_doc_string() {
  echo "day of the month, default today, format: 07\n      At the beginning of the month, the previous month is used if a number is given.\n      To overwrite, pass number starting with a t, e.g. t07 to say the 7th of the current month."
}
