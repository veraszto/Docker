#!/bin/bash

cp -r ~/git/GracefullGNU/screen .
docker build -f Dockerfile --tag AndroidApp .
rm -rf screen

