#!/bin/bash

# Setup Brew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc

# Install everything
brew install trivy
brew tap interlynk-io/interlynk
brew install sbomasm sbomqs
brew install parlay
brew install cosign
brew tap bomctl/bomctl
brew install bomctl
brew install osv-scanner
brew install duckdb
curl -o /home/linuxbrew/.linuxbrew/bin/bnd -L https://github.com/carabiner-dev/bnd/releases/download/v0.0.1/bnd-v0.0.1-linux-amd64
chmod 0755 /home/linuxbrew/.linuxbrew/bin/bnd
curl -o /home/linuxbrew/.linuxbrew/bin/unpack -L https://github.com/carabiner-dev/unpack/releases/download/v0.1.0-pre5/unpack-v0.1.0-pre5-linux-amd64
chmod 0755 /home/linuxbrew/.linuxbrew/bin/unpack