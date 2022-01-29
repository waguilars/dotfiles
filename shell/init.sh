# This is a useful file to have the same aliases/functions in bash and zsh

source "$DOTFILES_PATH/shell/aliases.sh"
source "$DOTFILES_PATH/shell/exports.sh"
source "$DOTFILES_PATH/shell/functions.sh"

# Source init scripts
for file in "$DOTFILES_PATH/shell/init.scripts"/*; do
  source "$file"
done
