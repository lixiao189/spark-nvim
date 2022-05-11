git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install the dependencies on Mac
case $(uname) in
    Darwin)
        brew install prettier
        brew install node@16
        brew install fd
        brew install gnu-sed
        brew install watchman
        brew tap homebrew/cask-fonts
        brew install font-fira-code-nerd-font
        
        # Install python support for neovim
        python3 -m pip install pynvim
    ;;
esac
