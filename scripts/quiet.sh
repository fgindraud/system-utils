#!/usr/bin/env bash

# Execute a latex command while capturing all outputs if VERBOSE / VERBOSE_LATEX is not requested.
# If the command does not succeed print its outputs for debugging.
# This is intended to quiet latex verbosity in the nice case.
# Compiling with `make VERBOSE_LATEX=1` is useful to debug latex compiling only (VERBOSE would print commands for c/c++ too).
if [ -z "${VERBOSE}" -a -z "${VERBOSE_LATEX}" ]; then
    output=$("$@" 2>&1)
    return_code="$?"
    if [[ "${return_code}" != 0 ]]; then
        echo "$@"
        echo "${output}"
        # Nice error message for user, but specific to this context of use.
        echo
        echo "Fix errors above (usually missing latex packages that must be installed)"
        echo "Another option if you do not need the user_guide.pdf is to disable it with -DUSER_GUIDE=OFF"
        exit ${return_code}
    fi
else
    echo "$@" 
    exec "$@"
fi
