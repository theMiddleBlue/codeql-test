#!/bin/bash

docker rmi codeql:test 2>/dev/null

docker build -t codeql:test .
