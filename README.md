# ci-docker-ansible

A docker image that allows to run ansible from a container.

## About

This image contains all ssh dependencies so you'll be able to start a ssh-agent, register your private key then play your playbooks against your infrastructure.

## Building images

Simply run `make build`.

## Building for multiple ansible versions

| version |          command            |
|----|----------------------------------|
|2.9.* | `ANSIBLE_VERSION=2.9 make build` |
|2.10.* | `ANSIBLE_VERSION=2.10 make build` |
|3.4.* | `ANSIBLE_VERSION=3.4 make build` |
