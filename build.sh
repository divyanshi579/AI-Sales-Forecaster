#!/bin/bash
set -e

# 1. Install Python 3.9 (Render's default is too new)
pyenv install 3.9.16 --skip-existing
pyenv global 3.9.16

# 2. Install Prophet with pre-built wheel (NO COMPILATION)
pip install --no-cache-dir \
  --index-url https://prophet-wheels.s3.amazonaws.com \
  --trusted-host prophet-wheels.s3.amazonaws.com \
  prophet==1.1.5

# 3. Install other requirements
pip install -r requirements.txt --no-cache-dir
