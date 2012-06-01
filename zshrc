## .zshrc

OS=`uname -o`

## Prompts
setopt prompt_subst
setopt no_prompt_cr
PROMPT="[%n@%m %1~]%(!.#.$) "
RPROMPT=' %~'

## Key bindings
bindkey -v              # vi key bindings
bindkey -e              # emacs key bindings
bindkey ' ' magic-space # also do history expansion on space
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey -s '^t^a' "screen -xR\n"

## Completion
autoload -U compinit
compinit -u

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ''

# Shift+Tab to complete in reverse order
bindkey "^[[Z" reverse-menu-complete

# Load cached hosts
[ -r ~/.ssh/known_hosts ] && _cache_hosts=($(cut -d ' ' -f 1 ~/.ssh/known_hosts | sed -e 's/,/ /'))

# Enable extended glob
setopt extended_glob

## History
setopt extended_history append_history
setopt hist_ignore_dups hist_ignore_space
setopt inc_append_history share_history

HISTSIZE=100000
HISTFILESIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

## Terminal
# Disable C-s
setopt no_flow_control

echo_caption() {
  case "$TERM" in
    [xk]term|rxvt|screen*)
      print -nP "\e]0;$1\\C-g"
      ;;
  esac
}

chpwd() {
  case "$TERM" in
    screen*)
      screen -qX chdir "`pwd`" >/dev/null 2>&1
      ;;
  esac
}

precmd() {
  echo_caption %n@%m:%~

  case "$TERM" in
    screen*)
      echo -ne "\ekzsh\e\\"
      ;;
  esac
}

preexec() {
  case "$TERM" in
    screen*)
      local -a cmd; cmd=(${(z)1})
      echo -ne "\ek$cmd[1]\e\\"
      ;;
  esac
}

## Misc
# Use hard limits, except for a smaller stack and no core dumps
if [ "$OS" != "Cygwin" ]; then
  unlimit
  limit stack 8192
  limit core 0
  limit -s
fi

# Autoload all shell functions
for func in $^fpath/*(N-.x:t); autoload $func

# Automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

# Directory Stack
DIRSTACKSIZE=16
setopt auto_pushd pushd_minus pushd_silent pushd_to_home pushd_ignore_dups
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'

# Shell Options
setopt rm_star_silent
setopt auto_cd
setopt ignore_eof
setopt print_eight_bit      # multi character byte
setopt no_beep

[ -z "$LS_COLORS" ] && eval `dircolors -b`

autoload zmv
#alias zmv='noglob zmv -W'

unset OS

# User specific aliases and functions
[ -f ~/.bash_alias ] && source ~/.bash_alias
[ -f ~/.zalias ] && source ~/.zalias
