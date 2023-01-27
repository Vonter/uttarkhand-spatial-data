#!/bin/bash

jq -cr '.response |
  ."main-content" |
  .children |
  .[] |
  .props |
  .children |
  .[] |
  .props |
  .children |
  .props |
  .children |
  .[] |
  .props |
  .children |
  .props |
  .data |
  .name, .' data.json |
  awk 'NR%2{f=$0".geojson";next} {print >f;close(f)}'
