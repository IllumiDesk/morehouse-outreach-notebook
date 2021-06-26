#!/bin/bash

nbgitpuller() (
    cd /home/jovyan
    curl -v http://localhost:8888/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fmichiganrobotics%2Frob101&urlpath=tree%2Frob101%2F&branch=main
)

main () {
    nbgitpuller
}