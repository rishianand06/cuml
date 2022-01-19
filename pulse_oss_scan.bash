#!/bin/bash

echo $PULSE_API_TOKEN
/usr/miniconda3/bin/conda create -n cuml_dev python=3.7 cuml=22.02 cudatoolkit=11.2 -c conda-forge -c rapidsai-nightly -c nvidia -y
cd conda/environments/ 
touch environment.yml
cd ../..
# export DETECT_CONDA_PATH=/usr/miniconda3/bin/conda
# export DETECT_CONDA_ENVIRONMENT_NAME=cuml_dev
export DETECT_PROJECT_NAME=$PULSE_SCAN_PROJECT
export DETECT_PROJECT_VERSIOn_NAME=$PULSE_SCAN_PROJECT_VERSION
wget https://detect.synopsys.com/detect7.sh --no-check-certificate
bash detect7.sh  --blackduck.url=https://nvidia-test.app.blackduck.com --blackduck.api.token=$PULSE_API_TOKEN --detect.source.path='conda/environments/'
# pulse --url https://nvidia-test.app.blackduck.com --api-token $PULSE_API_TOKEN scan --vulnerability-report scanReport.json conda/environments/
