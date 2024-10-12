# Container image for CI with flux-cli, kustomize, kubeconform

[![Build container image](https://github.com/nimbolus/flux-ci-container/actions/workflows/build.yml/badge.svg)](https://github.com/nimbolus/flux-ci-container/actions/workflows/build.yml)

Container image based on Alpine with flux-cli, kustomize, kubeconform.
This image is useful for CI jobs requiring the different CLI tools.

## How to start

```sh
podman run -it -v $PWD:/build \
    ghcr.io/nimbolus/flux-ci-container:latest
```
