windows=$(yabai -m query --windows --display 1 | jq '[.[] | select(."is-visible"==true and ."is-floating"==false)] | length')
space=$(yabai -m query --windows --display 1 | jq '[.[] | select(."is-visible"==true and ."is-floating"==false)][0].space')

if [[ $windows == 1 ]]; then
  yabai -m config --space $space left_padding 600
  yabai -m config --space $space right_padding 600
  yabai -m space --space $space --balance
else
  yabai -m config --space $space left_padding 12
  yabai -m config --space $space right_padding 12
  yabai -m space --space $space --balance
fi
