#!/bin/bash
set -e

# 1. Install system dependencies (Render's Ubuntu container)
apt-get update -y || true
apt-get install -y python3-dev build-essential || true

# 2. Install Prophet with optimized build
pip install --upgrade pip
pip install prophet==1.1.5 --no-deps --no-cache-dir
pip install pystan==2.19.1.1 --no-binary pystan --no-cache-dir

# 3. Install other requirements
pip install -r requirements.txt --no-cache-dir
