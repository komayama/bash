alias ls='ls -G'
export PATH="/usr/local/share/npm/bin:$PATH"
export LSCOLORS=gafxcxdxbxegedabagacad
eval "$(rbenv init -)"
eval export PATH="/Users/k-mayama/.pyenv/shims:${PATH}"
export PYENV_SHELL=bash
source '/usr/local/Cellar/pyenv/1.0.7/libexec/../completions/pyenv.bash'
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")";;
  *)
    command pyenv "$command" "$@";;
  esac
}

if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# git ps1
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[33m\]\t \[\033[36m\]\u \[\033[32m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]$ '
