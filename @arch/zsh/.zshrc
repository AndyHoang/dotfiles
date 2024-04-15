# Path to your oh-my-zsh installation.
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"
# Uncomment the following line to disable bi-weekly auto-update checks.
 #DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


#plugins=(git fzf fzf-tab z ssh-agent kubectl zsh-autosuggestions)
plugins=(git ssh-agent ssm fzf)

zstyle :omz:plugins:ssh-agent identities id_ed25519 id_ed25519_github
zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519

source $ZSH/oh-my-zsh.sh


# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8
#Although the other questions list bash methods, they alias cd. Bash provides an inherent method that chains off just the prompt.

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# now using nvim for few months
alias vi="nvim"
# Some copy utils
# alias update='sudo pacman -Syyu' # use yay instead

#readable output
alias df='df -h'

#continue download
alias wget="wget -c"

#ps
#alias ps="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias fc='sudo fc-cache -fv'

#quickly kill conkies
alias kc='killall conky'

#hardware info --short
alias hw="hwinfo --short"

#get fastest mirrors in your neighborhood 
alias mirror="sudo reflector  --download-timeout 2 --connection-timeout 2 --number 10 --country vn   --thread 4 --verbose --save /etc/pacman.d/mirrorlist"
#alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
#alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
#alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
#alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

#mounting the folder Public for exchange between host and guest on virtualbox
#alias vbm="sudo mount -t vboxsf -o rw,uid=1000,gid=1000 Public /home/$USER/Public"

#youtube-dl
alias yt="youtube-dl -f bestvideo+bestaudio "

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"
#[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh


export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export PATH=$PATH:$HOME/.cargo/bin

# Created by `userpath` on 2020-01-01 04:48:19
export PATH="$PATH:/home/andyhoang/.local/bin"
# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# Use when vi **
_fzf_compgen_path() {
   fd --hidden --follow --exclude ".git" "$1"
}

# Use when cd **
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" "$1"
}


alias lg='lazygit'

eval "$(zoxide init zsh)"

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2023-11-28 04:58:36
export PATH="$PATH:/Users/hoangngocdung/.local/bin"

export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
#eval "$(atuin init zsh --disable-up-arrow)"
#eval "$(pyenv virtualenv-init -)"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
