#!/bin/bash
#
# Xavi Fortes https://github.com/XaviFortes/
#
# RECOMMENDED USE ONLY FOR HP DL380p G8
# In case you made your own script for your server I invite to send me your code to post it in the repo.
#
# Script to reduce fan speeds on ILO4.
# Install new public key on ilo4 as described here:
# https://ouphe.net/2020/04/05/add-ssh-key-to-ilo4-user-for-authentication/
# 
#In my case I've did a SSH Key, I recommend you to do this, it's more secure since you don't have passwords in plain text.
#

ILO4=192.168.1.1    #Set this to your ILO IP
ILOUSER=admin       #Set this to your ILO User   //If you're using an SSH Key you don't need to set this up
LO=3500        # You can modify as you want, but take care
HI=5000        # You can modify as you want, but take care

# Set minima:
for PID in 33 34 35
do
        ssh $ILO4 "fan pid $PID lo $LO"
done

# Set maxima
for PID in 52 53 54 55 56 57
do
        ssh $ILO4 "fan pid $PID hi $HI"
done
