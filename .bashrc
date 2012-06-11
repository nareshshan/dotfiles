# environment -------------------------------------------------

# scm
export EDITOR='vim'

# color the terminal
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# aliases -----------------------------------------------------

# general
alias la="ls -lach"
alias lsd="ls | grep ^d"
alias c='clear'
alias cls='c'
alias rp='source $HOME/.bashrc'
alias nerd='vim -c NERDTree'

# git aliases
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias glg='git log --pretty=oneline'

# postgresql
alias start_pgsql='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stop_pgsql='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# paths -------------------------------------------------------
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/"
export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# functions ---------------------------------------------------
function avis2mp4s {
  for FILE in $(ls *.avi); do avi2mp4 $FILE; done
}

function avi2mp4 {
  HandBrakeCLI -i $1 -o ${1/.avi/.mp4} --preset="iPad" 
}

#cat video1.avi video2.avi videon.avi > output.avi
#mencoder -forceidx -oac copy -ovc copy output.avi -o output_final.avi
#rm output.avi
#http://media.stefpause.co.uk/mplayer_osx/mencoder.zip

# set PS1 with git completions --------------------------------
GIT_PS1_SHOWDIRTYSTATE=true
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash;
  export PS1='\[\033[01;34m\]\w\[\033[00m\]\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[00m\] \n$ '
fi

# rbenv
eval "$(rbenv init -)"