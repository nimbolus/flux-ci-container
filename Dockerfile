ARG FLUX_VERSION=latest
ARG KUSTOMIZE_VERSION=latest
ARG KUBECONFORM_VERSION=latest

FROM fluxcd/flux-cli:${FLUX_VERSION} AS flux-cli
FROM registry.k8s.io/kustomize/kustomize:${KUSTOMIZE_VERSION} AS kustomize
FROM ghcr.io/yannh/kubeconform:${KUBECONFORM_VERSION} AS kubeconform

FROM alpine:3.20
ARG FLUX_VERSION
ARG KUSTOMIZE_VERSION
ARG KUBECONFORM_VERSION

LABEL org.opencontainers.image.description "Alpine image with flux-cli (${FLUX_VERSION}), kustomize (${KUSTOMIZE_VERSION}) and kubeconform (${FLUX_VERSION})"

COPY --from=flux-cli /usr/local/bin/flux /usr/local/bin/flux
COPY --from=kustomize /app/kustomize /usr/local/bin/kustomize
COPY --from=kubeconform /kubeconform /usr/local/bin/kubeconform

RUN apk add --no-cache bash curl yq

WORKDIR /build

CMD [ "/bin/sh" ]
