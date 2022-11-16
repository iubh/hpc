#!/bin/bash

set -x
set -e

setupLibraries() {
    yum install -y -q libXss.so.1 libXScrnSaver elfutils-libelf.i686 redhat-lsb.i686 mesa-libGLU.i686 motif.i686 || exit 1
}



# main
# ----------------------------------------------------------------------------
main() {
    echo "[INFO][$(date '+%Y-%m-%d %H:%M:%S')] 28.configure.allegro.libraries.sh: START" >&2
    setupLibraries
    echo "[INFO][$(date '+%Y-%m-%d %H:%M:%S')] 28.configure.allegro.libraries.sh: STOP" >&2
}

main "$@"