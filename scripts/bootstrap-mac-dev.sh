#!/bin/zsh
set -e

install_base=false
install_node=false
install_java=false
install_android=false
install_docker=false
install_apps=false

usage() {
  cat <<'EOF'
Usage: ./scripts/bootstrap-mac-dev.sh [options]

Options:
  --base       Install core CLI tools and create workspace folders
  --node       Install nvm and configure shell support
  --java       Install OpenJDK 17 and configure JAVA_HOME
  --android    Install Android Studio and Android shell variables
  --docker     Install Docker Desktop
  --apps       Install common GUI apps
  --all        Install everything above
  --help       Show this help message
EOF
}

for arg in "$@"; do
  case "$arg" in
    --base) install_base=true ;;
    --node) install_node=true ;;
    --java) install_java=true ;;
    --android) install_android=true ;;
    --docker) install_docker=true ;;
    --apps) install_apps=true ;;
    --all)
      install_base=true
      install_node=true
      install_java=true
      install_android=true
      install_docker=true
      install_apps=true
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $arg"
      echo
      usage
      exit 1
      ;;
  esac
done

if [ "$#" -eq 0 ]; then
  usage
  exit 0
fi

if [ "$install_android" = true ]; then
  install_java=true
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Install Homebrew first."
  exit 1
fi

ZSHRC="$HOME/.zshrc"
touch "$ZSHRC"

append_if_missing() {
  grep -Fqx "$1" "$ZSHRC" || echo "$1" >> "$ZSHRC"
}

mkdir -p "$HOME/dev/projects" "$HOME/dev/scratch" "$HOME/dev/scripts"

if [ "$install_base" = true ]; then
  brew install git wget curl
fi

if [ "$install_node" = true ]; then
  brew install nvm
  mkdir -p "$HOME/.nvm"
  append_if_missing 'export NVM_DIR="$HOME/.nvm"'
  append_if_missing 'source "$(brew --prefix nvm)/nvm.sh"'
fi

if [ "$install_java" = true ]; then
  brew install openjdk@17
  append_if_missing 'export JAVA_HOME=$(/usr/libexec/java_home -v 17)'
  append_if_missing 'export PATH="$JAVA_HOME/bin:$PATH"'
fi

if [ "$install_android" = true ]; then
  brew install --cask android-studio
  append_if_missing 'export ANDROID_HOME="$HOME/Library/Android/sdk"'
  append_if_missing 'export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"'
  append_if_missing 'export PATH="$PATH:$ANDROID_HOME/platform-tools"'
  append_if_missing 'export PATH="$PATH:$ANDROID_HOME/emulator"'
  append_if_missing 'export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"'
fi

if [ "$install_docker" = true ]; then
  brew install --cask docker
fi

if [ "$install_apps" = true ]; then
  brew install --cask visual-studio-code iterm2 postman
fi

step=1

echo "Done."
echo "Next steps:"
echo "  $step. Run: source ~/.zshrc"
step=$((step + 1))
if [ "$install_android" = true ]; then
  echo "  $step. Open Android Studio and install SDK components from the SDK Manager"
  step=$((step + 1))
fi
if [ "$install_docker" = true ]; then
  echo "  $step. Open Docker Desktop from Applications before running docker commands"
fi
