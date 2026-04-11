# DOCKER SETUP (docs/docker.md)

## Install Docker Desktop
```bash
brew install --cask docker
```

## Start Docker
Open Docker Desktop from Applications

## Verify
```bash
docker run hello-world
```

---

# 🧪 TROUBLESHOOTING (docs/troubleshooting.md)

## Node not found
```bash
source ~/.zshrc
nvm install --lts
```

## JAVA_HOME not set
```bash
echo $JAVA_HOME
```

## Android SDK not found
```bash
echo $ANDROID_HOME
```

## adb not found
```bash
adb version
```

## Docker not working
Ensure Docker Desktop is running

## Changes not applied
```bash
source ~/.zshrc
```
