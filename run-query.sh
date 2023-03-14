#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: ${0} <your-python-project-path>"
    exit 1
fi

if [ ! -f "${1}/requirements.txt" ]; then
    echo "Error: ${1} directory must contains a requirements.txt file for python module install."
    exit 1
fi

docker run -ti --rm \
    -v ${PWD}/entrypoint-query.sh:/entrypoint-query.sh \
    -v ${PWD}/results:/opt/results \
    -v ${PWD}/rules:/opt/rules \
    -v ${1}:/opt/app \
    --entrypoint /entrypoint-query.sh \
    codeql:test

cat results/codeql_results.csv
