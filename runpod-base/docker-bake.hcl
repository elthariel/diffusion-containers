variable "REGISTRY" {
  default = "ghcr.io"
}

variable "REGISTRY_USER" {
    default = "flagcatstudio"
}

variable "PYTORCH_TAG" {
  default = "2.4.1-cuda12.1-cudnn9-runtime"
}

variable "VERSION" {
  default = "0.0.1"
}

target "default" {
  dockerfile = "./Dockerfile"
  tags = ["${REGISTRY}/${REGISTRY_USER}/runpod-base:${VERSION}-${PYTORCH_TAG}"]
  args = {
    PYTORCH_TAG="2.4.1-cuda12.1-cudnn9-runtime"
    VERSION = "${VERSION}"
    CUDA_PATH = "cu121"
  }
  platforms = ["linux/amd64"]
  annotations = ["org.opencontainers.image.authors=${REGISTRY_USER}"]
}
