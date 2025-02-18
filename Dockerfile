ARG IMAGE_BASE=quay.io/fedora-ostree-desktops/silverblue

# This points to the very latest (usually prerelease)
# It's mainly here to cause rebuilds when renovate updates it
ARG IMAGE_TAG=41@sha256:e069e976a8b349dfd22b35384a349f79267ff80316f8005e5b88730a3d574e50

FROM ${IMAGE_BASE}:${IMAGE_TAG}

RUN ostree container commit
