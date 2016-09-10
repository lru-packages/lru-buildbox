#! /usr/bin/env bash
aws s3 sync ./repo s3://lru-packages/repo --acl=public-read
