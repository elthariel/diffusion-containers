variable "REGISTRY" {
  default = "ghcr.io"
}

variable "REGISTRY_USER" {
    default = "flagcatstudio"
}

variable "PYTORCH_TAG" {
  default = "2.4.1-cuda12.1-cudnn9-runtime"
}

variable "CUDA_PATH" {
  default = "cu121"
}

variable "VERSION" {
  default = "0.0.1"
}

variable "CONTAINER_UID" {
  default = "1001"
}

target "default" {
  dockerfile = "./Dockerfile"
  tags = ["${REGISTRY}/${REGISTRY_USER}/runpod-base:${VERSION}-${PYTORCH_TAG}"]
  args = {
    PYTORCH_TAG="${PYTORCH_TAG}"
    VERSION = "${VERSION}"
    CUDA_PATH = "${CUDA_PATH}"
    CONTAINER_UID = "${CONTAINER_UID}"
  }
  platforms = ["linux/amd64"]
  annotations = ["org.opencontainers.image.authors=${REGISTRY_USER}"]
}

target "latest" {
  dockerfile = "./Dockerfile"
  tags = ["${REGISTRY}/${REGISTRY_USER}/runpod-base:latest"]
  args = {
    PYTORCH_TAG="${PYTORCH_TAG}"
    VERSION = "${VERSION}-dev"
    CUDA_PATH = "${CUDA_PATH}"
    CONTAINER_UID = "${CONTAINER_UID}"
  }
  platforms = ["linux/amd64"]
  annotations = ["org.opencontainers.image.authors=${REGISTRY_USER}"]
}
