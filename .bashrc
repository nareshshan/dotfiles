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
alias ip='ifconfig'
alias piepline='bundle exec rake assets:precompile'

alias c='clear'
alias ep='vi $HOME/.bashrc'
alias rp='source $HOME/.bashrc'

proj_home="$HOME/Projects" 
alias usw="cd $proj_home"
alias carweb="cd $proj_home/car-insurance-web"
alias team="cd $proj_home/team-uswitch"
alias dotfiles="cd $proj_home/dotfiles"

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

# rbenv
alias rebundle="rbenv_gd && gem install bundler && bundle install"
function rbenv_gd {
  echo `rbenv gemset delete $(rbenv version | awk '{print $1}') $(basename $(pwd))`
}

# paths -------------------------------------------------------
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/"
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# set PS1 with git completions --------------------------------
GIT_PS1_SHOWDIRTYSTATE=true
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
  export PS1='\[\033[01;34m\]\w\[\033[00m\]\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[00m\] \n$ '
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
