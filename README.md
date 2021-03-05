# Silence-Of-The-Fans-ILO
Control the fan speed of your ILO 4

## Introduction
This is a more detailed guide of how I did all the installation of the CFW.

I did all of this on Proxmox PVE. Without any issue.

I think that if you can access the ssh of the host you can install this modification.

## Installation
Okay so here's the explanation of all.

### Downgrade to ILO 4 v2.50

Just like an upgrade. You can do it via web (this is what I did). Or via OS.

### Disable the Secure ILO / Maintenance Mode

To enter maintenance mode you have to shutdown your server. Open the case and turn on the switch number 1.

[![SwitchImg](https://i.ibb.co/5kBVq7f/Secure-ILO.jpg)](https://github.com/XaviFortes/)

Now you can turn on your server. 

### Once server booted up

Once the server is booted up and in a linux distro you can continue with the installation of the CFW. First of all download the CFW of PhoenixDev that you can find here: https://www.reddit.com/r/homelab/comments/hix44v/silence_of_the_fans_pt_2_hp_ilo_4_273_now_with/

IMPORTANT: I haven't installed any HP Driver into the Linux Distro as it says in the post. But worked for me perfectly at first try.

### Management of files

Well, you need to have the ILOv2.55  .scexe in the OS and you'll have to extract it with this command.
```sh
sh ./CP027911.scexe --unpack=ilo_250
cd ilo_250
cp /path/to/CFW/ilo4_273.bin.fancommands ilo4_250.bin
sudo ./flash_ilo4 --direct
```
Caution: if you run all this code at the same time it will start flashing. If you want to flash later just don't put the ``` ./flash_ilo4``` command.

The folders should look like this.
```sqf
Home/Root Folder
+---ilo_250 folder 
    \--CP027911.xml
    |--flash_ilo4
    |--ilo4_250.bin
    |--README.txt
```
### FLASH

If you haven't run the flash yet you can do it using the command said above.
```sh
./flash_ilo4
```
Wait patiently, don't disconnect anything, stay in the ssh connection. Mine was about 10 minutes install. When the install started the fans went 100% don't worry about that. ^-^

### After Flash

Nice, if you have succesfully installed the modded version now you can SSH the ILO and have access to the command fan and many others. I just have used the FAN command.

For example if you want to set a max speed for the fan number 4 you have to run this command:
```sh
fan p 4 max 90
```
Where 4 is the fan number and 90 is the max speed.

The max speed goes from 0 to 255 so if you want the fans at 30% speed you'll have to do 30*2.55 = 76.5 so put 76 or 77.

If you did that you can hear how now one of the noisy fan went quiet. If you want a max speed for all just change the number of the fan you want to change until you did that to all.

IMPORTANT: When you restart the server the config will restart so I recommend you to use a script for automation and custom temperature curves depending on CPU Temp readings.
Today I'm using my custom version of this repo for my dl380p G8 which has 6 fans.

https://github.com/XaviFortes/HP-ILO-Fan-Control

Depending on the cpu if spins up the left side or right comparing which cpu it's warmer.
It maxes out speed when one of the cpu go over 67 degrees celsius to avoid shutdowns and other possible issues. 
