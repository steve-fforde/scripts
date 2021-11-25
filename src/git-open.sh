#!/bin/bash

nohup xdg-open $(git config --get remote.origin.url | sed 's|^https://|git@| ; s|:|/|g ; s|^git@|https://| ; s|.git$||')