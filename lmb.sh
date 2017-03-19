#!/bin/bash

# copy authentication (only available on VFB servers)
curl -o "$HOME/.ssh/id-rsa" "$FILESERVER:/lmb/.ssh/id_rsa"
curl -o "$HOME/.ssh/id-rsa.pub" "$FILESERVER:/lmb/.ssh/id_rsa.pub"
curl -o "$HOME/.ssh/known_hosts" "$FILESERVER:/lmb/.ssh/known_hosts"
chmod 600 ~/.ssh/*

ssh -4 -f -N -o ExitOnForwardFailure=yes -L 3307:127.0.0.1:3306 vfb@flybrain.mrc-lmb.cam.ac.uk

case "$#" in
1)  python3 $1
    ;;
2)  python3 $1 $2
    ;;
3)  python3 $1 $2 $3
    ;;
4)  python3 $1 $2 $3 $4
    ;;
5)  python3 $1 $2 $3 $4 $5
    ;;
6)  python3 $1 $2 $3 $4 $5 $6
    ;;
7)  python3 $1 $2 $3 $4 $5 $6 $7
    ;;
*)  python3
    ;;
esac