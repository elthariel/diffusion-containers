# containers

Public containers to use on RunPod or other GPU boxes

**WIP**: This is a work in progress and is mostly unusable now for people
outside of the authors and friends

## Images

The images are based of the [pytorch official
images](https://hub.docker.com/r/pytorch/pytorch/) and use
[s6-overlay](https://github.com/just-containers/s6-overlay) for process
management inside of the container

All the containers assume to have a writable, persistent storage mounted at `/workspace`

### runpod-base

The foundational image with basic dependencies and Jupyter Lab on port 8001

### experiments

An image to experiment on diffusion models. It currently only has *ComfyUI*

#### Service and Ports

- Jupyter Lab: 8001
- ComfyUI: 8010
