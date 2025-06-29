#!/bin/bash
set -e

# Install from custom wheel repository (no compilation needed)
pip install --no-cache-dir \
  --index-url https://prophet-wheels.s3.amazonaws.com \
  --trusted-host prophet-wheels.s3.amazonaws.com \
  prophet==1.1.5

# Install other requirements
pip install -r requirements.txt --no-cache-dir
