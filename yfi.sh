#!/bin/bash

#Copyright (C) 2015  Theatre X

#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 2
#of the License, or (at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

clear

echo "Welcome to YFI: Youtube Freedom Improver"

echo "Paste Youtube URL here"
read yturl

#echo entered url into tmp file

echo $yturl > /tmp/old_yturl.txt

# Replace with nocookie

sed -i 's/youtube/youtube-nocookie/g' /tmp/old_yturl.txt

# Strip watch crap, echo into a tmp file

sed -i 's/watch//g' /tmp/old_yturl.txt
sed -i 's/\?//g' /tmp/old_yturl.txt
sed -i 's/v=/embed\//g' /tmp/old_yturl.txt
sed -i 's/http:/https:/g' /tmp/old_yturl.txt

# Display new url

echo `cat /tmp/old_yturl.txt`"?html5=1"

# rm tmp file

rm /tmp/old_yturl.txt
