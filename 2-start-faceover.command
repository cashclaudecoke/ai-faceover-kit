#!/bin/bash
cd "$(dirname "$0")/Deep-Live-Cam" || { echo "Run 1-install.command first."; read -n1; exit 1; }
source venv/bin/activate
echo "Starting Deep-Live-Cam... (Select a face -> pick from 'characters' folder -> click Live)"
python run.py --execution-provider coreml
