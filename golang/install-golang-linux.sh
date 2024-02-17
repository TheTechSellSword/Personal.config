#!/bin/bash/env

check-if-go-is-installed(){
    cd
    if [ /usr/local/go ]; 
    then
        echo "Go is already installed"
        remove-previous-go-installation
    else
        echo "Go is not installed."
    fi
}
remove-previous-go-installation(){
    echo "Do you want to remove previous Go installation?"
    echo "Do you want to download it? Y/n"
    read answer

    if [[ $answer == "Y" || $answer == "y" ]];
    then
        echo "Removing previous Go installation."
        sudo rm -rf /usr/local/go   # Change to ( Home ) Directory and Remove go Directory if it Exists
    else
        echo "Exit program"
    fi
}
check-if-go-tar-file-is-downloaded(){
    cd ~/Downloads                                # Change to the ( /Downloads ) Directory
    if [ go1.22.0.linux-amd64.tar.gz* ]; 
    then
        echo "Download has been found."
        remove-previous-go-tar-file
    else
        echo "No download found."
        download-go-tar-file
    fi
}
remove-previous-go-tar-file(){
    echo "Do you want to remove previously downloaded Go tar file? Y/n"
    read answer

    if [[ $answer == "Y" || $answer == "y" ]];
    then
        echo "Removing previous downloads."
        sudo rm -rf go1.22.0.linux-amd64.tar.gz*  # Remove previous go tar File if it Exists
    else
        echo "Exit program"
    fi
}
download-go-tar-file(){
    echo "Do you want to download it? Y/n"
    read answer

    if [[ $answer == "Y" || $answer == "y" ]];
    then
        echo "Starting Download."
        wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz       # Download the Go Installation to the ( /Downloads ) Directory
    else
        echo "Exit the program."
    fi
}
check-if-exported-path-is-found-in-dot-profile-file(){
    FILE="$HOME/.profile"
    STRING="export PATH=$PATH:/usr/local/go/bin"
    if [[ ! -z $(grep "$STRING" "$FILE") ]];
    then
        echo "Go is already added to PATH."
        #remove-previous-go-path
    else
        echo "Go has not been added to PATH"
        add-go-path-to-profile
    fi

}
# remove-previous-go-path(){
#     echo "Do you want to remove the previous Go path? Y/n"
#     read answer

#     if [[ $answer == "Y" || $answer == "y" ]];
#     then
#         # TODO : Write logic that deletes old PATH using ( sed ) needs to be researched more.
#     else
#         exit 0
#     fi
# }
add-go-path-to-profile(){
    FILE="$HOME/.profile"
    STRING="export PATH=$PATH:/usr/local/go/bin"
    
    echo "Do you want to add $PATH to $FILE? Y/n"
    read answer

    if [[ $answer == "Y" || $answer == "y" ]];
    then
        echo " " >> $FILE
        echo $STRING >> $FILE
    else
        exit 0
    fi
}

check-if-go-is-installed
echo " "
check-if-go-tar-file-is-downloaded
echo " "
download-go-tar-file
echo " "
sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz  # Change to ( /usr/local ) Directory and Extracts the Go tar file
echo " "
cd
check-if-exported-path-is-found-in-dot-profile-file
echo " "


go version
