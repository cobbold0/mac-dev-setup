# BASE SETUP (docs/base.md)

## Update macOS
System Settings → Software Update

## Install Rosetta (Apple Silicon)
```bash
uname -m
```
If `arm64`:
```bash
softwareupdate --install-rosetta --agree-to-license
```

## Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install Core Tools
```bash
brew install git wget curl
```

## Git Setup
```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## SSH Setup
```bash
ssh-keygen -t ed25519 -C "you@example.com"
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
```

## Terminal Setup
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install zsh-autosuggestions zsh-syntax-highlighting
```

## Workspace
```bash
mkdir -p ~/dev/backend ~/dev/android ~/dev/expirements ~/dev/docs ~/dev/docs
```