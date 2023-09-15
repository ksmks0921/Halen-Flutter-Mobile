function install_awscli() {
    filename="awscliv2.zip"
    sudo apt update
    sudo apt install unzip -y
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$filename"
    unzip $filename
    sudo ./aws/install --update
    aws --version
    rm $filename
}

function install_flutter() {
    git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter
    echo PATH=\"\${PATH}:\${HOME}/flutter/bin\" >> ~/.zprofile
    echo export PATH >> ~/.zprofile
    source ~/.zprofile
    flutter doctor  --android-licenses
    flutter doctor
}

install_awscli
install_flutter