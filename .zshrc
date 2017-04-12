###############
# Zplug init
###############
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

###############
# PATHS
###############
export PATH=/Users/nicolas/anaconda/bin:/Users/nicolas/bin:/usr/local/bin:${PATH}
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export ZSH=$HOME/.zplug/repos/robbyrussell/oh-my-zsh
export EDITOR=atom

###############
# Zplug plugins
###############

autoload colors && colors
setopt prompt_subst

#zplug "junegunn/fzf-bin", \
#    from:gh-r, \
#    as:command, \
#    rename-to:fzf, \
#    use:"*darwin*amd64*"

zplug "plugins/brew", from:oh-my-zsh, nice:10
zplug "plugins/brew-cask", from:oh-my-zsh, nice:10
zplug "plugins/git",   from:oh-my-zsh, nice:10
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]", nice:10
zplug "plugins/colorize", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:19
zplug "zplug/zplug"
zplug "b4b4r07/enhancd", use:enhancd.sh, nice:15

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "oskarkrawczyk/honukai-iterm-zsh", nice:15
#zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source packages and add commands to $PATH
zplug load


###############
# Aliases
###############
alias DIGITRACK='cd ~/Dropbox/Work/ENS/DIGITRACK'
alias TOOLBOX='cd ~/Toolboxes/'
alias WORK='cd ~/Dropbox/Work/'
alias ZSHCONFIG='open ~/.zshrc'
alias wakeNAS='wakeonlan -i 192.168.1.101 00:11:32:52:2C:39'
alias wakeMAC='wakeonlan -i 192.168.1.105 ac:87:a3:21:b2:5d'
alias sshCortex='ssh -x -p 10103 nicolas@90.63.252.134'
