#!/bin/bash

docker run -it --rm \
\
--volume path_to_sdk/sdk:/home/gradle/sdk \
--volume path_to_project:/home/gradle/project \
--hostname my_docker \
--network mynetwork \
--user gradle \
\
\
AndroidApp

