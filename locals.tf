locals {
  current_cidr = "${chomp(data.http.current_ip.response_body)}/32"
}