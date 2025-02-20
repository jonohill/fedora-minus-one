ARG IMAGE_BASE=quay.io/fedora-ostree-desktops/silverblue

# This points to the very latest (usually prerelease)
# It's mainly here to cause rebuilds when renovate updates it
ARG IMAGE_TAG=42@sha256:ec58fe5b4a59af1c324f938af0737345ce942d8c6035b8a892b9c87d9b880aae

FROM ${IMAGE_BASE}:${IMAGE_TAG}

RUN ostree container commit
