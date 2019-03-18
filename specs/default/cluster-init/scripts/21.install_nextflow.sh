#!/bin/bash
set -ex

# Create tempdir
#tmpdir=$(mktemp -d)

# download singularity installer into tempdir and install it to /usr/local
#pushd $tmpdir
curl -fsSL https://github.com/nextflow-io/nextflow/releases/download/v18.10.1/nextflow | bash
#jetpack download "nextflow"
chmod a+rx nextflow
mv nextflow /usr/local/bin

#clean up
#popd
#rm -rf $tmpdir