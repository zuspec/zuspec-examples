#!/bin/bash

examples_dir=$(dirname $(realpath $0))


if ! test -d ${examples_dir}/packages; then
  echo "Setting up virtual environment"
  if test "x${PYTHON}" = "x"; then
    py_interp=$(which python3)
    if test "x${py_interp}" = "x"; then
      echo "Error: no 'python3' in path"
      exit 1
    fi

    echo "Using python3 from path: ${py_interp}"
  else
    echo "Using user-specified Python: ${PYTHON}"
    py_interp=${PYTHON}
  fi

  ${py_interp} --version

  echo "Creating virtual environment..."
  ${py_interp} -m venv ${examples_dir}/packages/python
  if test $? -ne 0; then
    echo "Virtual environment creation failed"
    rm -rf ${examples_dir}/packages
    exit 1
  fi

  echo "Installing IVPM..."
  ${examples_dir}/packages/python/bin/pip install ivpm
  if test $? -ne 0; then
    echo "IVPM installation failed"
    rm -rf ${examples_dir}/packages
    exit 1
  fi

  echo "Loading packages..."
  ${examples_dir}/packages/python/bin/ivpm update -a
  if test $? -ne 0; then
    echo "Package installation failed"
    rm -rf ${examples_dir}/packages
    exit 1
  fi
else
  echo "Virtual environment already configured"
fi

echo ""
echo "Run: ${examples_dir}/packages/python/bin/ivpm activate"
echo ""

