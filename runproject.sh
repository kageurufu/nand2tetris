#!/bin/bash
PROJECT=${1:-01}
FAILED=0
for i in projects/$PROJECT/*.tst; do
    out=$(./tools/HardwareSimulator.sh $i 2>&1)
    if [[ $? -eq 255 ]]; then
        FAILED=$(($FAILED + 1))
        echo "$i: $out"
    fi
done

if [[ "$FAILED" -eq 0 ]]; then
    echo 'Passing!'
fi

exit $FAILED