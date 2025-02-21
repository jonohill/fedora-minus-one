ARG IMAGE_BASE=quay.io/fedora-ostree-desktops/silverblue

# This points to the very latest (usually prerelease)
# It's mainly here to cause rebuilds when renovate updates it
ARG IMAGE_TAG=42@sha256:270293c7ff73aa54ec360d7111c79d287988c5d9be48b385a99eebc0aa67aa75

FROM ${IMAGE_BASE}:${IMAGE_TAG}

RUN dnf install -y \
    adw-gtk3-theme \
    distrobox \
    gnome-tweaks

RUN ostree container commit
