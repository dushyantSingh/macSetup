bold=$(tput bold)
normal=$(tput sgr0)

function installdmg {
    set -x
    tempd=$(mktemp -d)
    curl $1 > $tempd/pkg.dmg
    listing=$(sudo hdiutil attach $tempd/pkg.dmg | grep Volumes)
    volume=$(echo "$listing" | cut -f 3)
    if [ -e "$volume"/*.app ]; then
      sudo cp -rf "$volume"/*.app /Applications
    elif [ -e "$volume"/*.pkg ]; then
      package=$(ls -1 "$volume" | grep .pkg | head -1)
      sudo installer -pkg "$volume"/"$package" -target /
    fi
    sudo hdiutil unmount "$volume"/*.app
    rm -rf $tempd
    set +x
}


echo "\n \n \n"
echo "${bold}******** Welcome to macbook setup **********${normal}"
echo
echo "${bold}1. Installing xcode CLI${normal}"
xcode-select --install

echo
echo "${bold}2. Checking for Homebrew${normal}"
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "Updating Homebrew"
    brew update
fi

echo
echo "${bold}2. Installing iterm 2${normal}"
brew cask install iterm2

echo
echo  "${bold}3. Installing Oh my zsh${normal}"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo
echo "${bold}4.Cloning zsh config file${normal}"
git clone https://github.com/dushyantSingh/ohmyzshConfig.git ~/

echo
echo "${bold}5. Installing PowerLevel 10k${normal}"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo
echo "${bold}6. Create working directory${normal}"
mkdir '~/Workspace'

echo
echo "${bold}7. Do you want to install flutter? (y/n)${normal}"
read value
if [ $value == 'y' ]
then
    git clone https://github.com/flutter/flutter.git -b stable --depth 1 ~/Workspace/flutter2
    echo 'Verify flutter installation'
    flutter doctor
else 
    echo 'You can manually install flutter from  https://flutter.dev/docs/get-started/install/macos'
fi

echo
echo "${bold}8. Do you want to install Cocoapods? (y/n)${normal}"
read value
if [ $value == 'y' ]
then
    echo "Installing cocoapods..."
    sudo gem install cocoapods
else 
    echo 'You can manually install cocoapods by excuting sudo gem install cocoapods'
fi

echo
echo "${bold}9. Do you want to install Alfred 4? (y/n)${normal}"
read value
if [ $value == 'y' ]
then
    echo "Intalling Alfred..."
    installdmg https://cachefly.alfredapp.com/Alfred_4.2_1180.dmg
    # mkdir ~/Downloads/Software
    # curl https://cachefly.alfredapp.com/Alfred_4.2_1180.dmg -o ~/Downloads/Software/Alfred.dmg
    # sudo hdiutil attach Alfred.dmg
    # sudo installer -package /Volumes/Alfred/Alfred.pkg -target /
else 
    echo 'You can manually install cocoapods by excuting sudo gem install cocoapods'
fi

echo
echo "${bold}10. Do you want to install Rectangle? (y/n)${normal}"
read value
if [ $value == 'y' ]
then
    brew cask install rectangle
else 
    echo 'You can manually install Rectangle by excuting brew cask install rectangle'
fi

echo
echo "${bold}11. Do you want to download Magnet? (y/n)${normal}"
read value
if [ $value == 'y' ]
then
    echo "Opening Magnet..."
    open https://apps.apple.com/app/id441258766?mt=12
else 
    echo 'You can manually install Magnet by searching for Magnet in App store'
fi
