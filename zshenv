# ~/.zshenv

case "`uname -s`" in
  CYGWIN*)
    PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin
    ;;

  Darwin)
    PATH=$PATH:$HOME/bin
    ;;
esac

export EDITOR=vim
export PAGER=less
export PATH
