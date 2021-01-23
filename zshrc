# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
bindkey "^[[3~" delete-char

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tiago/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# My PS1
RPROMPT="%T"
# Prevent ssh dialog box
unset SSH_ASKPASS
#PS1="\u:\w$ "
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
zstyle ':completion:*' menu select
# Paths
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/bin/appimages:$PATH"
export PATH="$HOME/sftw/ncbi-blast-2.10.1+/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/sftw/sratoolkit/bin:$PATH"
# Aliases
alias update="sudo dnf check-update"
alias upgrade="sudo dnf upgrade -y"
alias autoremove="sudo dnf autoremove"
alias clean="sudo dnf clean all"
alias open="xdg-open"
alias lsz="ls --human-readable --size -1 -S --classify"
alias cpz="rsync -ah --info=progress2"
alias cfas="grep -c '>'"
alias lsdir="ls -d */"
alias fpu="flatpak update -y"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tiago/sftw/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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
# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}
