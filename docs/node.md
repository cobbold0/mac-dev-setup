# NODE SETUP (docs/node.md)

## Install nvm
```bash
brew install nvm
mkdir -p ~/.nvm
```

Add to ~/.zshrc:
```bash
export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"
```

Reload:
```bash
source ~/.zshrc
```

## Install Node
```bash
nvm install --lts
nvm use --lts
```

## Verify
```bash
node -v
npm -v
```
