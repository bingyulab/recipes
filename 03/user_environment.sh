#!/bin/bash
# Print names of environment variables that contain the current username
env | grep "$(whoami)" | cut -d'=' -f1

