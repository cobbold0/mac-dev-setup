# Mac Dev Setup

A focused, modular guide for preparing a Mac for development without installing a pile of tools you do not need.

Use the docs one section at a time, or run the bootstrap script for the common setup tasks.

## What Is Here

- [Base setup](./docs/base.md): macOS updates, Homebrew, Git, SSH, terminal basics, and workspace folders
- [Node.js setup](./docs/node.md): `nvm`, the latest LTS release of Node.js, and verification
- [Android setup](./docs/android.md): Java 17, Android Studio, SDK tooling, and shell configuration
- [Docker setup](./docs/docker.md): Docker Desktop install and first run
- [Troubleshooting](./docs/troubleshooting.md): common issues after setup

## Quick Start

Choose one of these paths:

### Manual Setup

1. Start with [Base setup](./docs/base.md).
2. Add only the platform docs you need:
   - [Node.js setup](./docs/node.md)
   - [Android setup](./docs/android.md)
   - [Docker setup](./docs/docker.md)
3. If something looks off, check [Troubleshooting](./docs/troubleshooting.md).

### Bootstrap Script

Download the repo or the script first.

Option 1, clone the repo:

```bash
git clone https://github.com/cobbold0/mac-dev-setup.git
cd mac-dev-setup
```

Option 2, download just the script:

```bash
curl -O https://raw.githubusercontent.com/cobbold0/mac-dev-setup/main/scripts/bootstrap-mac-dev.sh
chmod +x bootstrap-mac-dev.sh
```

Install Homebrew first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then run only the parts you want:

```bash
./scripts/bootstrap-mac-dev.sh --base --node
```

If you downloaded only the script:

```bash
./bootstrap-mac-dev.sh --base --node
```

Common combinations:

```bash
./scripts/bootstrap-mac-dev.sh --base
./scripts/bootstrap-mac-dev.sh --base --node --docker
./scripts/bootstrap-mac-dev.sh --base --java --android
./scripts/bootstrap-mac-dev.sh --all
```

After the script finishes:

```bash
source ~/.zshrc
```

## Notes

- The script installs packages and appends shell configuration, but it does not complete GUI steps inside Android Studio or Docker Desktop.
- Android setup assumes Java 17 is installed.
- Apple Silicon users should complete the Rosetta step in [Base setup](./docs/base.md) when needed.
