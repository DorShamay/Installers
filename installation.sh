#!/bin/bash


debian_installation(){

  echo -e "$     ____                                        ${NC}"
  echo -e "   .mgg\$\$\$\$gg.     ______     _     _              ${NC}"
  echo -e " ,g\$\"    _ \`\$\$b.  |  _  \   | |   (_)             ${NC}"
  echo -e "\"\$\$    ,gs  \`\$\$.  | | | |___| |__  _  __ _ _ __   ${NC}"
  echo -e "\"Y\$.  ,\$\"  \`\$b.   | | | / _ \ '_ \| |/ _\` | '_ \  ${NC}"
  echo -e "\`\"b.   _\$\$,d.     | | |/ /  __/ |_) | | (_| | | |  ${NC}"
  echo -e """\`Yb.              |___/ \___|_.__/|_|\__,_|_| |_| ${NC}"
  echo -e "   \`\"Y._                                          ${NC}"
echo -e "    \`'\"\"\"              Debian Installation       ${NC}"

line="\n"
user="dor"
passwd="1"
bashrc="/etc/bash.bashrc"
logfile="/var/log/"
installer="apt-get"
tmp="/tmp"


gui_packages=( "lightdm" "mate-desktop" "mate-desktop-environment" "mate-desktop-environment-extra" "mate-desktop-environment-extras" "culmus" "mixxx" "guake" "bash-completion" "plank" "atom" "sqlitebrowser" "pgadmin3" "vim-gtk" "codeblocks" "ninja-ide" "geany" "geany-plugins" "wireshark" "zenmap" "transmission" "gparted" "vlc" "abiword" "owncloud-client" "vim" "plank" "moka-icon-theme" "faba-icon-theme")


upgread_check(){
  distro=$(cat /etc/os-release|grep "^ID")
    if [[ $distro == "debian" ]]; then
      apt-get update >> $logfile
    fi
}

net_status(){
  status=$(ping -c 1 google.com > /dev/null ;printf "$?\n")
      if [[ $status == "1" ]] || [[ $status == "2" ]]; then
        printf "$line"
        printf"No Network"
        printf "$line"
        return 1
      elif [ $status == "0" ]; then
        printf "$line"
        printf "You're Online"
        printf "$line"
      sleep 2
          printf "$line"
            printf "Updating file cache"
          printf "$line"
          apt-get update &>>$logfile
      printf "finished updating cache"
    return 0

  fi

}

}

echo -e "Welcome to the installation of Debian/Centos"

echo "Which Distribution You'd like to Install?"

select func in "Centos" "Debian"
    do
  	 case $func in
		"Centos" | "centos")
      centos_installation
        printf "\n"
        printf "\n"
           ;;
		"Debian" | "debian")
      debian_installation
        printf "\n"
        printf "\n"
		       ;;
           "Quit" | "q")
             exit 0
                 ;;
       		*)
       			echo "Please enter a valid selection"
       		;;
       	esac

       done
       }
