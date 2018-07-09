#!/bin/sh
set -e

target_dir=/usr/share/nginx/html

# Grab the image
cd /tmp
git clone ${SPEC_REPO} matrix-doc
cd matrix-doc
git fetch origin ${SPEC_FETCH}
git checkout ${SPEC_BRANCH}

# Install dependencies and build the spec
pip3 install -r scripts/requirements.txt
python3 ./scripts/gendoc.py

# Copy the spec to nginx (clearing any files in there already)
rm -rf ${target_dir}/*
mv -v ./scripts/gen/* ${target_dir}/

# Clean up
cd /
rm -rf /tmp/matrix-doc

# Start nginx
echo "Starting nginx..."
nginx -g "daemon off;"
