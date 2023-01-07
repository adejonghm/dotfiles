#!/bin/bash

# ************************************************************** #
#  _____        _                    ___           _        _ _  #
# |  ___|__  __| | ___  _ __ __ _   |_ _|_ __  ___| |_ __ _| | | #
# | |_ / _ \/ _` |/ _ \| '__/ _` |   | || '_ \/ __| __/ _` | | | #
# |  _|  __/ (_| | (_) | | | (_| |   | || | | \__ \ || (_| | | | #
# |_|  \___|\__,_|\___/|_|  \__,_|  |___|_| |_|___/\__\__,_|_|_| #
# ************************************************************** #


#============================
#==  SYSTEM CONFIGURATION  ==
#============================
sudo sed -i "$ a Defaults timestamp_timeout = -1" /etc/sudoers

sudo sed -i '$ a \\n#- Added from fedora.sh install script -#\ndefaultyes=True\ndeltarpm=True\nfastestmirror=True\nkeepcache=True\nmax_parallel_downloads=10' /etc/dnf/dnf.conf

# ENABLE RPM FUSION REPOSITORIES #
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# ENABLE FEDORA'S THIRD PARTY REPOSITORIES #
sudo dnf install -y fedora-workstation-repositories


#====================================
#==  ADDING EXTERNAL REPOSITORIES  ==
#====================================
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf config-manager --set-enabled google-chrome
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
#sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_36/home:manuelschneid3r.repo ### ALBERT LAUNCHER 

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc  ## BRAVE-BROWSER
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc  ## VSCode

# MULTIMEDIA PLUGINS #
sudo dnf groupupdate -y sound-and-video multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

# VISUAL STUDIO CODE #
sudo bash -c "echo '[vscode]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc' > /etc/yum.repos.d/vscode.repo"


#==================================
#==  INSTALLING PACKAGES & APPS  ==
#==================================
# DESCRIPTION:
# - fd-find -> Neovim Plugin (Lua configuration)
# - ripgrep -> Neovim Plugin for LSP & Mason (Lua configuration)
# - patchutils ->
# - grip -> Local renderer for Markdown files
sudo dnf upgrade -y --refresh

sudo dnf install -y bat dnf-plugins-core exa fd-find fzf git mc neofetch npm patchutils pdfgrep python3-pip ripgrep sqlite xkill zsh \
cheese discord evince gedit htop megasync mpv nomacs neovim pinta plank qbittorrent rpi-imager redshift redshift-gtk terminator sushi ulauncher vlc xfce4-notes-plugin xournalpp zeal \
latexmk texlive texlive-{babel-english\*,babel-portuges\*,babel-spanish\*,base,bibtex,hyphenat,hyphenat-doc,picture} \
brave-browser code containerd.io docker-ce docker-ce-cli docker-compose-plugin google-chrome-stable terraform \
gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

sudo dnf remove -y asunder atril claws-mail geany gnumeric parole pidgin pragha mousepad ristretto transmission xfburn xterm xfce4-terminal #thunar 


#============================
#==  OTHER CONFIGURATIONS  ==
#============================
DNFDRAGORA_PATH=$HOME/.config/autostart/
DNFDRAGORA_FILE=$DNFDRAGORA_PATH/org.mageia.dnfdragora-updater.desktop 
if [[ ! -f $DNFDRAGORA_FILE ]]; then
  mkdir $DNFDRAGORA_PATH
  echo "Hidden=true" > $DNFDRAGORA_FILE
fi

# ENABLE DOCKER #
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker $USER

# FLATHUB #
flatpak install -y flathub org.libreoffice.LibreOffice md.obsidian.Obsidian com.spotify.Client org.telegram.desktop

# PYTHON PIP #
pip install --user grip pipenv #azure-cli

# STARSHIP INSTALLATION #
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# ZSH CONFIGURATIONS #
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# FUZZY FINDE CONFIGURATION #
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && $HOME/.fzf/install

# MY CONFIGURATION FILES #
git clone https://github.com/adejonghm/dotfiles.git

cp dotfiles/.config/starship.toml $HOME/.config/
cp dotfiles/zshrc $HOME/.zshrc
cp -r dotfiles/.config/nvim/ $HOME/.config/nvim/
cp -r dotfiles/.config/terminator/ $HOME/.config/terminator/
cp -r dotfiles/.fonts/ $HOME/
cp -r dotfiles/.zsh/ $HOME/

rm -fr dotfiles/

# CREATE MARKS FOR ZSH JUMP PLUGIN #
mkdir $HOME/.marks
declare -a marks=(
  "dotfiles"
  "mega-python"
  "my-readme"
)

declare -a dest=(
  "$HOME/Git/GH.dotfiles"
  "$HOME/Git/GH.python-mega-course"
  "$HOME/Git/GH.readme-file"
)

for i in "${!marks[@]}"; do  
  ln -s "${dest[$i]}" $HOME/.marks/"${marks[$i]}"
done

# INSTALL COREUTILS #
# Find the latest version of CoreUtils in https://ftp.gnu.org/gnu/coreutils/ and the latest version of advcpmv in https://github.com/jarun/advcpmv
ADVCPMV_VERSION=${1:-0.9}
CORE_UTILS_VERSION=${2:-9.1}

curl -LO http://ftp.gnu.org/gnu/coreutils/coreutils-$CORE_UTILS_VERSION.tar.xz
tar xvJf coreutils-$CORE_UTILS_VERSION.tar.xz
rm -f coreutils-$CORE_UTILS_VERSION.tar.xz
(
  cd coreutils-$CORE_UTILS_VERSION/
  curl -LO https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-$ADVCPMV_VERSION-$CORE_UTILS_VERSION.patch
  patch -p1 -i advcpmv-$ADVCPMV_VERSION-$CORE_UTILS_VERSION.patch
  ./configure
  make
  sudo cp ./src/cp /usr/local/bin/advcp 
  sudo cp ./src/mv /usr/local/bin/advmv
)

rm -fr coreutils-$CORE_UTILS_VERSION

# CHANGE HOSTNAME #
sudo hostnamectl set-hostname "konoha"

# Restore default config #
sudo sed -i "/Defaults timestamp_timeout/d" /etc/sudoers

echo " >> Done, You Can Restart Your Computer! << "
