variable "REGISTRY" {
  default = "ghcr.io"
}

variable "REGISTRY_USER" {
    default = "flagcatstudio"
}

variable "BASE_IMAGE_NAME" {
  default = "runpod-base"
}

variable "BASE_IMAGE_TAG" {
  default = "0.0.1-2.4.1-cuda12.1-cudnn9-runtime"
}

variable "VERSION" {
  default = "0.0.1"
}

target "default" {
  dockerfile = "./Dockerfile"
  tags = ["${REGISTRY}/${REGISTRY_USER}/experiments:${VERSION}"]
  args = {
    BASE_IMAGE="${REGISTRY}/${REGISTRY_USER}/${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG}"
    VERSION = "${VERSION}"
    XFORMERS_VERSION = "0.0.19"
  }
  platforms = ["linux/amd64"]
  annotations = ["org.opencontainers.image.authors=${REGISTRY_USER}"]
}
