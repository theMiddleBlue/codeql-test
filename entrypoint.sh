#!/bin/bash

cd /opt/app/ && pip3 install -r ./requirements.txt

cd /opt/codeql

./codeql database create /opt/codeql_db -j 4 --language=python --source-root=/opt/app --overwrite

./codeql database analyze --download --format=CSV --output=/opt/results/codeql_results.csv /opt/codeql_db codeql/python-queries
