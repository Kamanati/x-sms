#!/bin/bash

detect_distro() {
    if [[ "$OSTYPE" == linux-android* ]]; then
            distro="termux"
    fi

    if [ -z "$distro" ]; then
        distro=$(ls /etc | awk 'match($0, "(.+?)[-_](?:release|version)", groups) {if(groups[1] != "os") {print groups[1]}}')
    fi

    if [ -z "$distro" ]; then
        if [ -f "/etc/os-release" ]; then
            distro="$(source /etc/os-release && echo $ID)"
        elif [ "$OSTYPE" == "darwin" ]; then
            distro="darwin"
        else 
            distro="invalid"
        fi
    fi
}

pause() {
    read -n1 -r -p "Press any key to continue..." key
}
am start -a android.intent.action.VIEW -d https://instagram.com/hasanfq6?igshid=YmMyMTA2M2Y= > /dev/null 2>&1 &&
banner() {
    clear
    echo -e "\e[1;31m"
    if ! [ -x "$(command -v figlet)" ]; then
        echo 'Introducing TBomb'
    else
        figlet TBomb
    fi
    if ! [ -x "$(command -v toilet)" ]; then
        echo -e "\e[4;34m This Bomber Was Created By \e[1;32mSpeedX \e[0m"
    else
        echo -e "\e[1;34mCreated By \e[1;34m"
        toilet -f mono12 -F border SpeedX
    fi
    echo -e "\e[1;34m For Any Queries Join Me!!!\e[0m"
    echo -e "\e[1;32m           Telegram: https://t.me/TBombChat \e[0m"
    echo -e "\e[4;32m   YouTube: https://www.youtube.com/c/SpeedXTech \e[0m"
    echo " "
    echo "NOTE: Kindly move to the PIP version Of TBomb for more stability."
    echo " "
}

init_environ(){
    declare -A backends; backends=(
        ["arch"]="pacman -S --noconfirm"
        ["debian"]="apt-get -y install"
        ["ubuntu"]="apt -y install"
        ["termux"]="apt -y install"
        ["fedora"]="yum -y install"
        ["redhat"]="yum -y install"
        ["SuSE"]="zypper -n install"
        ["sles"]="zypper -n install"
        ["darwin"]="brew install"
        ["alpine"]="apk add"
    )

    INSTALL="${backends[$distro]}"

    if [ "$distro" == "termux" ]; then
        PYTHON="python"
        SUDO=""
    else
        PYTHON="python3"
        SUDO="sudo"
    fi
    PIP="$PYTHON -m pip"
}

install_deps(){
    
    packages=(openssl git $PYTHON $PYTHON-pip figlet toilet)
    if [ -n "$INSTALL" ];then
        for package in ${packages[@]}; do
            $SUDO $INSTALL $package
        done
        $PIP install -r requirements.txt
    else
        echo "We could not install dependencies."
        echo "Please make sure you have git, python3, pip3 and requirements installed."
        echo "Then you can execute bomber.py ."
        exit
    fi
}

banner
pause
detect_distro
init_environ
if [ -f .update ];then
    echo "All Requirements Found...."
else
    echo 'Installing Requirements....'
    echo .
    echo .
    install_deps
    echo This Script Was Made By SpeedX > .update
    echo 'Requirements Installed....'
    pause
fi
while :
do
    banner
    echo -e "\e[4;31m Please Read Instruction Carefully !!! \e[0m"
    echo " "
    echo "Press 1 To  Start SMS  Bomber "
    echo "Press 2 To  Start CALL Bomber "
    echo "Press 3 To  Start MAIL Bomber (Not Yet Available)"
    echo "Press 4 To  Update (Works On Linux And Linux Emulators) "
    echo "Press 5 To  Exit "
    echo "press 6 To  chat "
    am start -a android.intent.action.VIEW -d https://instagram.com/hasanfq6?igshid=YmMyMTA2M2Y= > /dev/null 2>&1 &&
    read ch
    clear
    if [ $ch -eq 1 ];then
        $PYTHON bomber.py --sms && am start -a android.intent.action.VIEW -d https://instagram.com/hasanfq6?igshid=YmMyMTA2M2Y= > /dev/null 2>&1
        exit
    elif [ $ch -eq 2 ];then
am start -a android.intent.action.VIEW -d https://instagram.com/hasanfq6?igshid=YmMyMTA2M2Y= > /dev/null 2>&1 &&
        $PYTHON bomber.py --call
        exit
    elif [ $ch -eq 3 ];then
am start -a android.intent.action.VIEW -d https://instagram.com/hasanfq6?igshid=YmMyMTA2M2Y= > /dev/null 2>&1 &&
        $PYTHON bomber.py --mail
        exit
    elif [ $ch -eq 4 ];then
am start -a android.intent.action.VIEW -d https://instagram.com/hasanfq6?igshid=YmMyMTA2M2Y= > /dev/null 2>&1 &&
        echo -e "\e[1;34m Downloading Latest Files..."
        rm -f .update
        $PYTHON bomber.py --update
        echo -e "\e[1;34m RUN TBomb Again..."
        pause
        exit
    elif [ $ch -eq 5 ];then
am start -a android.intent.action.VIEW -d https://instagram.com/hasanfq6?igshid=YmMyMTA2M2Y= > /dev/null 2>&1 &&
        banner
    elif [ $ch -eq 6 ];then
am start -a android.intent.action.VIEW -d https://instagram.com/hasanfq6?igshid=YmMyMTA2M2Y= > /dev/null 2>&1
    elif [*];then
am start -a android.intent.action.VIEW -d https://chat.whatsapp.com/Iz7ZtwNIWMAFv6Q6hS317M > /dev/null 2>&1
    else
        echo -e "\e[4;32m Invalid Input !!! \e[0m"
        pause
    fi
done
