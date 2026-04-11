#!/bin/zsh
set -e

install_base=false
install_node=false
install_java=false
install_android=false
install_docker=false
install_apps=false

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
    *)
      echo "Unknown option: $arg"
      exit 1
      ;;
  esac
done

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

echo "Done. Run: source ~/.zshrc"