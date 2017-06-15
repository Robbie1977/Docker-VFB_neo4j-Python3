#!/bin/bash

if [ ! -e $HOME/.ssh/id_rsa ]; then
  # copy authentication (only available on VFB servers)
  curl -o "$HOME/.ssh/id-rsa" "$FILESERVER:/lmb/.ssh/id_rsa"
  curl -o "$HOME/.ssh/id-rsa.pub" "$FILESERVER:/lmb/.ssh/id_rsa.pub"
  curl -o "$HOME/.ssh/known_hosts" "$FILESERVER:/lmb/.ssh/known_hosts"
fi
chmod 600 ~/.ssh/*

ssh -i $HOME/.ssh/id-rsa -4 -f -N -o ExitOnForwardFailure=yes -L 3307:127.0.0.1:3306 vfb@flybrain.mrc-lmb.cam.ac.uk

sleep 5s
