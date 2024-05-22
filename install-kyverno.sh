#!/usr/bin/env bash

helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update

helm install kyverno kyverno/kyverno -n kyverno --create-namespace

# helm install kyverno-policies kyverno/kyverno-policies -n kyverno

# Install step CLI to check and verify certificate details.
# https://kyverno.io/docs/installation/customization/#default-certificates
grep ID=alpine /etc/os-release && apk add step-cli

# Install the Kyverno CLI
# https://kyverno.io/docs/kyverno-cli/install/#manual-binary-installation
curl -LO https://github.com/kyverno/kyverno/releases/download/v1.12.0/kyverno-cli_v1.12.0_linux_x86_64.tar.gz
tar -xvf kyverno-cli_v1.12.0_linux_x86_64.tar.gz
sudo cp kyverno /usr/local/bin/

