#!/bin/bash
# Dynamically generate coordinates in draft.html and save to index.html

title_pat='div class="step title"'
step_pat='div class="step"'
width=1000
height=600
x=0
y=0

IFS=''
while read -r line; do
    if [[ $line =~ $title_pat ]]; then
        x=0
        ((y += height))
        echo "$line" | sed -e "s/${title_pat}/${title_pat} data-x=\"$x\" data-y=\"$y\" data-scale=\"2\"/"
    elif [[ $line =~ $step_pat ]]; then
        ((x += width))
        echo "$line" | sed -e "s/${step_pat}/${step_pat} data-x=\"$x\" data-y=\"$y\"/"
    else
        echo "$line"
    fi
done < draft.html > index.html
