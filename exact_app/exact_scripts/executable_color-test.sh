#!/usr/bin/bash
color_test() {
  awk 'BEGIN{
      for(col=0; col<256; col++) {
          printf "\033[48;2;%d;%d;%dm", col,col,col
          printf "%4d", col
          printf "\033[0m"
      }
      printf "\n"
  }'
}
