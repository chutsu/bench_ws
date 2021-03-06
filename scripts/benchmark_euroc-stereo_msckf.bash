#!/bin/bash
set -e
SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source $SCRIPT_PATH/benchmark.bash
source $SCRIPT_PATH/../devel/setup.bash
trap 'kill -9 %1' 2

# Stereo-MSCKF
RESULTS_DIR=/data/results/euroc/msckf_vio
ROSBAGS_DIR=/data/euroc_mav/rosbags
LAUNCH_FILE=benchmark_euroc-msckf_vio.launch
EST_TOPIC=/firefly_sbx/vio/odom

# Run algorithms on EuRoC dataset
prep_result_folders $RESULTS_DIR
batch_run_vio $LAUNCH_FILE $ROSBAGS_DIR $RESULTS_DIR
