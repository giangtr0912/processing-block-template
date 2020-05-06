#!/bin/bash

# Hrm, if we don't delete the cache the linter skips all if its test cases as it has problems with our conftest
rm -r .pytest_cache
black .
python -m pytest --pylint-rcfile=pylintrc --mypy --mypy-ignore-missing-imports --cov=src/
coverage-badge -f -o coverage.svg
RET_VALUE=$?

exit $RET_VALUE
