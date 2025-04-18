#!/bin/bash

silence=(
  label="Silence"
  y_offset=2
)


sketchybar --add item silence cennter            \
           --set silence "${silence[@]}"         
