# Ask for the administrator password upfront
sudo -v

DESTINATION=~/dotfiles

sudo apt-get --yes install vim
sudo apt-get --yes install git

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	rm -rf $DESTINATION;
	git clone https://github.com/githubutilities/dotfiles.git $DESTINATION && cd dotfiles && git checkout ubuntu && source bootstrap.sh --force
	exit
elif [ -d $DESTINATION ]; then
	read -p "This will remove dotfiles in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		rm -rf $DESTINATION;
	fi;
fi;

git clone https://github.com/githubutilities/dotfiles.git $DESTINATION && cd dotfiles && git checkout ubuntu && source bootstrap.sh

