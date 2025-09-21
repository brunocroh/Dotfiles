windows=$(yabai -m query --windows --display 1 | jq '[.[] | select(."is-visible"==true and ."is-floating"==false)] | length')
space=$(yabai -m query --windows --display 1 | jq '[.[] | select(."is-visible"==true and ."is-floating"==false)][0].space')

if [[ $windows -eq 1 ]]; then
  isZen=true
else
  isZen=false
fi

zen_state_file="$HOME/.config/yabai/.zen_state_space_$space"
previous_zen_state=$(cat "$zen_state_file" 2>/dev/null || echo "false")

if [[ $isZen != $previous_zen_state ]]; then
  echo "$isZen" > "$zen_state_file"
  
  if [[ $isZen == true ]]; then
    yabai -m config --space $space left_padding 600
    yabai -m config --space $space right_padding 600
    yabai -m space --space $space --balance
  else
    yabai -m config --space $space left_padding 12
    yabai -m config --space $space right_padding 12
    yabai -m space --space $space --balance
  fi
fi
