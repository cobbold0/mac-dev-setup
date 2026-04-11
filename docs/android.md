# Android Setup

Set up Java first, then install Android Studio and the SDK tools.

## 1. Install Java 17

```bash
brew install openjdk@17
```

Add this to `~/.zshrc` if it is not already there:

```bash
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH="$JAVA_HOME/bin:$PATH"
```

Reload your shell:

```bash
source ~/.zshrc
```

Verify Java:

```bash
java -version
```

## 2. Install Android Studio

```bash
brew install --cask android-studio
```

Open Android Studio once the install completes.

## 3. Install SDK Components

In Android Studio, open the SDK Manager and install:

- Android SDK Platform
- Android SDK Platform-Tools
- Android SDK Build-Tools
- Android Emulator
- Android SDK Command-line Tools

## 4. Configure Environment Variables

Add this to `~/.zshrc`:

```bash
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
```

Reload your shell:

```bash
source ~/.zshrc
```

## 5. Verify

```bash
adb version
sdkmanager --list | head
```
