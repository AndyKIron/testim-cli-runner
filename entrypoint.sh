#!/bin/bash
set -e

validate_args() {
  if [ -z "${INPUT_BASEURL}" ]; then
    echo "Error: baseURL a required argument."
    exit 1
  fi

  if [ -z "${INPUT_BRANCHNAME}" ]; then
    echo "Error: branchName a required argument."
    exit 1
  fi
  if [ -z "${INPUT_PARALLELGRIDS}" ]; then
    echo "Error: parallelGrids a required argument."
    exit 1
  fi
  if [ -z "${INPUT_LABEL}" ]; then
    echo "Error: label a required argument."
    exit 1
  fi
  if [ -z "${INPUT_ENABLEPIXELVALIDATION}" ]; then
    echo "Error: enablePixelValidation a required argument."
    exit 1
  fi
  if [ -z "${INPUT_TESTPLAN}" ]; then
    echo "Error: testPlan a required argument."
    exit 1
  fi
  if [ -z "${INPUT_TESTPLAN}" ]; then
    echo "Error: testPlan a required argument."
    exit 1
  fi
  if [ -z "${INPUT_GRID}" ]; then
    echo "Error: grid a required argument."
    exit 1
  fi
  if [ -z "${INPUT_TESTIMTOCKEN}" ]; then
    echo "Error: testimToken a required argument."
    exit 1
  fi
  if [ -z "${INPUT_TESTIMTOCKEN}" ]; then
    echo "Error: testimProject a required argument."
    exit 1
  fi
}

run_testim() {
    testim --grid ${INPUT_GRID} \
     --base-url ${INPUT_BRANCHNAME} \
     --parallel ${INPUT_PARALLELGRIDS} \
     --token ${INPUT_TESTIMTOCKEN} \
     --project ${INPUT_TESTIMTOCKEN} \
     --params "{\"skipPixelValidationSteps\":${INPUT_ENABLEPIXELVALIDATION}}" \
     --branch ${INPUT_BRANCHNAME} \
     --label ${{ steps.init_inputs.outputs.label }} ${INPUT_TESTPLAN}
}


main() {
  echo "TEST!!!!"
  validate_args
  run_testim
}

main
