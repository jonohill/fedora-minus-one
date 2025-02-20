ARG IMAGE_BASE=quay.io/fedora-ostree-desktops/silverblue

# This points to the very latest (usually prerelease)
# It's mainly here to cause rebuilds when renovate updates it
ARG IMAGE_TAG=41@sha256:750df0fa60e36f67858090544e3f7459e305c03bd9d86700d02dc3dc8e9431f6

FROM ${IMAGE_BASE}:${IMAGE_TAG}

RUN ostree container commit
