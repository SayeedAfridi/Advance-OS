#!/bin/bash
sudo mv /usr/share/gnome-shell/theme/ubuntu.css /usr/share/gnome-shell/theme/ubuntu.css.bak
sudo cp -f $(pwd)/ubuntu.css /usr/share/gnome-shell/theme/ubuntu.css
cp $(pwd)/SetAsWallpaper ~/.local/share/nautilus/scripts/
sleep 1
sudo chmod +x ~/.local/share/nautilus/scripts/SetAsWallpaper
gsettings set org.gnome.desktop.background picture-uri "file:///$(pwd)/bg-boat.jpg"
bash ~/.local/share/nautilus/scripts/SetAsWallpaper

echo "***********************************************************************"
echo "                      Installation complete"
echo "***********************************************************************"
echo "Make quick reload Ubuntu to accept changes with command: ALT+F2 -->  r"
echo "***********************************************************************"
exit 1


