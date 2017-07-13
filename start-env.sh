#!/bin/bash

##
# ENVARS
##
export APP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export FLINK_CONF_DIR="${APP_HOME}/env/flink/conf"

##
# ARGUMENTS
##
MODE="$1"

##
# DIRECTORIES
##
OUTDIR="${APP_HOME}/out"
OUTDIR_QUERY1="${OUTDIR}/query-1"
OUTDIR_QUERY2="${OUTDIR}/query-2"
OUTDIR_QUERY3="${OUTDIR}/query-3"
OUTDIR_QUERY4="${OUTDIR}/query-4"
mkdir -p ${OUTDIR_QUERY1}
mkdir -p ${OUTDIR_QUERY2}
mkdir -p ${OUTDIR_QUERY3}
mkdir -p ${OUTDIR_QUERY4}
chmod 777 ${OUTDIR_QUERY1}
chmod 777 ${OUTDIR_QUERY2}
chmod 777 ${OUTDIR_QUERY3}
chmod 777 ${OUTDIR_QUERY4}

sudo rm -f ${OUTDIR_QUERY1}/*
sudo rm -f ${OUTDIR_QUERY2}/*
sudo rm -f ${OUTDIR_QUERY3}/*
sudo rm -f ${OUTDIR_QUERY4}/*

##
# FLINK
##
sudo rm -f ${FLINK_HOME}/log/*
${APP_HOME}/env/systemd/flink-manager.sh start

case "${MODE}" in
2) ##
    # KAFKA
    ##
    ${APP_HOME}/env/systemd/kafka-manager.sh start
esac

exit 0
