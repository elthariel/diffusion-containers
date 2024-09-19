#! /bin/bash


#
# Download Comfy & Extract UI
#
comfyui_path="/opt/comfyui/"
git clone -b "v${COMFY_VERSION}" https://github.com/comfyanonymous/ComfyUI.git \
    "$comfyui_path"
pushd "$comfyui_path"
git switch -c "v${COMFY_VERSION}"
popd

#
# Prepare venv
#
python -m venv --symlinks --system-site-packages /opt/venv/comfyui
. /opt/venv/comfyui/bin/activate
pip install --no-cache-dir -r "${comfyui_path}/requirements.txt"

#
# Install Comfy Manager
#
comfyui_manager="${comfyui_path}/custom_nodes/ComfyUI-Manager"
git clone --depth 1 https://github.com/ltdrdata/ComfyUI-Manager.git \
    "$comfyui_manager"
pip install --no-cache-dir \
    -r "${comfyui_manager}/requirements.txt"
