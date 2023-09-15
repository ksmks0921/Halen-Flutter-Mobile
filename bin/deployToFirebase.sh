function verify_firebase_installation() {
    firebase_version=$(firebase --version)
    if [[ $firebase_version ]]; then
        echo "firebase $firebase_version installed"
    else
        npm install -g npm firebase-tools || sudo npm install -g npm firebase-tools
    fi
}

verify_firebase_installation
firebase experiments:enable webframeworks
firebase init hosting
firebase deploy