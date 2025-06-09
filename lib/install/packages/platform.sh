# ------------------------------------------------------
# Select platform
# ------------------------------------------------------
_writeLogHeader "Platform"

# Select the platform if not defined with parameter
if [ -z $install_platform ]; then
    _writeMessage "Please select your platform to install the ML4W Dotfiles."
    if _checkCommandExists "gum"; then
        echo
        install_platform=$(gum choose "arch" "fedora" "opensuse" "CANCEL")
    else
        echo
        echo "1: arch"
        echo "2: fedora"
        echo "3: opensuse"
        echo "0: CANCEL"
        echo
        while true; do
            read -p "Please select your platform: " yn
            case $yn in
                1*)
                    install_platform="arch"
                    break
                    ;;
                2*)
                    install_platform="fedora"
                    break
                    ;;
                3*)
                    install_platform="opensuse"
                    break
                    ;;
                0*)
                    echo ":: Installation canceled"
                    exit
                    break
                    ;;
                *)
                    echo ":: Please select your platform."
                    ;;
            esac
        done
    fi
fi

# Check if platform is supported
case $install_platform in
    arch)
        _writeLogTerminal 0 "Installation on Arch based platform"
        ;;
    fedora)
        _writeLogTerminal 0 "Installation on Fedora based platform"
        ;;
    opensuse)
        _writeLogTerminal 0 "Installation on OpenSUSE based platform"
        ;;
    CANCEL)
        _writeCancel
        exit
        ;;
    *)
        _writeCancel
        exit
        ;;
esac
echo
