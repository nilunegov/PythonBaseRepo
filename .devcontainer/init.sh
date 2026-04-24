#!/usr/bin/env bash
set -e

PROJECT_ROOT=/workspace

echo "Fix ownership..."
sudo chown -R vscode:vscode $PROJECT_ROOT

# ----------------------
# Python venv
# ----------------------
export UV_LINK_MODE=copy
uv sync --extra dev