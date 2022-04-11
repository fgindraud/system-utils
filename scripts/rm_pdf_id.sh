#!/usr/bin/env bash

# Remove PDF ID metadata which breaks reproducible builds.
# This field is not required.
# Reference : https://wiki.debian.org/ReproducibleBuilds/TimestampsInPDFGeneratedByLaTeX
for pdf in "$@"; do
    grep -av '^/ID \[\(<[0-9A-F]\{32\}>\) \1]$' "${pdf}" > "${pdf}.no_id"
    mv -f "${pdf}.no_id" "${pdf}"
done
