variable "FRP_TAG" {
}

variable "FRP_TAG_LATEST" {
}

group "default" {
  targets = ["frp"]
}

target "frp" {
  context    = "."
  dockerfile = "Dockerfile"

  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]

  tags = [
    FRP_TAG,
    FRP_TAG_LATEST
  ]
}