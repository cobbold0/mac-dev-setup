# Troubleshooting

## Homebrew Not Found

If `brew` is missing after install, restart the terminal first. Then verify:

```bash
brew --version
```

## Node Commands Not Found

Reload your shell and confirm `nvm` is configured:

```bash
source ~/.zshrc
command -v nvm
nvm install --lts
```

## Java Home Not Set

Check whether `JAVA_HOME` is available:

```bash
echo "$JAVA_HOME"
java -version
```

If it is empty, add the Java section from [android.md](./android.md).

## Android SDK Not Found

Confirm the SDK path:

```bash
echo "$ANDROID_HOME"
echo "$ANDROID_SDK_ROOT"
```

If the paths are empty, add the Android environment variables from [android.md](./android.md) and reload your shell:

```bash
source ~/.zshrc
```

## `adb` Not Found

Check whether platform tools are on your `PATH`:

```bash
adb version
echo "$PATH"
```

If `adb` still fails, reopen Android Studio and make sure `Android SDK Platform-Tools` is installed.

## Docker Is Installed But Not Running

Open Docker Desktop and wait for the app to finish starting before running CLI commands.

Verify:

```bash
docker version
```

## Shell Changes Did Not Apply

Reload your shell:

```bash
source ~/.zshrc
```
