path=~/dotfiles/sway/path.txt

swaymsg mark setstartuppath

find ~/code/ -type d | fzf | tee $path > /dev/null
swaymsg kill
