#!/bin/bash

# Set environment variables
export BOOTSTRAP_SERVERS="127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094"
export CONSUMER_GROUP="cg2"
export TOPIC="topic2"
export OTEL_SERVICE_NAME="consumer-svc2"
export OTEL_TRACES_EXPORTER="otlp"
export OTEL_METRICS_EXPORTER="otlp"
export OTEL_LOGS_EXPORTER="otlp"

# Run the Java application
java -javaagent:${PWD}/../opentelemetry-javagent/opentelemetry-javaagent.jar \
        -Dotel.instrumentation.kafka.producer-propagation.enabled=true \
        -Dotel.instrumentation.kafka.experimental-span-attributes=true \
        -Dotel.instrumentation.kafka.metric-reporter.enabled=true \
        -jar ${PWD}/../docker/consumer/kafka-consumer.jar