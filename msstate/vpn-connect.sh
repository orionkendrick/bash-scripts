#!/bin/bash
# This is a simple script which automates logging in while using openconnect to connect to the Cisco Anyconnect VPN hosted by Mississippi State University
# To use this, you will need to use gpg to encrypt a file '/opt/msstate/login.gpg' with the following format (I use Student for the first line):
 
# <Employee|Department|Extension|ITS|ITSAccess|Psychology Clinic|Student|Vendor>
# <netid>
# <password>
# push

# 'push' makes it send a notification to the Duo Mobile app for 2FA

# The following command will encrypt a file with that format, named 'login':
# gpg -e -r <user-id> login

#Prereqs: gpg, openconnect

gpg --quiet -d /opt/msstate/login.gpg | sudo openconnect vpn.msstate.edu --background
