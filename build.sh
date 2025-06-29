#!/bin/bash
set -e

# Install system dependencies
apt-get update
apt-get install -y build-essential python3-dev cmake

# Install Prophet with compiled binaries
pip install --no-use-pep517 prophet==1.1.5
pip install -r requirements.txt
