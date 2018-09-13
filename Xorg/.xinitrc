#!/bin/sh
userresources=/home/canopy/.Xresources
xrdb -merge "$userresources"
exec openbox-session
