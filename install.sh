#!/bin/bash
#Install required packages
sudo apt-get install git build-essential libavahi-compat-libdnssd-dev

#Install updated node
cd ~; wget http://node-arm.herokuapp.com/node_latest_armhf.deb && sudo dpkg -i node_latest_armhf.deb && rm node_latest_armhf.deb && sudo npm install -g node-gyp;

#Git HAP-NodeJS
cd ~; git clone https://github.com/KhaosT/HAP-NodeJS.git

#Camera.js (from tutorial https://youtu.be/yJt3TZp0rXk)
`cd ~/HAP-NodeJS/lib/ && sudo mv Camera.js OriginalCamera.js.bak && wget "https://raw.githubusercontent.com/chaotux/HomeKit-RPI-Camera/master/Camera.js" && cd ..;`

#Install required npm
sudo npm install node-persist debug mdns fast-srp-hap ed25519 buffer-shims curve25519-n ip node-cmd

#Install GPU accelerated ffmpeg (might not be needed for the setup in the end)
cd ~/ ; wget https://github.com/ccrisan/motioneye/wiki/precompiled/ffmpeg_3.1.1-1_armhf.deb && sudo dpkg -i ffmpeg_3.1.1-1_armhf.deb && rm ffmpeg_3.1.1-1_armhf.deb

#Install RPi-Cam-Web-Interface (from http://elinux.org/RPi-Cam-Web-Interface)
cd ~ ; git clone https://github.com/silvanmelchior/RPi_Cam_Web_Interface.git && cd RPi_Cam_Web_Interface && chmod u+x *.sh && ./install.sh

#Now create custom task script (placed /home/pi/HAP-NodeJS/task) to use RPi-Cam-Web-Interface to update the snapshot
cd ~/home/pi/HAP-NodeJS/ && wget https://raw.githubusercontent.com/chaotux/HomeKit-RPI-Camera/master/task && sudo chmod a+x /home/pi/HAP-NodeJS/task
