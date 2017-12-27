
# Proca© Customized .bashrc
# Credits to https://github.com/webpro/dotfiles

# Stop if not runnning interactively
[ -z "$PS1" ] && return

# Resolve source directory
READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
else
  echo "Unable to find dotfiles, exiting."
  return
fi

DOTFILES_SUBDIRS="system"

# Source all dotfiles
for SUB in $DOTFILES_SUBDIRS; do
  for DOTFILE in `find $DOTFILES_DIR/$SUB`; do
    if [ "$DOTFILE" != "$SCRIPT_PATH" ]; then
      [ -f "$DOTFILE" ] && source "$DOTFILE"
    fi
  done 
done

# Load dependencies
[ -f ~/.fzf.bash ] && source ~/.fzf.bash