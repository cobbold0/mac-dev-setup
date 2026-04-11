# Node.js Setup

Use `nvm` so you can switch Node.js versions per project when needed.

## 1. Install nvm

```bash
brew install nvm
mkdir -p ~/.nvm
```

Add this to `~/.zshrc`:

```bash
export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"
```

Reload your shell:

```bash
source ~/.zshrc
```

## 2. Install the Latest LTS Release

```bash
nvm install --lts
nvm use --lts
```

Optional: make LTS your default version:

```bash
nvm alias default 'lts/*'
```

## 3. Verify

```bash
node -v
npm -v
```
