# Base Setup

Complete this section before installing language runtimes or platform-specific tools.

## 1. Update macOS

Open `System Settings -> General -> Software Update` and install any pending updates.

## 2. Install Rosetta on Apple Silicon

Check your CPU architecture:

```bash
uname -m
```

If the result is `arm64`, install Rosetta:

```bash
softwareupdate --install-rosetta --agree-to-license
```

## 3. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Verify the install:

```bash
brew --version
```

## 4. Install Core Tools

```bash
brew install git wget curl
```

## 5. Configure Git

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Optional verification:

```bash
git config --global --list
```

## 6. Configure SSH

Generate a key:

```bash
ssh-keygen -t ed25519 -C "you@example.com"
```

Start the agent and add the key:

```bash
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

Copy the public key:

```bash
pbcopy < ~/.ssh/id_ed25519.pub
```

## 7. Set Up Your Terminal

Install Oh My Zsh and useful plugins:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install zsh-autosuggestions zsh-syntax-highlighting
```

Reload your shell if needed:

```bash
source ~/.zshrc
```

## 8. Create Workspace Folders

```bash
mkdir -p ~/dev/projects ~/dev/scratch ~/dev/scripts
```
