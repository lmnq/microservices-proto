#!/bin/bash

# set -e

# Generate Go code from protocol buffer definitions
PROTO_PATH="./proto"
GEN_PATH="./generated/golang"

SERVICES=("order" "payment" "shipping")

for service in "${SERVICES[@]}"; do
    # generate go code for each service
    echo "Generating Go code for $service service..."
    protoc \
        --proto_path=$PROTO_PATH \
        --go_out=$GEN_PATH \
        --go_opt=paths=source_relative \
        --go-grpc_out=$GEN_PATH \
        --go-grpc_opt=paths=source_relative \
        $PROTO_PATH/$service/*.proto
done
echo "Done generating Go code for services."
