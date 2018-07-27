#!/bin/sh
userresources=/home/canopy/.Xresources
xrdb -merge "$userresources"
#https://www.toptal.com/designers/subtlepatterns/patterns/weather.zip
# wallpaper url
#setting small settings for X
xset s off &
xset b off &
xset -dpms &
xset r rate 220 60 &
exec openbox-session
