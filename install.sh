# todo : delete disk and system settings from launcher
# todo : set keyboard in azerty
# todo : for lock screen, in power settings set "when lid is closed" to "do nothing"
# todo : appearance->enable workspace 

#### Inital clean up ####
apt-get remove -y netsurf-gtk
apt-get update
apt-get upgrade

#### Basic software ####
apt-get install -y gnome-terminal file-roller nano
# todo : in gnome terminal, edit->profile preferences->font 11 & not terminal bell & custom default terminal size 120x36 or more & scrolling unlimited
# todo : add gnome terminal in launcher

apt-get install -y bash-completion vlc eog evince build-essential
# could also add ubuntu-restricted-extras ttf-ubuntu-font-family software-center synaptic

todo : install locate and update locate base

#### Libre office ####
apt-get install -y libreoffice-writer libreoffice-calc
apt-get install -y libreoffice-gnome

#### Latex ####
apt-get install -y texlive-full
todo : install only needed package
# note : takes almost 3Go alone

#### Chromium ####
apt-get install -y chromium-browser
# todo : setup chromium and add it in launcher

#### Git ####
apt-get install -y git
apt-get install -y gitk
git clone --progress https://github.com/H--o-l/Smart_home.git $HOME/
git clone --progress https://github.com/H--o-l/Arduino_mp3.git $HOME/
git config --global user.name "$USER"
git config --global user.email "$USER.iris@gmail.com"

#### SD card ####
gsettings set org.gnome.desktop.media-handling automount false
gsettings set org.gnome.desktop.media-handling automount-open false
cp $HOME/Smart_home/Script_chromebook/rc.local /etc/
mkdir $HOME/SD
mount /dev/mmcblk1p1 $HOME/SD
ln -s $HOME/Smart_home/Script_chromebook/sd /usr/local/bin/

#### Dropbox ####
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
cp $HOME/Smart_home/Script_chromebook/dropbox_autostart.desktop $HOME/.config/autostart/

#### Steam ####
mkdir $HOME/SD/Steam
mkdir $HOME/SD/Steam/.steam
ln -s $HOME/SD/Steam/.steam $HOME/.steam
apt-get install -y steam

#### logout_ubuntu ####
ln -s $HOME/Smart_home/Script_chromebook/logout_ubuntu /usr/local/bin/


#### Sublime text ####
mkdir $HOME/tmp
wget -P $HOME/tmp/ http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2
tar -xvf $HOME/tmp/Sublime\ Text\ 2.0.2\ x64.tar.bz2
mv $HOME/tmp/Sublime\ Text\ 2 /usr/local/bin/sublime_text
ln -s /usr/local/bin/sublime_text/sublime_text /usr/local/bin/sb
rm -rf $HOME/tmp
$HOME/SD/Dropbox/Save_Sublime_text/copy_settings_linux.sh

#### Save video game ####
#### Save Prison architecte ####
rm -r $HOME/.Prison\ Architect/saves
mkdir $HOME/.Prison\ Architect
ln -s $HOME/SD/Dropbox/Save_Game/Prison\ Architect/saves $HOME/.Prison\ Architect/
#### Save FTL ####
rm -r $HOME/.local/share/FasterThanLight
ln -s $HOME/SD/Dropbox/Save_Game/FasterThanLight $HOME/.local/share/FasterThanLight
#### Save Hotline Miami ####
rm -r $HOME/.local/share/HotlineMiami2
ln -s $HOME/SD/Dropbox/Save_Game/HotlineMiami2 $HOME/.local/share/HotlineMiami2
#### Save Don't Starve ####
# automatic with linux
#### Save Kerbal Space Program ####
mkdir $HOME/SD/Steam/.steam/steam/steamapps/common/Kerbal\ Space\ Program
mkdir $HOME/SD/Steam/.steam/steam/steamapps/common/Kerbal\ Space\ Program/saves
rm $HOME/SD/Steam/.steam/steam/steamapps/common/Kerbal\ Space\ Program/saves/hoel
ln -s $HOME/SD/Dropbox/Save_Game/Kerbal\ space\ program/hoel $HOME/SD/Steam/.steam/steam/steamapps/common/Kerbal\ Space\ Program/saves/


#### Final clean up ####
apt-get autoremove -y
apt-get clean

# note : size at this point should be around 7.4Go

