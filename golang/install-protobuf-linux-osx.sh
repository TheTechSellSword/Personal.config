#!/bin/bash

# # # TODO :
#           check-if-pkg-exist(){}
#           get-tar-extraction-location(){}

# VARIABLES
tarFileLink="https://github.com/protocolbuffers/protobuf/releases/download/v25.3/protobuf-25.3.tar.gz"
tarFileDownload="protobuf-25.3.tar.gz*"
extractLocation="$HOME/.local"
brcPath="$HOME/.bashrc"
addDirectoryToPath="export PATH=$PATH:/$HOME/.local/bin"

check-if-tar-file-exist(){
    
    if [ -x $1 ]; 
    then
        echo "Tar Found."
        remove-tar-file $2                                              # Remove Previous tar file download
    else
        echo "Tar Not Found."
        download-tar-file $3                                            # Download tar File
    fi
}
remove-tar-file(){
    echo "Do you want to remove previous download? Y/n"
    read answer

    if [[ $answer == "Y" || $answer == "y" ]];
    then
        echo "Removing previous downloads."
        sudo rm -rf $1                                                  # Remove previous tar File
    fi
    
}
download-tar-file(){
    echo "Do you want to download tar file? Y/n"
    read answer

    if [[ $answer == "Y" || $answer == "y" ]];
    then
        echo "Starting Download."
        wget $1                                     # Download tar File
    fi
}
extract-tar-file(){
    echo "Do you want to extract tar file? Y/n"
    read answer

    if [[ $answer == "Y" || $answer == "y" ]];
    then
        echo "Starting extraction"
        sudo tar -C $1 -xzf $2                                          # Change Directory & Extract tar file
    fi
}

cd ~/Downloads                                                          # Change to the ( /Downloads ) Directory
check-if-tar-file-exist $tarFileDownload $tarFileDownload $tarFileLink  # Check if tar file exist
extract-tar-file $extractLocation $tarFileDownload                      # Extract tar file to ( $HOME/.local )

echo $addDirectoryToPath >> $brcPath