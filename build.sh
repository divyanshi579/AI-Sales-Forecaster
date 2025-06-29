#!/bin/bash
set -e

# First install setuptools
pip install --upgrade pip setuptools wheel

# Then install Prophet with modified approach
pip install pystan==2.19.1.1 --no-binary :all:
pip install prophet==1.1.5 --no-binary :all:
pip install -r requirements.txt
