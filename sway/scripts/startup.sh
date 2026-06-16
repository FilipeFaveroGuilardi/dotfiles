declare -A apps=([v]="v" [lazygit]="lazygit")
path="$(cat ~/dotfiles/sway/path.txt)"

for key in "${!apps[@]}"; do 
	if command -v "apps[$key]" &> /dev/null; then
		shell_command="kitty" 
		$shell_command+=apps[$key]
		cd $path
		eval $shell_command
	else
		echo "error ocurred: $key dont exists"
	fi
done
