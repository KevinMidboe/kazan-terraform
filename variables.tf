variable "k8s_controllers" {
  description = "k8s controller node variables as a dictionary"
  type        = map(any)
}

variable "k8s_workers" {
  description = "k8s worker node variables as a dictionary"
  type        = map(any)
}