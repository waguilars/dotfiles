# ------------------------------------------------------------------------------
# Codely theme config
# ------------------------------------------------------------------------------
export CODELY_THEME_MINIMAL=false
export CODELY_THEME_MODE="dark"
export CODELY_THEME_PROMPT_IN_NEW_LINE=false
export CODELY_THEME_PWD_MODE="short" # full, short, home_relative

# ------------------------------------------------------------------------------
# Languages
# ------------------------------------------------------------------------------
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'
export GEM_HOME="$HOME/.gem"
export GOPATH="$HOME/.go"


export SPARK_HOME=/opt/spark
export PYSPARK_PYTHON=/usr/bin/python3


# ------------------------------------------------------------------------------
# Apps
# ------------------------------------------------------------------------------
if [ "$CODELY_THEME_MODE" = "dark" ]; then
  fzf_colors="pointer:#729ECF,bg+:#414868,fg:#7dcfff,fg+:#7aa2f7,hl:#73daca,info:#565f89,header:#f7768e"
else
  fzf_colors="pointer:#db0f35,bg+:#d6d6d6,fg:#808080,fg+:#363636,hl:#8ec07c,info:#928374,header:#fffee3"
fi

export FZF_DEFAULT_OPTS="--color=$fzf_colors --reverse"

# ------------------------------------------------------------------------------
# Path - The higher it is, the more priority it has
# ------------------------------------------------------------------------------
export path=(
  "$HOME/bin"
  "$DOTLY_PATH/bin"
  "$DOTFILES_PATH/bin"
  "$JAVA_HOME/bin"
  "$GEM_HOME/bin"
  "$GOPATH/bin"
  "$HOME/.cargo/bin"
  "/opt/spark/bin"
  "/opt/spark/sbin"
  "/usr/local/opt/ruby/bin"
  "/usr/local/opt/python/libexec/bin"
  "/opt/homebrew/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/bin"
  "/usr/bin"
  "/usr/sbin"
  "/sbin"
)
