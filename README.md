### CodeQL Test

CodeQL is a powerful and popular tool used for analyzing code and identifying potential security vulnerabilities in software. One common challenge when working with CodeQL is setting up the necessary environment and dependencies to run the tool effectively (unless you want to work with the vscode extension and not the with the cli). 

This test provides a docker container with a more efficient solution to this issue by allowing users to create and run CodeQL instances in a containerized environment. This project aims to test the capabilities of CodeQL in a Dockerized environment by creating a Docker image of the CodeQL cli for analyzing Python projects. By doing so, we can evaluate the performance of CodeQL in a containerized setting and determine the benefits and limitations of using it.

### How it works

The container has an entrypoint that create a database for a given Python project, and then analyze it using `codeql/python-queries`. The Python project must contains a `requirements.txt` file with the required python modules.

#### Build
```shell
git clone <thisrepo> codeql-test
cd codeql-test
./build
```

#### Run
just execute `./run.sh` with the full path of a python project as the first argument. For example, if my python project is in `${PWD}/app`:
```shell
./run.sh ${PWD}/app
```

The first argument should always be a **full** path.

In this repo there's an example python app that you can use for test. It should show the following findings on `results/codeql_results.csv`:

```
|             Diagnostic              | Summary  |
+-------------------------------------+----------+
| Successfully extracted Python files | 1 result |

Analysis produced the following metric data:

|                         Metric                          | Value  |
+---------------------------------------------------------+--------+
| Total lines of user written Python code in the database |     15 |
| Total lines of Python code in the database              | 115596 |

"Incomplete regular expression for hostnames",
"Matching a URL or hostname against a regular expression that contains an unescaped dot as part of the hostname might match more hostnames than expected.",
"warning",
"This regular expression has an unescaped '.' before 'example.com/', so it might match more hosts than expected.",
"/test.py","6","31","6","53"
```
