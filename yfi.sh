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

if [[ "$1" ]]; then

  yturl="${1}"

else

  clear

  echo "Welcome to YFI: Youtube Freedom Improver"

  echo "Paste Youtube URL here"
  read yturl

fi

#echo entered url into tmp file
echo "${yturl}" > /tmp/old_yturl.txt

# Replace with nocookie. Strip watch crap.
sed -i -e 's/^http:/https:/g' \
-e 's/youtube\.com/youtube-nocookie\.com/g' \
-e 's/watch//g' \
-e 's/\?//g' \
-e 's/v=/embed\//g' \
-e 's/$/?html5=1/' \
/tmp/old_yturl.txt

select choice in \
        "Open in default browser" \
	"Open in VLC" \
	"Copy to Clipboard" \

do
case $choice in
        "Open in default browser")
        xdg-open `cat /tmp/old_yturl.txt`;
        ;;
        "Open in VLC")
        vlc $1;
        ;;
	"Copy to Clipboard")
	cat /tmp/old_yturl.txt | xclip -selection c;
	echo "the new URL"; 
	tput setaf 6;
	tput bold;
	echo $(cat /tmp/old_yturl.txt); 
	tput sgr0;
	echo "has been copied to your clipboard";
#        *)
            echo "What do you want to do?";

        esac
done


# Display new url
cat /tmp/old_yturl.txt

# rm tmp file
rm /tmp/old_yturl.txt


exit 0
