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

psgp() {
    ps axf | grep "$1" | grep -v grep
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
bindkey '^?' backward-delete-char
bindkey "^R" history-incremental-search-backward
# search history on the related term only
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTDUP=erase # remove duplicates
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

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
eval "$(fzf --zsh)" # use fzf to search history with ^R
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
alias bpw="bat --wrap never -p"
alias bpy="bpytop"
alias cac="conda activate"
alias catfas="perl $HOME/sftw/catfasta2phyml/catfasta2phyml.pl -c -f"
alias cdc="conda deactivate"
alias cdwm="sudo rm config.h && sudo make clean install"
alias cfas="grep -c '>'"
alias clk="tty-clock -c -C 4 -b -B"
alias clo="$HOME/sftw/clustalo-1.2.4"
alias desmon="udisksctl unmount -b"
alias fbg="feh --bg-fill"
alias fproc="ps axf | grep -i"
alias fpup="flatpak update -y"
alias gta="git add"
alias gtac="git commit -am"
alias gtb="git checkout -b"
alias gtc="git commit -m"
alias gtd="git diff"
alias gtl="git log"
alias gto="git checkout"
alias gtp="git push"
alias gtr="git rebase"
alias gts="git status"
alias gtu="git pull"
alias icat="kitty icat"
alias igp="grep -i"
alias ipy="ipython"
alias isup="ping -c 3 archlinux.org"
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
alias pxs="asciiquarium"
alias rbt="reboot"
alias renv="conda activate renv"
alias rgr="ranger"
alias setbr="setxkbmap -layout br -variant abnt2"
alias setus="setxkbmap -layout us -variant intl"
alias setwp="feh --bg-fill"
alias sfrmd="udisksctl power-off -b"
alias spy="nohup spyder >& /dev/null"
alias sx="startx"
alias tempo="curl 'wttr.in?format=3'"
alias tx="tmux"
alias txa="tmux attach-session -t"
alias txl="tmux list-sessions"
alias txn="tmux new-session -s"
alias vpn="sudo openfortivpn -c .config/openfortivpn/config"
alias vsci="source /home/tiago/sftw/venv/sci/bin/activate"
alias xsf="xset s 0 0; xset -dpms; xset s noexpose; xset s noblank"
alias xsq="xset q"

export PATH="/home/tiago/.local/bin:$PATH"
export PATH="/home/tiago/sftw/ncbi-blast-2.12.0+/bin:$PATH"
export PATH="/home/tiago/sftw/sratoolkit/bin:$PATH"
export MANPAGER="nvim +Man!"
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
    rndFetch 2> /dev/null
fi

# Set terminfo if terminal is kitty to avoid issues when sshing
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"
# shellcheck shell=bash

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
\builtin typeset -ga precmd_functions
\builtin typeset -ga chpwd_functions
# shellcheck disable=SC2034,SC2296
precmd_functions=("${(@)precmd_functions:#__zoxide_hook}")
# shellcheck disable=SC2034,SC2296
chpwd_functions=("${(@)chpwd_functions:#__zoxide_hook}")
chpwd_functions+=(__zoxide_hook)

# Report common issues.
function __zoxide_doctor() {
    [[ ${_ZO_DOCTOR:-1} -ne 0 ]] || return 0
    [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] || return 0

    _ZO_DOCTOR=0
    \builtin printf '%s\n' \
        'zoxide: detected a possible configuration issue.' \
        'Please ensure that zoxide is initialized right at the end of your shell configuration file (usually ~/.zshrc).' \
        '' \
        'If the issue persists, consider filing an issue at:' \
        'https://github.com/ajeetdsouza/zoxide/issues' \
        '' \
        'Disable this message by setting _ZO_DOCTOR=0.' \
        '' >&2
}

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

# Jump to a directory using only keywords.
function __zoxide_z() {
    __zoxide_doctor
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
        __zoxide_cd "$1"
    elif [[ "$#" -eq 2 ]] && [[ "$1" = "--" ]]; then
        __zoxide_cd "$2"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" && __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    __zoxide_doctor
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

function z() {
    __zoxide_z "$@"
}

function zi() {
    __zoxide_zi "$@"
}

# Completions.
if [[ -o zle ]]; then
    __zoxide_result=''

    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

        if [[ "${#words[@]}" -eq 2 ]]; then
            # Show completions for local directories.
            _cd -/

        elif [[ "${words[-1]}" == '' ]]; then
            # Show completions for Space-Tab.
            # shellcheck disable=SC2086
            __zoxide_result="$(\command zoxide query --exclude "$(__zoxide_pwd || \builtin true)" --interactive -- ${words[2,-1]})" || __zoxide_result=''

            # Set a result to ensure completion doesn't re-run
            compadd -Q ""

            # Bind '\e[0n' to helper function.
            \builtin bindkey '\e[0n' '__zoxide_z_complete_helper'
            # Sends query device status code, which results in a '\e[0n' being sent to console input.
            \builtin printf '\e[5n'

            # Report that the completion was successful, so that we don't fall back
            # to another completion function.
            return 0
        fi
    }

    function __zoxide_z_complete_helper() {
        if [[ -n "${__zoxide_result}" ]]; then
            # shellcheck disable=SC2034,SC2296
            BUFFER="z ${(q-)__zoxide_result}"
            __zoxide_result=''
            \builtin zle reset-prompt
            \builtin zle accept-line
        else
            \builtin zle reset-prompt
        fi
    }
    \builtin zle -N __zoxide_z_complete_helper

    [[ "${+functions[compdef]}" -ne 0 ]] && \compdef __zoxide_z_complete z
fi

# =============================================================================
#
# To initialize zoxide, add this to your shell configuration file (usually ~/.zshrc):
#
# eval "$(zoxide init zsh)"
