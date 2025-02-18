#!/usr/bin/env bash

set -e

err() {
    echo "$@" >&2
}

PATH_PREFIX="./linux/releases/"
latest="$(
    curl -fsL https://dl.fedoraproject.org/pub/fedora/imagelist-fedora \
        | grep "^$PATH_PREFIX" \
        | awk -F'/' '{print $4}' \
        | grep -E '^[0-9]+$' \
        | sort --unique --reverse --numeric-sort \
        | head -n1
)"

err "The latest Fedora release is $latest"

stable=$(( latest - 1 ))
testing=$(( latest + 1 ))

VERSIONS=(rawhide "$testing" "$latest" "$stable" $(( latest - 2 )))
ARCHS=(arm64 amd64)

err "Checking for versions (${VERSIONS[*]}) on archs (${ARCHS[*]})"

IMAGE_BASE=quay.io/fedora-ostree-desktops/silverblue

today=$(date +%Y%m%d)

first=1
echo -n '['
for version in "${VERSIONS[@]}"; do
    for arch in "${ARCHS[@]}"; do
        err "Checking $version/$arch"
        if skopeo inspect "docker://$IMAGE_BASE:$version" --override-os "linux" --override-arch "$arch" >/dev/null 2>&1; then

            labels="$version-$arch $version.$today-$arch"
            if [ "$version" = "$latest" ]; then
                labels="$labels latest-$arch latest.$today-$arch"
            fi
            if [ "$version" = "$stable" ]; then
                labels="$labels stable-$arch stable.$today-$arch"
            fi
            if [ "$version" = "$testing" ]; then
                labels="$labels testing-$arch testing.$today-$arch"
            fi

            runner=ubuntu-24.04
            if [ "$arch" = "arm64" ]; then
                runner=ubuntu-24.04-arm
            fi

            if [ "$first" = "1" ]; then
                first=0
            else
                echo ','
            fi
            
            jq -cn \
                --arg labels "$labels" \
                --arg runner "$runner" \
                --arg image_base "$IMAGE_BASE" \
                --arg image_tag "$version" \
                '{labels: $labels, runner: $runner, image_base: $image_base, image_tag: $image_tag}'

        fi
    done
done

echo ']'
