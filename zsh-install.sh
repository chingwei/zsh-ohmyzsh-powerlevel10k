#!/bin/bash
setup_color() {
  FMT_RED=$(printf '\033[31m')
  FMT_GREEN=$(printf '\033[32m')
  FMT_YELLOW=$(printf '\033[33m')
  FMT_BLUE=$(printf '\033[34m')
  FMT_BOLD=$(printf '\033[1m')
  FMT_RESET=$(printf '\033[0m')
}
main() {
    setup_color

    echo "\n${FMT_YELLOW}(1). checking brew. \n----------------------------------------------------------------${FMT_RESET}"
    if command -v brew &> /dev/null
    then
        echo "${FMT_GREEN}brew already installed.${FMT_RESET}"
    else
        echo "${FMT_RED}start install brew. ${FMT_RESET}"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    
    echo "\n${FMT_YELLOW}(2). install oh-my-zsh \n----------------------------------------------------------------${FMT_RESET}"
    if [ -d $HOME/.oh-my-zsh ]; then
        echo "${FMT_GREEN}oh-my-zsh already exist.${FMT_RESET}"
    else
        echo "${FMT_RED}start install oh-my-zsh. ${FMT_RESET}"
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
    
    echo "\n${FMT_YELLOW}(3). change to zsh \n----------------------------------------------------------------${FMT_RESET}"
    if [[ $SHELL == *"zsh" ]]; then
        echo "${FMT_GREEN}already using zsh.${FMT_RESET}"
    else
        echo "${FMT_RED}start change shell to zsh. ${FMT_RESET}"
        chsh -s /bin/zsh
    fi
    

    echo "\n${FMT_YELLOW}(4). install powerlevel10k \n----------------------------------------------------------------${FMT_RESET}"
    if [[ -d "$HOME/powerlevel10k" ]]; then
        echo "${FMT_GREEN}powerlevel10k already exist .${FMT_RESET}"
    else
        echo "${FMT_RED}start install powerlevel10k. ${FMT_RESET}"
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
        echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    fi
    

    echo "\n${FMT_YELLOW}(5). install plugin \n----------------------------------------------------------------${FMT_RESET}"
    if [[ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
        echo "${FMT_GREEN}zsh-syntax-highlighting already exist .${FMT_RESET}"
    else
        echo "${FMT_RED}start install zsh-syntax-highlighting. ${FMT_RESET}"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    fi
    if [[ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
        echo "${FMT_GREEN}zsh-autosuggestions already exist .${FMT_RESET}"
    else
        echo "${FMT_RED}start install zsh-autosuggestions. ${FMT_RESET}"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi
    
    echo "\n${FMT_YELLOW}(6). update ~/.zshrc plugins \n----------------------------------------------------------------${FMT_RESET}"
    # add plugins to .zshrc.
    # Notic: unix are different from linux when exec sed command. On Mac should add "" behind -i
    sed -i "" 's/^plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' $HOME/.zshrc
    echo "${FMT_GREEN}updated plugins in .zshrc.${FMT_RESET}"

    echo "\n${FMT_YELLOW}Congres, install finished.${FMT_RESET}"
}

main "$@"
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh