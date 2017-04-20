###############
# Zplug init
###############
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update
fi
source ~/.zplug/init.zsh


###############
# PATHS
###############

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=/Users/nicolas/anaconda/bin:/Users/nicolas/bin:/usr/local/bin:${PATH}
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export ZSH=$HOME/.zplug/repos/robbyrussell/oh-my-zsh
export EDITOR=atom

###############
# Zplug plugins
###############

zplugs=()
autoload colors && colors
setopt prompt_subst

zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]", defer:2
zplug "plugins/colorize", from:oh-my-zsh
zplug "zsh-users/zsh-completions", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/enhancd", use:enhancd.sh, defer:3
zplug "zplug/zplug"

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/spectrum", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "oskarkrawczyk/honukai-iterm-zsh", as:theme, defer:3

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

alias dgt='cd ~/Dropbox/Work/ENS/DIGITRACK'
alias bci='cd ~/Dropbox/Work/ENS/BCI'
alias tb='cd ~/Toolboxes/'
alias work='cd ~/Dropbox/Work/ENS'
alias zshconfig='open ~/.zshrc'
alias wakeNAS='wakeonlan -i 192.168.1.101 00:11:32:52:2C:39'
alias wakeMAC='wakeonlan -i 192.168.1.105 ac:87:a3:21:b2:5d'
alias sshCortex='ssh -x -p 10103 nicolas@90.63.252.134'
alias BREWERY='brew update; brew upgrade `brew outdated`; brew cleanup'
alias SERPENT='conda update conda; conda update anaconda; conda clean -tp'
