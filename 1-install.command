#!/bin/bash
# AI Faceover Kit - installer (Apple Silicon Mac)
set -e
cd "$(dirname "$0")"
KIT="$(pwd)"
echo "=== AI Faceover Kit installer ==="

# 1) Homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew (it will ask for your Mac password)..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || true

# 2) Tools
echo "Installing Python 3.11, Tk, ffmpeg, git, OBS..."
brew install python@3.11 python-tk@3.11 ffmpeg git
brew install --cask obs || echo "(OBS already installed or skipped)"

# 3) Deep-Live-Cam
if [ ! -d "$KIT/Deep-Live-Cam" ]; then
  git clone https://github.com/hacksider/Deep-Live-Cam.git "$KIT/Deep-Live-Cam"
fi
cd "$KIT/Deep-Live-Cam"

# 4) Python environment
PY="$(brew --prefix)/bin/python3.11"
[ -d venv ] || "$PY" -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# 5) Make sure Apple Silicon acceleration (CoreML) is available
# The official onnxruntime wheel ships CoreML. The old onnxruntime-silicon fork
# shadows it, so remove it and reinstall the official one if CoreML is missing.
if ! python -c "import onnxruntime as o,sys; sys.exit(0 if 'CoreMLExecutionProvider' in o.get_available_providers() else 1)"; then
  echo "Fixing CoreML acceleration..."
  pip uninstall -y onnxruntime onnxruntime-silicon || true
  pip install -r requirements.txt
fi

# 6) AI models (face swap + face enhancer)
mkdir -p models
[ -f models/inswapper_128_fp16.onnx ] || curl -fL -o models/inswapper_128_fp16.onnx \
  https://huggingface.co/hacksider/deep-live-cam/resolve/main/inswapper_128_fp16.onnx
[ -f models/gfpgan-1024.onnx ] || curl -fL -o models/gfpgan-1024.onnx \
  https://huggingface.co/hacksider/deep-live-cam/resolve/main/gfpgan-1024.onnx

# 7) Face detection models (otherwise downloaded on first launch)
python -c "from modules.model_downloader import ensure_insightface_pack as e; e('buffalo_l')"

echo ""
echo "=== Done! Next: put a character image in 'characters' and double-click 2-start-faceover.command ==="
read -n 1 -s -r -p "Press any key to close"
