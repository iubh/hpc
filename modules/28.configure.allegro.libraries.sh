#!/bin/bash

set -x
set -e

setupLibraries() {
    yum install -y -q libXss.so.1 libXScrnSaver elfutils-libelf.i686 redhat-lsb.i686 mesa-libGLU.i686 motif.i686 || exit 1
}

setupLicenceServer() {
    # Create variable for licence server
    echo "CDS_LIC_FILE DEFAULT=5280@eplicense1.stfc.ac.uk" >> /etc/security/pam_env.conf
    echo "LM_LICENSE_FILE DEFAULT=5280@eplicense1.stfc.ac.uk" >> /etc/security/pam_env.conf
}



# main
# ----------------------------------------------------------------------------
main() {
    echo "[INFO][$(date '+%Y-%m-%d %H:%M:%S')] 28.configure.allegro.libraries.sh: START" >&2
    setupLibraries
    setupLicenceServer
    echo "[INFO][$(date '+%Y-%m-%d %H:%M:%S')] 28.configure.allegro.libraries.sh: STOP" >&2
}

main "$@"