# FLINK SCAFFOLDING

*Scaffolding for data stream processing applications, leveraging Apache Flink*


## Requirements
The system needs to be provided with the following packages:
* Java >= 1.8.0
* Maven >= 3.5.0
* Hadoop = 2.8.0
* Flink = 1.3.1 (scala 2.11)
* Kafka >= 0.10.2.1
* Elasticsearch >= 5.5.0
* Kibana >= 5.5.0

and the following environment variables, pointing to the respective package home directory:
* JAVA_HOME
* MAVEN_HOME
* HADOOP_HOME
* FLINK_HOME
* KAFKA_HOME
* ELASTICSEARCH_HOME
* KIBANA_HOME


## Build
Build the application for a specific query:

    $> mvn clean package

## Usage
Start the environment:

    $socstream_home> bash start-env.sh

Visit the Flink web dashboard at **http://localhost:8081**.

The general job submission is as follows:

    $flink_home> bin/flink jar [PROGRAM_JAR] [QUERY] [QUERY_OPTS]

where
* **[PROGRAM_JAR]** is the local absolute path to the program's JAR;
* **[QUERY]** is the name of the program query to execute;
* **[QUERY_OPTS]** are query arguments (e.g. --optName optValue).

Notice that the following map/reduce programs are available:
* **query-1** the 1st query, leveraging ... .

The job can be interrupted typing **Ctrl+C**.

Read the output:

    $hadoop_home> bin/hadoop hdfs -cat [RESULT]/*

where
*[RESULT]* is the HDFS directory of results.

Stop the environment:

    $socstream_home> bash stop-env.sh

## Query 1
The 1st query requires a netcat session to be started:

    $> ncat 127.0.0.1 9000 -l

The 1st query can be executed running:

    $socstream_home> bash query-1.sh

The output is saved to **$path/to/the/project/out/query1**.


## Query 2
The 2nd query requires a netcat session to be started:

    $> ncat 127.0.0.1 9000 -l

The 2nd query can be executed running:

    $socstream_home> bash query-1.sh

The output is saved to **$path/to/the/project/out/query1**.


## Query 3
The 3rd query requires a Kafka and Elasticsearch to be configured and started.

Create the Kafka topic `topic-query-3`:

    $kafka-home> bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic topic-query-3

Test the topic creation:

    $kafka-home> bin/kafka-topics.sh --list --zookeeper localhost:2181

To test message publishing:

    $kafka-home> bin/kafka-console-producer.sh --broker-list localhost:9092 --topic topic-query-3

    $kafka-home> bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic-query-3

Create the Elasticsearch index `fsq4` with mapping `output` and mapping schema

    {
    "properties": {
        "wStart": {"type": "date"},
        "wEnd":   {"type": "date"},
        "rank":   {"type": "text"}
    }
    }

The 3rd query can be executed running:

    $socstream_home> bash query-3.sh

The output is saved to **${FLINK_HOME}/log/\*.out**.


## Dataset
The dataset is provided by ... and can be downloaded from [here](http://gmarciani.com).


## Authors
Giacomo Marciani, [gmarciani@acm.org](mailto:gmarciani@acm.org)


## References
Christopher Mutschler, Holger Ziekow, and Zbigniew Jerzak. 2013. The DEBS 2013 grand challenge. In Proceedings of the 7th ACM international conference on Distributed event-based systems (DEBS '13). ACM, New York, NY, USA, 289-294. [DOI](http://dx.doi.org/10.1145/2488222.2488283)


## License
The project is released under the [MIT License](https://opensource.org/licenses/MIT).
