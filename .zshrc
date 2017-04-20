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
export ZSH=$HOME/.zplug/repos/robbyrussell/oh-my-zsh
export PATH=/Users/nicolas/anaconda/bin:/Users/nicolas/bin:/usr/local/bin:${PATH}

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

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
