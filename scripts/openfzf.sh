#!/bin/zsh

notes_dir="$HOME/notes"
cd $notes_dir

fzf_find_edit() {
    local file=$(
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview="head -n 20 {+}" \
	  --preview-window=down:50%  \
	  --inline-info 
      )
    if [[ -n $file ]]; then
        nvim "$file"
    fi
}

alias ffe='fzf_find_edit'
ffe
# fzf_output=$(fzf --reverse --prompt=$notes_dir/ --border --print-query --preview="head -n 20 {+}" --preview-window=down:50% --inline-info)

# --print-query prints the query which can be used
# to create a new file if there is no match
# in this case the query is printed before a match in a new line

# split the output into an array
#IFS=$' ' y=($(fzf --reverse --prompt=$notes_dir/ --border --print-query --preview="head -n 20 {+}" --preview-window=down:50% --inline-info));
## 
#echo $y
#query=$y[1] # query is the firts line
#match=$y[2] # match is the second line if there is any
#
#echo $match
#
#if [[ 0 -eq $exitcode ]]; then
#	nvim $notes_dir/$match
#elif [[ 1 -eq $exitcode ]]; then
#	nvim $notes_dir/$query.md
#fi
