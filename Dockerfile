ARG IMAGE_BASE=quay.io/fedora-ostree-desktops/silverblue

# This points to the very latest (usually prerelease)
# It's mainly here to cause rebuilds when renovate updates it
ARG IMAGE_TAG=42@sha256:97195c9cc81b09f1a8fe2aa1ff94dcf76153ad627c5c6185907c60ea3c4316ed

FROM ${IMAGE_BASE}:${IMAGE_TAG}

RUN dnf install -y \
    adw-gtk3-theme \
    distrobox \
    gnome-tweaks

RUN ostree container commit
