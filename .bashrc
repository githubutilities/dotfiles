# Load the ubuntu shell dotfiles
for file in ~/.ios/.bashrc; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# Load .bash_profile
[ -n "$PS1" ] && source ~/.bash_profile;
