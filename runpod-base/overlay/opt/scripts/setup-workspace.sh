#! /bin/bash

echo "Setting up /workspace"
chown -R user:user /opt/workspace.tpl
rsync -az /opt/workspace.tpl/ /workspace
