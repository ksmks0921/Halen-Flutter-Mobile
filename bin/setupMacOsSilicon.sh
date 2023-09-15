function install_openjdk() {
    openjdk="amazon-corretto-11-aarch64-macos-jdk.pkg"
    curl "https://corretto.aws/downloads/latest/$openjdk" -o $openjdk
    sudo install -pkg $openjdk -target /
    java --version
    rm $openjdk
}

function install_awscli() {
    aws_cli="AWSCLIV2.pkg"
    curl "https://awscli.amazonaws.com/$aws_cli" -o $aws_cli
    sudo installer -pkg $aws_cli -target /
    aws --version
    rm $aws_cli
}

function install_flutter() {
    git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter
    echo PATH=\"\${PATH}:\${HOME}/flutter/bin\" >> ~/.zprofile
    echo export PATH >> ~/.zprofile
    source ~/.zprofile
    flutter doctor  --android-licenses
    flutter doctor
}

sudo softwareupdate --install-rosetta --agree-to-license
brew install cocoapods
install_openjdk
install_awscli
install_flutter