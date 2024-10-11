# Container image for CI with flux-cli, kustomize, kubeconform

Container image based on Alpine with flux-cli, kustomize, kubeconform.
This image is useful for CI jobs requiring the different CLI tools.

## How to start

```sh
podman run -it -v $PWD:/build \
    ghcr.io/nimbolus/flux-ci-container:latest
```
