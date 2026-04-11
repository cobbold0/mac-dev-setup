# ANDROID SETUP (docs/android.md)

## Install Android Studio
```bash
brew install --cask android-studio
```

## Install SDK Components
Open Android Studio and install SDK, Platform Tools, Build Tools, Emulator, Command-line Tools

## Environment Variables
Add to ~/.zshrc:
```bash
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
```

Reload:
```bash
source ~/.zshrc
```

## Verify
```bash
adb version
```
