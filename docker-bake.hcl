variable "FRP_VER" {
}

variable "FRP_URL" {
}

group "default" {
  targets = ["frp"]
}

target "frp" {
  context    = "."
  dockerfile = "Dockerfile"

  args = {
    FRP_VER = FRP_VER
    FRP_URL = FRP_URL
  }

  tags = [
    "docker.io/quackerd/frp:${FRP_VER}",
    "docker.io/quackerd/frp:latest"
  ]
}