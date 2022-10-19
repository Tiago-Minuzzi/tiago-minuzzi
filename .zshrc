# Show git branch
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats ' %F{green}[ %b%u%c ]%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{magenta}*%F{green}'
zstyle ':vcs_info:*' stagedstr '%F{yellow}+%F{green}'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
  hook_com[unstaged]+='%F{red}?%F{green}'
fi
}
# Set up the prompt
setopt prompt_subst
PROMPT="%B%F{blue}%n%f%F{cyan}@%f%F{magenta}%m%f %F{cyan}%~%f%b\${vcs_info_msg_0_}$ "$'\n'"%F{blue}%f "
RPROMPT="%T"
#autoload -Uz promptinit
#promptinit

setopt histignorealldups sharehistory
# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Open tmux by default on shell
#[ $TERM != "screen" ] && exec tmux
# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"
# Use colors for less, man, etc.
[ -f ~/.LESS_TERMCAP ] && . ~/.LESS_TERMCAP
# Pywal colors
#cat ~/.cache/wal/sequences
# enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      alias ls='ls --color=auto'
      alias dir='dir --color=auto'
      alias vdir='vdir --color=auto'
      alias grep='grep --color=auto'
      alias fgrep='fgrep --color=auto'
      alias egrep='egrep --color=auto'
  fi
# Enable syntax highlighting and autosuggestions
if grep 'Arch Linux' /etc/os-release > /dev/null;then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    alias limpar_restos="sudo pacman -R $(pacman -Qdtq)"
    alias pmf="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
    alias restos="pacman -Qdtq"
    alias yup="checkupdates"

elif grep 'Fedora' /etc/os-release > /dev/null;then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    alias dsc="dnf search -C"
    alias mkache="sudo dnf makecache"
    alias upd="sudo dnf check-update"
    alias upg="sudo dnf upgrade -y"
fi

# Use modern completion system
autoload -Uz compinit
compinit
#zstyle ':completion:*' menu select=2
#zstyle ':completion:*' menu select=long
eval "$(dircolors -b)"
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:::*:default' menu yes select
# Aliases
alias bp="bat -p"
alias bpy="bpytop"
alias catfas="perl $HOME/sftw/catfasta2phyml/catfasta2phyml.pl -c -f"
alias cdwm="sudo rm config.h && sudo make clean install"
alias cfas="grep -c '>'"
alias clo="$HOME/sftw/clustalo-1.2.4"
alias desmon="udisksctl unmount -b"
alias fbg="feh --bg-fill"
alias fproc="ps axf | grep -i"
alias fpup="flatpak update -y"
alias gta="git add"
alias gtb="git checkout -b"
alias gtac="git commit -am"
alias gtc="git commit -m"
alias gtd="git diff"
alias gtl="git log"
alias gto="git checkout"
alias gtp="git push"
alias gts="git status"
alias gtu="git pull"
alias ipy="ipython"
alias jl="jupyter-lab"
alias jn="jupyter notebook"
alias kat="kitty +kitten icat"
alias kssh="kitty +kitten ssh"
alias ll='exa -l'
alias ls='exa'
alias lsd="lsblk"
alias macse2="java -jar $HOME/sftw/macse/macse_v2.05.jar"
alias mon="udisksctl mount -b"
alias nfet="clear && neofetch"
alias nv="nvim"
alias open="xdg-open"
alias ord="sort | uniq -c | sed 's/[ \t]*//;s/ /\t/' | sort -k1 -h"
alias pch="sudo paccache -r"
alias pmem="sudo ps_mem"
alias previsao="clear && curl http://wttr.in"
alias pwo="poweroff"
alias rbt="reboot"
alias rgr="ranger"
alias setbr="setxkbmap -layout br -variant abnt2"
alias setus="setxkbmap -layout us -variant intl"
alias setwp="feh --bg-fill"
alias sx="startx"
alias tempo="curl 'wttr.in?format=3'"
alias tx="tmux"
alias txa="tmux attach-session -t"
alias txl="tmux list-sessions"
alias txn="tmux new-session -s"
alias vsci="source /home/tiago/sftw/venv/sci/bin/activate"
alias xsf="xset s 0 0; xset -dpms; xset s noexpose; xset s noblank"
alias xsq="xset q"

export PATH="/home/tiago/.local/bin:$PATH"
export PATH="/home/tiago/sftw/ncbi-blast-2.12.0+/bin:$PATH"
export PATH="/home/tiago/sftw/sratoolkit/bin:$PATH"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tiago/sftw/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tiago/sftw/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tiago/sftw/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tiago/sftw/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# Autostart conda env
#conda activate bioinfo
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv &> /dev/null;then
    eval "$(pyenv init --path)"
    eval "$(pyenv init - --no-rehash zsh)"
    eval "$(pyenv virtualenv-init - zsh)"
fi
# Startup fetch art
if which rndFetch &> /dev/null;then
    rndFetch
fi
