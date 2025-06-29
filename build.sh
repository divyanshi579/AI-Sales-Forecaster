#!/bin/bash
set -e

# Install Prophet with pre-built wheels
pip install --no-use-pep517 prophet==1.1.5
pip install -r requirements.txt
