#!/bin/bash
THIS_SCRIPT=${BASH_SOURCE[0]}
THIS_SCRIPT_DIR=$(dirname "${THIS_SCRIPT}")

GOLDEN_COPY_SNAPSHOT=$THIS_SCRIPT_DIR/golden_copy_snapshot

function updateSnapshot {
    python3 texttest_fixture.py 2>&1 > $GOLDEN_COPY_SNAPSHOT
}

if [ ! -e $GOLDEN_COPY_SNAPSHOT ]; then
    updateSnapshot
else
    updateSnapshot
    git diff --quiet $GOLDEN_COPY_SNAPSHOT
fi