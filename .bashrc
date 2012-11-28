# environment -------------------------------------------------
export HISTSIZE=10000
export EDITOR='vim'

# color the terminal
if [ -f $HOME/.bash_colors ]; then
  source $HOME/.bash_colors
fi
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# aliases -----------------------------------------------------
alias ls="ls"
alias ll="ls -la"
alias la="ls -lach"
alias lsd="ls | grep ^d"
alias nerd='vim -c NERDTree'

alias c='clear'
alias ep='vi $HOME/.bashrc'
alias rp='source $HOME/.bashrc'

fwd_home="$HOME/src/forward"
alias fwd="cd $fwd_home"
alias carweb="cd $fwd_home/uswitch-car-insurance"
alias caragg="cd $fwd_home/car-insurance-aggregator"
alias fwdpup="cd $fwd_home/forward-puppet"
alias fwdami="cd $fwd_home/uswitch-ami-tools"

ghub_home="$HOME/src/github"
alias ghub="cd $ghub_home"
alias dotfiles="cd $ghub_home/dotfiles"

alias hero="cd $HOME/src/heroku"

# git aliases
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias grm='gst | awk '\''/deleted/ {print $3}'\'' | xargs git rm'

# postgresql
alias start_pgsql='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stop_pgsql='pg_ctl -D /usr/local/var/postgres stop -s -m fast'


# rbenv
alias rebundle="rbenv_gd && gem install bundler && bundle install"
function rbenv_gd {
  echo `rbenv gemset delete $(rbenv version | awk '{print $1}') $(basename $(pwd))`
}

# paths -------------------------------------------------------
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/"
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# functions ---------------------------------------------------
  #cat video1.avi video2.avi videon.avi > output.avi
  #mencoder -forceidx -oac copy -ovc copy output.avi -o output_final.avi
  #rm output.avi
  #http://media.stefpause.co.uk/mplayer_osx/mencoder.zip
function avi2mp4 {
  HandBrakeCLI -i $1 -o ${1/.avi/.mp4} --preset="iPad" 
}



# set PS1 with git completions --------------------------------
GIT_PS1_SHOWDIRTYSTATE=true
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
  export PS1='\[\033[01;34m\]\w\[\033[00m\]\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[00m\] \n$ '
fi

eval "$(rbenv init -)"
