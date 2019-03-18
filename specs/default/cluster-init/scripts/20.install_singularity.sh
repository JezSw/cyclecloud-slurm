#!/bin/bash
set -ex

# Create tempdir
#tmpdir=$(mktemp -d)

# download singularity installer into tempdir and install it to /usr/local
#pushd $tmpdir
SING_VER=2.5.2
wget https://github.com/sylabs/singularity/releases/download/$SING_VER/singularity-$SING_VER.tar.gz
jetpack download --project SP3cluster "singularity-$SING_VER.tar.gz"
tar -xzf singularity-${SING_VER}.tar.gz

cd singularity-$SING_VER
./configure --prefix=/usr/local
make
make install

jetpack download --project SP3cluster singularity.conf
mv singularity.conf /usr/local/etc/singularity/

#clean up
#popd
#rm -rf $tmpdir