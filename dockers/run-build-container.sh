#!/bin/bash

DOCKER_WDIR=/tmp/fpm

#docker run --rm -it -v "${PWD}/rpmmacros:/root/.rpmmacros" -v $HOME/.gnupg:/root/.gnupg \
#		-v "${PWD}:${DOCKER_WDIR}" -w ${DOCKER_WDIR} ${DOCKER_FPM}:rpm -t rpm ${RPM_OPTS} \
#		--iteration ${RELEASE}.el7 \
#		-C skel/el7 \
#		${FPM_OPTS}

docker run --rm -it -v "${PWD}/rpmmacros:/root/.rpmmacros" -v $HOME/.gnupg:/root/.gnupg \
		-v "${PWD}/build:${DOCKER_WDIR}" -w ${DOCKER_WDIR} jim/debianbld

