ARG IMAGE_BASE=quay.io/fedora-ostree-desktops/silverblue

# This points to the very latest (usually prerelease)
# It's mainly here to cause rebuilds when renovate updates it
ARG IMAGE_TAG=41@sha256:6e5b4727c096df66dd2eed8f34f158b90d35e08cb898f0a1129bde17ac2e97c3

FROM ${IMAGE_BASE}:${IMAGE_TAG}

RUN ostree container commit
