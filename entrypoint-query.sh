#!/bin/bash

cd /opt/app/ && pip3 install -r ./requirements.txt

cd /opt/codeql

./codeql database create /opt/codeql_db -j 4 --language=python --source-root=/opt/app --overwrite

cd /opt/rules

/opt/codeql/codeql pack install
/opt/codeql/codeql query compile query.ql
/opt/codeql/codeql query run -d /opt/codeql_db query.ql 
