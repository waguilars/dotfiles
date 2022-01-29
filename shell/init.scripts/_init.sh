
# Source init scripts
for file in "$DOTFILES_PATH/shell/init.scripts"/^_*; do
  source "$file"
done
