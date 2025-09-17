#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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

docker run -d -p 5000:5000 --name oras-quickstart ghcr.io/project-zot/zot-linux-amd64:latest
brew install oras
gp ports await 5000
url="$(gp url 5000)"
export BOMCTL_PORT_URL="${url#*://}"
oras push ${BOMCTL_PORT_URL}/hello-bomctl:v0.0.0 examples/bomctl_0.1.1_darwin_arm64.tar.gz.cdx.json