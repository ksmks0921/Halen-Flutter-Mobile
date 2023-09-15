function install_aws_cl() {
    $aws_cli = "AWSCLIV2.msi"
    curl "https://awscli.amazonaws.com/$aws_cli" -o $aws_cli
    Start-Process msiexec -ArgumentList "/i $aws_cli /passive" -PassThru -Wait
    Remove-Item $aws_cli
}

function install_openjdk() {
    $corretto = "amazon-corretto-11-x64-windows-jdk.msi"
    Start-Process msiexec -ArgumentList "/i $corretto /passive" -PassThru -Wait
    Remove-Item $corretto
}

function install_flutter() {
    git clone https://github.com/flutter/flutter.git -b stable C:/flutter
    $Path = [Environment]::GetEnvironmentVariable("PATH", "Machine") + [IO.Path]::PathSeparator + "C:/flutter/bin"
    [Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
    flutter doctor  --android-licenses
    flutter doctor
}

install_openjdk
install_aws_cli
install_flutter