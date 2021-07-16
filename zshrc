# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/tiago/.oh-my-zsh"
# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"
# Use colors for less, man, etc.
[ -f ~/.LESS_TERMCAP ] && . ~/.LESS_TERMCAP

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="gnzh"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh
# Added by Tiago Minuzzi
RPROMPT="%T"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
## Aliases
alias bpy="bpytop"
alias catfas="perl $HOME/sftw/catfasta2phyml/catfasta2phyml.pl -c -f"
alias cfas="grep -c '>'"
alias clo="$HOME/sftw/clustalo-1.2.4"
alias desmon="udisksctl unmount -b"
alias fproc="ps axf | grep -i"
alias fpup="flatpak update -y"
alias ipy="ipython"
alias jl="jupyter-lab"
alias kw="xset s noblank; xset s off; xset -dpms"
alias limpar_restos="sudo pacman -R $(pacman -Qdtq)"
alias lsd="lsblk"
alias macse2="java -jar $HOME/sftw/macse/macse_v2.05.jar"
alias mon="udisksctl mount -b"
alias nfet="clear && neofetch"
alias open="xdg-open"
alias ord="sort | uniq -c | sed 's/[ \t]*//;s/ /\t/'"
alias pmf="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias previsao="clear && curl http://wttr.in"
alias restos="pacman -Qdtq"
alias rg="ranger"
alias setus="setxkbmap -layout us -variant intl"
alias setbr="setxkbmap -layout br -variant abnt2"
alias sx="startx"
alias tempo="curl 'wttr.in?format=3'"
## Paths
export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$HOME/sftw/ncbi-blast-2.11.0+/bin/"
# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
