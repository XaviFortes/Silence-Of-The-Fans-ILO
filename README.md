# Silence-Of-The-Fans-ILO
Control the fan speed of your ILO 4

## Introduction
This is a more detailed guide of how I did all the installation of the CFW.

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
|   \--CP027911.xml
|   |--flash_ilo4
|   |--ilo4_250.bin
|   |--README.txt
```
### FLASH

If you haven't run the flash yet you can do it using the command said above.
```sh
./flash_ilo4
```
