#!/bin/bash

/usr/miniconda3/bin/conda create -n cuml_dev python=3.7 cuml=22.02 cudatoolkit=11.2 -c conda-forge -c rapidsai-nightly -c nvidia -y
cd conda/environments/ 
touch environment.yml
cd ../..
export DETECT_CONDA_PATH=/usr/miniconda3/bin/conda
export DETECT_CONDA_ENVIRONMENT_NAME=cudf_dev
ls -l
pulse --url https://nvidia-test.app.blackduck.com scan --vulnerability-report scanReport.json conda/environments/
