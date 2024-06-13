#!/bin/bash

# Espera a que Kafka esté disponible
echo "Esperando a que Kafka esté disponible..."
cub kafka-ready -b kafka:9092 1 20

# Crear temas necesarios para Kafka Connect
kafka-topics.sh --create --topic connect-configs --partitions 1 --replication-factor 1 --config cleanup.policy=compact --bootstrap-server kafka:9092
kafka-topics.sh --create --topic connect-offsets --partitions 25 --replication-factor 1 --bootstrap-server kafka:9092
kafka-topics.sh --create --topic connect-statuses --partitions 5 --replication-factor 1 --config cleanup.policy=compact --bootstrap-server kafka:9092

echo "Temas creados correctamente."