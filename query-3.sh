#!/bin/bash

##
# ENVARS
##
FLINK_SCAFFOLDING_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

##
# FLINK COMMANDS
##
FLINK_RUN="${FLINK_HOME}/bin/flink run"

##
# FLINK_SCAFFOLDING
##
FLINK_SCAFFOLDING_JAR="${FLINK_SCAFFOLDING_HOME}/target/flink-scaffolding-1.0-jar-with-dependencies.jar"
FLINK_SCAFFOLDING_QUERY="query-3"
FLINK_SCAFFOLDING_OPTS=""
FLINK_SCAFFOLDING_OPTS="${FLINK_SCAFFOLDING_OPTS} --kafka.zookeeper localhost:2181"
FLINK_SCAFFOLDING_OPTS="${FLINK_SCAFFOLDING_OPTS} --kafka.bootstrap localhost:9092"
FLINK_SCAFFOLDING_OPTS="${FLINK_SCAFFOLDING_OPTS} --kafka.topic sample-topic-query-3"
FLINK_SCAFFOLDING_OPTS="${FLINK_SCAFFOLDING_OPTS} --parallelism 1"

##
# EXECUTION
##
${FLINK_RUN} ${FLINK_SCAFFOLDING_JAR} ${FLINK_SCAFFOLDING_QUERY} ${FLINK_SCAFFOLDING_OPTS}
