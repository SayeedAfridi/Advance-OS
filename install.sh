#!/bin/bash
## Changing the Wallpapers ##
echo "###############################################################"
echo "##                                                           ##"
echo "##             Working with wallpapers                       ##"
echo "##                                                           ##"
echo "###############################################################"
tar -xf $(pwd)/Wallpaper/Bionic_Wall.tar.xz
sudo mv $(pwd)/Bionic_Wall/* /usr/share/backgrounds/
gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/warty-final-ubuntu.png"

echo "###############################################################"
echo "##                                                           ##"
echo "##                         Done                              ##"
echo "##                                                           ##"
echo "###############################################################"

## Configureing the Login Screen ##
echo "###############################################################"
echo "##                                                           ##"
echo "##                       Login Screen                        ##"
echo "##                                                           ##"
echo "###############################################################"
sudo cp -f $(pwd)/login_screen/big-ocean/ubuntu.css /usr/share/gnome-shell/theme/ubuntu.css
cp $(pwd)/login_screen/big-ocean/SetAsWallpaper ~/.local/share/nautilus/scripts/
sleep 1
sudo chmod +x ~/.local/share/nautilus/scripts/SetAsWallpaper
bash ~/.local/share/nautilus/scripts/SetAsWallpaper
sudo cp -f $(pwd)/logo/login-screen.png /usr/share/plymouth/ubuntu-logo.png

echo "###############################################################"
echo "##                                                           ##"
echo "##                         Done                              ##"
echo "##                                                           ##"
echo "###############################################################"


##Plymouth Theme###
echo "###############################################################"
echo "##                                                           ##"
echo "##               Changing Plymouth                           ##"
echo "##                                                           ##"
echo "###############################################################"
sudo cp -rf $(pwd)/plymouth/advance-os-logo /usr/share/plymouth/themes/
sudo convert -resize 1366 -quality 100 -brightness-contrast -10x-15 -blur 0x30 $HOME/.cache/wallpaper/* /usr/share/plymouth/themes/advance-os-logo/advance_background.png
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/advance-os-logo/advance-os-logo.plymouth 100
echo "please select the number of advance-os-logo"
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u
echo "###############################################################"
echo "##                                                           ##"
echo "##                         Done                              ##"
echo "##                                                           ##"
echo "###############################################################"

##Configureing grub##
echo "configuring grub"
sudo convert -resize 1366 -quality 100 -brightness-contrast -10x-15 -blur 0x30 $HOME/.cache/wallpaper/* /boot/grub/background.png
sudo update-grub

##Configuring OS##
echo "###############################################################"
echo "##                                                           ##"
echo "##                     configuring OS                        ##"
echo "##                                                           ##"
echo "###############################################################"
sudo cp $(pwd)/etc/os-release.ados /etc/os-release
sudo cp $(pwd)/etc/lsb-release.ados /etc/lsb-release
sudo dpkg -i $(pwd)/gnome-control-center/gnome-control-center_3.28.2-0ubuntu0.18.04.2ados.20191_amd64.deb
sudo dpkg -i $(pwd)/gnome-control-center/gnome-control-center-data_3.28.2-0ubuntu0.18.04.2ados.20191_all.deb
sudo dpkg -i $(pwd)/gnome-control-center/gnome-control-center-dev_3.28.2-0ubuntu0.18.04.2ados.20191_all.deb
sudo dpkg -i $(pwd)/gnome-control-center/gnome-control-center-faces_3.28.2-0ubuntu0.18.04.2ados.20191_all.deb
echo "###############################################################"
echo "##                                                           ##"
echo "##                         Done                              ##"
echo "##                                                           ##"
echo "###############################################################"

##Confiduring extensions"
echo "###############################################################"
echo "##                                                           ##"
echo "##              Working with Extensions                      ##"
echo "##                                                           ##"
echo "###############################################################"
tar -xf $(pwd)/extensions/dash-to-dock@micxgx.gmail.com.tar.xz
tar -xf $(pwd)/extensions/user-theme@gnome-shell-extensions.gcampax.github.com
mv $(pwd)/user-theme@gnome-shell-extensions.gcampax.github.com /home/killer/.local/share/gnome-shell/extensions/
mv $(pwd)/dash-to-dock@micxgx.gmail.com /home/killer/.local/share/gnome-shell/extensions/
gnome-shell-extension-tool -e user-theme@gnome-shell-extensions.gcampax.github.com
gnome-shell-extension-tool -e dash-to-dock@micxgx.gmail.com
dconf write /org/gnome/shell/extensions/dash-to-dock/autohide false
dconf write /org/gnome/shell/extensions/dash-to-dock/intellihide false
echo "###############################################################"
echo "##                                                           ##"
echo "##                         Done                              ##"
echo "##                                                           ##"
echo "###############################################################"

##configuring theme and icon##
echo "###############################################################"
echo "##                                                           ##"
echo "##                  Themes and Icons                         ##"
echo "##                                                           ##"
echo "###############################################################"

tar -xf $(pwd)/gui/themes/ADOS.tar.xz
sudo mv $(pwd)/ADOS /usr/share/themes/
tar -xf $(pwd)/gui/themes/ADOS-shell.tar.xz
sudo mv $(pwd)/ADOS-shell /usr/share/themes/
tar -xf $(pwd)/gui/icons/ADOS-icon.tar.xz
sudo mv $(pwd)/ADOS-icon /usr/share/icons/
tar -xf $(pwd)/gui/icons/ADOS-cursor.tar.xz
sudo mv $(pwd)/ADOS-cursor /usr/share/icons/

dconf write /org/gnome/desktop/interface/cursor-theme "'ADOS-cursor'"
dconf write /org/gnome/desktop/interface/gtk-theme "'ADOS'"
dconf write /org/gnome/desktop/interface/icon-theme "'ADOS-icon'"
dconf write /org/gnome/shell/extensions/user-theme/name "'ADOS-shell'"
echo "###############################################################"
echo "##                                                           ##"
echo "##                         Done                              ##"
echo "##                                                           ##"
echo "###############################################################"

##slingscold optional##

echo "###############################################################"
echo "##                                                           ##"
echo "##                     Slingscold                            ##"
echo "##                                                           ##"
echo "###############################################################"
read -p "Do you want to install slingscold(y/n)? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo add-apt-repository ppa:noobslab/macbuntu -y
    sudo apt install slingscold
    cp $(pwd)/gui/plank/slingscold.dockitem ~/.config/plank/dock1/launchers/
    sudo cp /usr/share/themes/ADOS-shell/gnome-shell/assets/startup.png /usr/share/icons/slingscold.png
    sudo add-apt-repository --remove ppa:noobslab/macbuntu -y
    sudo apt update
fi
echo "###############################################################"
echo "##                                                           ##"
echo "##                         Done                              ##"
echo "##                                                           ##"
echo "###############################################################"

##Plank optional##
echo "###############################################################"
echo "##                                                           ##"
echo "##                        Plank                              ##"
echo "##                                                           ##"
echo "###############################################################"
read -p "Do you want to install plank(y/n)? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install plank
    plank &
    sleep 1
    sudo cp -r $(pwd)/gui/plank/Default /usr/share/plank/themes/
    cp /usr/share/applications/plank.desktop ~/.config/autostart/plank.desktop
fi
echo "###############################################################"
echo "##                                                           ##"
echo "##                         Done                              ##"
echo "##                                                           ##"
echo "###############################################################"
echo "###############################################################"
echo "##                                                           ##"
echo "##                    Install complete                       ##"
echo "##                                                           ##"
echo "###############################################################"
echo "###############################################################"
echo "##                                                           ##"
echo "##             Thank You... Reboot your system               ##"
echo "##                                                           ##"
echo "###############################################################"
exit
