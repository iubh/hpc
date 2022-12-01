#!/bin/bash

set -x
set -e
CERTIFICATE_SECRET_ARN="arn:aws:secretsmanager:eu-central-1:186419939870:secret:hpc-iu-HPC-AD-Certificate-7okkuZ"
CERTIFICATE_PATH="/opt/parallelcluster/shared/directory_service/domain-certificate.crt"

setupCertificate() {
    [[ -z $CERTIFICATE_SECRET_ARN ]] && echo "[ERROR] Missing CERTIFICATE_SECRET_ARN" && exit 1
    [[ -z $CERTIFICATE_PATH ]] && echo "[ERROR] Missing CERTIFICATE_PATH" && exit 1

    REGION="${cfn_region:?}"
    mkdir -p $(dirname $CERTIFICATE_PATH)
    
    aws secretsmanager get-secret-value --region $REGION --secret-id $CERTIFICATE_SECRET_ARN --query SecretString --output text > $CERTIFICATE_PATH

}

# main
# ----------------------------------------------------------------------------
main() {
    echo "[INFO][$(date '+%Y-%m-%d %H:%M:%S')] 02.setup.active-directory.sh: START" >&2
    setupCertificate
    echo "[INFO][$(date '+%Y-%m-%d %H:%M:%S')] 02.setup.active-directory.sh: STOP" >&2
}

main "$@"