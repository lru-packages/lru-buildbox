#! /usr/bin/env bash
mkdir -p repo
aws s3 sync s3://lru-packages/repo ./repo
