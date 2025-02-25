ARG IMAGE_BASE=quay.io/fedora-ostree-desktops/silverblue

# This points to the very latest (usually prerelease)
# It's mainly here to cause rebuilds when renovate updates it
ARG IMAGE_TAG=42@sha256:c0b93dca8074c2966ce63166857ba1bb489c400f188855e65659522903d8e45f

FROM ${IMAGE_BASE}:${IMAGE_TAG}

RUN dnf install -y \
    adw-gtk3-theme \
    distrobox \
    gnome-tweaks

RUN ostree container commit
