#!/bin/bash

# TODO:
# - Implement user

FROM ubuntu:14.04

ENV PYTHON_VERSION
#ENV USER proteus

#RUN adduser --home ${RTC2GIT_HOME} --gecos "RTC2GIT User" --shell /bin/bash "${RTC2GIT_USER}" --disabled-password

RUN apt-get update \
    && apt-add-repository --yes ppa:ansible/ansible \
    && apt-get install -y wget nano python2.7 python-pip software-properties-common ansible
