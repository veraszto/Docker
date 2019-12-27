#!/bin/bash

#podman=docker
podman=podman

$podman build . --tag my/gradle
$podman run -it --volume ~/git:/root/git --publish 8800:8080 --hostname gradle my/gradle

