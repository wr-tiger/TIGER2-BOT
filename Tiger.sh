
#!/bin/bash

# |  Script by   > TIGER
# |  Github.     > https://github.com/wr-tiger
# |  Sosmed      > wr_tiger


# Color definitions
white="\033[00m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
biru='\033[0;34m'
reset="\033[0m"
normal_color="\e[0m"
red_bg="\e[41m"
green_bg="\e[42m"
yellow_bg="\e[43m"
blue_bg="\e[44m"

correct_pin="9990"
clear
echo -e "${green}Bukak pin dulu Ler${reset}"
read -p "Masuk PIN>>>> " user
if [ "$user" = "$correct_pin" ]; then
sleep 2
    echo -e "${green}PIN BENAR NYET {reset}"
    
else
    echo -e "${red}PIN salah! TOD ${reset}"
    exit 1
fi
echo -e "${green}Selamat datang di program Anda!${reset}"


display_keypad() {
    local pressed=$1
    local bg_color=$2
    clear

    rows=$(tput lines)
    cols=$(tput cols)
    start_row=$((rows / 2 - 2))
    start_col=$((cols / 2 - 10))
    tput cup $start_row $start_col

    for i in {1..12}; do
        if [[ $i == $pressed ]]; then
            echo -ne "${bg_color}\e[1;37m $(printf "%2d" $i) ${normal_color}"
        else
            echo -ne "\e[1;32m $(printf "%2d" $i) ${normal_color}"
        fi

        if [[ $((i % 4)) == 0 ]]; then
            echo "" 
            tput cup $((start_row + (i / 4))) $start_col
        else
            echo -n "   " 
        fi
    done
}

press_button() {
    local button=$1
    local color=$2
    display_keypad $button $color
    sleep 0.5
}

main_menu() {
    clear
    echo -e "\n\e[1;36mSelamat datang di sistem! Animasi tombol sedang berjalan...\e[0m"
    sleep 1

    press_button 1 $red_bg
    press_button 5 $green_bg
    press_button 9 $yellow_bg
    press_button 12 $blue_bg

    display_keypad "" ""
    echo -e "\n\e[1;32mPIN terbuka!\e[0m"
    sleep 2

    next_script
}

next_script() {
    echo -e "\n\e[1;34mSelamat datang di tahap berikutnya!\e[0m"
    echo "Menjalankan skrip berikutnya..."
}

main_menu


# Confirm resource check 
enter() {
    clear
    echo
    echo -e $white " # [!] Checking system file. make sure your internet is Good!"
    read -r -s -p $'  • [?] Press enter to continue....\n'
    function back_option () {
        clear 
    }
    
# Install required resources
    echo
    echo -e $red "=------------------------------="
    echo -e $biru " # [!] Detect resource..."
    echo -e $red "=------------------------------="
    sleep 1
    check_resource "figlet"
    check_resource "pv"
    check_resource "git"
    check_resource "unzip"
    check_resource "nodejs-lts"
    check_resource "libwebp"
    check_resource "ffmpeg"
    echo -e $red "=------------------------------="
    sleep 1
    echo -e $green " # [✓] All resources installed!"|pv -qL 35
    sleep 2
    menu
}



# Function to check resource installation
check_resource() {
  package_name="$1"
  dpkg -s $package_name &> /dev/null
  if [ $? -eq 0 ]; then
    echo -e $green " • [✓] $package_name installed"
    else
    echo -e $yellow " • [/] Installing $package_name..."
    echo
    pkg install "$package_name" -y
    echo
    echo -e $green " • [✓] $package_name installed"
    echo
  fi
}

# Vikaru-Menu
menu() {
    clear
     figlet -f slant "TIGER" | lolcat 
    echo -e $red "=xxxxxxxxxxxxxxxxxxxxxxxxxxxxx×="
    echo -e $biru"  # Select an options [ 1-3 ] :"
    echo -e $red "=××××××××××××××××××××××××××××××="
    echo -e " [1] Install Script"
    echo -e " [2] Update Script"
    echo -e " [3] Create bot directory ( one-time )"
    echo -e " [0] Exit"
    echo
    read -p " # Select > " choice
    
    case "$choice" in
    1)
      # Install All script
      install
      ;;
      2)
      # Update All script
      update
      ;;
    3)
      # Create bot directory
      clear
      echo -e -n $white;figlet "  Mkdir"
      echo -e $white "=----------------------------------="
      echo -e "  Author : TIGER"
      echo -e "  GitHub : wr-tiger"
      sleep 1
      echo
      mkdir /storage/emulated/0/.vikaru-bot
      mv -f vikaru.sh /storage/emulated/0/.vikaru-bot
      mv -f .git /storage/emulated/0/.vikaru-bot
      echo "echo 'Start : cd /storage/emulated/0/.vikaru-bot && bash vikaru.sh'" > "vikaru.sh"
      echo "salin"
      echo -e $white "=----------------------------------="
      echo -e $green " # [✓] mkdir /storage/emulated/0/.vikaru-bot"|pv -qL 30
      sleep 1
      echo -e $green " # [✓] mv vikaru.sh"|pv -qL 30
      echo -e $white "=----------------------------------="
      sleep 2
      echo -e $yellow " # [!] Start this cmd :"
      echo -e $white " "
      echo -e $white " cd /storage/emulated/0/.vikaru-bot && bash vikaru.sh"|pv -qL 30
      exit
      ;;
    0)
      exit 0
      ;;
    *)
      echo
      echo -e $red" # [!] Input denied"|pv -qL 30
      sleep 1
      menu
      ;;
  esac
}


# Vikaru-Install
install() {
    clear
    figlet -f slant "Tiger" | lolcat
    echo -e $red  "=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx="
    echo -e $blue "  # Select an options [ 1-3 ] :"
    echo -e $white"=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx="
    echo -e $green" [1] Ar-Vikaru-Bot"
    echo -e $green" [2] Base-Vikaru-Md"
    echo -e $green" [3] Base-Vikaru-Md_demo"
    echo -e $green" [0] Back"
    echo
    maininstall
}

maininstall() {
    echo -e -n " # Select > "; read pil
    echo
    case $pil in
        1)
            # Install Ar-Vikaru-Bot
            clear
            mkdir -p /storage/emulated/0/.vikaru-bot
            cd /storage/emulated/0/.vikaru-bot
            figlet -f slant "Tiger" | lolcat
            echo -e $red "_________________________________"
            echo -e $green "  Author : TIGER"
            echo -e $green "  GitHub : wr-tiger"
            sleep 1
            echo
            echo -e $green " • [/] Install Ar-Vikaru-Bot...."|pv -qL 30
            sleep 1
            echo -e $white
            git clone https://github.com/Maxz-09/ar-vikaru-bot
            sleep 1
            echo
            echo -e $green " # [✓] Successfully"|pv -qL 30
            sleep 2
            install
            ;;
        2)
            # Install Base-Vikaru-Md
            clear
            mkdir -p /storage/emulated/0/.vikaru-bot
            cd /storage/emulated/0/.vikaru-bot
            figlet -f slant "Tiger" | lolcat
            echo -e $red  "________________________________"
            echo -e $green"  Author : TIGER"
            echo -e $green"  GitHub : wr-tiger"
            sleep 1
            echo
            echo -e $yellow " • [/] Installing Bot...."|pv -qL 30
            echo -e $white " "
            git clone https://github.com/Maxz-09/base-vikaru-md
            sleep 1
            echo
            cd /storage/emulated/0/.vikaru-bot/base-vikaru-md
            echo -e $green " • [/] Unzip node_modules...."|pv -qL 30
            sleep 2
            echo -e $white " "
            unzip "node_modules.zip"
            sleep 1
            echo
            echo -e $green " # [✓] Successfully"|pv -qL 30
            sleep 2
            install
            ;;
        3)
            # Install Base-Vikaru-Md_demo
            clear
            mkdir -p /storage/emulated/0/.vikaru-bot
            cd /storage/emulated/0/.vikaru-bot
            figlet -f slant "Tiger" | lolcat
            echo -e $red "______________________________"
            echo -e $green"  Author : TIGER"
            echo -e $green"  GitHub : wr-tiger"
            sleep 1
            echo ""
            echo -e $yellow " • [/] Installing Bot...."|pv -qL 30
            echo -e $white " "
            git clone https://github.com/Maxz-09/base-vikaru-md_demo
            sleep 1
            echo ""
            cd /storage/emulated/0/.vikaru-bot/base-vikaru-md_demo
            echo -e $yellow " • [/] Unzip node_modules...."|pv -qL 30
            sleep 2
            echo -e $white " "
            unzip "node_modules.zip"
            sleep 1
            echo ""
            echo -e $green " # [✓] Successfully"|pv -qL 30
            sleep 2
            install
            ;;
        0)
            clear
            echo -e $green" # [✓] Back"
            menu
            ;;
        *)
            echo -e $red" # [!] Invalid input"|pv -qL 30
            sleep 1
            install
            ;;
    esac
}

install


# Vikaru-Update
update() {
    clear
     figlet -f slant "Tiger" | lolcat
    echo -e $white "=------------------------------="
    echo -e "  # Select an options [ 1-4 ] :"
    echo -e $white "=------------------------------="
    echo -e " [1] Vikaru.sh"
    echo -e " [2] Ar-Vikaru-Bot"
    echo -e " [3] Base-Vikaru-Md"
    echo -e " [4] Base-Vikaru-Md_demo"
    echo -e " [0] Back"
    echo
    mainupdate
}

# Main update   
mainupdate() {
    echo -e -n " # Select > ";read pil
    echo
if [ $pil == "1" ];then
    # Update vikaru.sh
    echo -e $yellow " # [/] Update..."|pv -qL 30
    echo -e $white "=----------------------------------="
    echo -e $green " • [/] Vikaru-Menu :"
    echo -e $white " "
    cd /storage/emulated/0/.vikaru-bot/
    git config --global --add safe.directory /storage/emulated/0/.vikaru-bot/
    git pull
    echo -e $white "=----------------------------------="
    sleep 1
    echo -e $green " # [✓]  Succssesfully"|pv -qL 30
    sleep 2
    update
elif [ $pil == "2" ];then
    # Update Ar-Vikaru-Bot
    echo -e $yellow " # [/] Update..."|pv -qL 30
    echo -e $white "=----------------------------------="
    echo -e $green " • [/] Ar-Vikaru-Bot :"
    echo -e $white
    cd /storage/emulated/0/.vikaru-bot/ar-vikaru-bot
    git config --global --add safe.directory /storage/emulated/0/.vikaru-bot/ar-vikaru-bot/
    git pull
    echo -e $white "=----------------------------------="
    sleep 1
    echo -e $green " # [✓]  Succssesfully"|pv -qL 30
    sleep 2
    update
elif [ $pil == "3" ];then
    # Update Base-Vikaru-Md
    echo -e $yellow " # [/] Update..."|pv -qL 30
    echo -e $white "=----------------------------------="
    echo -e $green " • [/] Ar-Vikaru-Md :"
    echo -e $white
    cd /storage/emulated/0/.vikaru-bot/base-vikaru-md
    git config --global --add safe.directory /storage/emulated/0/.vikaru-bot/base-vikaru-md/
    git pull
    echo -e $white "=----------------------------------="
    sleep 1
    echo -e $green " # [✓]  Succssesfully"|pv -qL 30
    sleep 2
    update
elif [ $pil == "4" ];then
    # Update Base-Vikaru-Md_demo
    echo -e $yellow " # [/] Update..."|pv -qL 30
    echo -e $white "=----------------------------------="
    echo -e $green " • [/] Ar-Vikaru-Md_demo :"
    echo -e $white
    cd /storage/emulated/0/.vikaru-bot/base-vikaru-md_demo
    git config --global --add safe.directory /storage/emulated/0/.vikaru-bot/base-vikaru-md_demo/
    git pull
    echo -e $white "=----------------------------------="
    sleep 1
    echo -e $green " # [✓]  Succssesfully"|pv -qL 30
    sleep 2
    update
elif [ $pil == "0" ];then
    clear
    echo -e $green" # [✓] Back"
    menu
else
    echo -e $red" # [!] Input denied"|pv -qL 30
    sleep 1
    update
fi
}

# Start
enter
