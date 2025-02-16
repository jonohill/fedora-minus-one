# TODO work out upgrades
FROM quay.io/fedora/fedora-bootc:41@sha256:d1fbf32863786023f927886648b790bce9e1f4c4c1ded73e0165ff2c37440c30

RUN ostree container commit
