#! /bin/bash

src=/opt/comfyui
dest=/workspace/apps/comfyui

echo "Syncing ComfyUI to workspace"
chown -R user "$src"
mkdir -p "$dest"
rsync -az "$src"/ "$dest"
