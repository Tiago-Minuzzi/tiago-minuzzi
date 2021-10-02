# Set up the prompt
PROMPT="%F{blue}%n%f%F{cyan}@%f%F{magenta}%m%f %F{cyan}%~%f$ "
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

# Enable syntax highlighting and autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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
alias bpy="bpytop"
alias catfas="perl $HOME/sftw/catfasta2phyml/catfasta2phyml.pl -c -f"
alias cfas="grep -c '>'"
alias clo="$HOME/sftw/clustalo-1.2.4"
alias desmon="udisksctl unmount -b"
alias fbg="feh --bg-fill"
alias fproc="ps axf | grep -i"
alias fpup="flatpak update -y"
alias ipy="ipython"
alias jl="jupyter-lab"
alias lsd="lsblk"
alias macse2="java -jar $HOME/sftw/macse/macse_v2.05.jar"
alias mon="udisksctl mount -b"
alias nfet="clear && neofetch"
alias open="xdg-open"
alias ord="sort | uniq -c | sed 's/[ \t]*//;s/ /\t/'"
alias previsao="clear && curl http://wttr.in"
alias rg="ranger"
alias setbr="setxkbmap -layout br -variant abnt2"
alias setus="setxkbmap -layout us -variant intl"
alias sx="startx"
alias tempo="curl 'wttr.in?format=3'"
alias tx="tmux"
alias txa="tmux attach-session -t"
alias txl="tmux list-sessions"
alias xsf="xset s 0 0; xset -dpms; xset s noexpose; xset s noblank"
alias xsq="xset q"
## Arch aliases
#alias limpar_restos="sudo pacman -R $(pacman -Qdtq)"
#alias pmf="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
#alias restos="pacman -Qdtq"
## Fedora aliases
alias dsc="dnf search -C"
alias mkache="sudo dnf makecache"
alias upd="sudo dnf check-update"
