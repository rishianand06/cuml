#!/bin/bash

/usr/miniconda3/bin/conda create -n cuml_dev python=3.7 cuml=22.02 cudatoolkit=11.2 -c conda-forge -c rapidsai-nightly -c nvidia -y
cd conda/environments/ 
touch environment.yml
cd ../..
export DETECT_CONDA_PATH=/usr/miniconda3/bin/conda
export DETECT_CONDA_ENVIRONMENT_NAME=cudf_dev
pulse --url https://nvidia-test.app.blackduck.com --api-token ${PULSE_API_TOKEN} --project ${PULSE_SCAN_PROJECT} --project-version ${PULSE_SCAN_PROJECT_VERSION} --vulnerability-report scanReport.json conda/environments/
