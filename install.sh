# Download the vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install the dependencies on Mac
case $(uname) in
    Darwin)
        brew install node@16
        brew install fzf
        brew install ag
        brew install watchman
        brew tap homebrew/cask-fonts
        brew install font-fira-code-nerd-font
    ;;
esac
