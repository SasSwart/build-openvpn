variable "cloudflare_zone_id" {
    type = string
}

output "openvpn-ip" {
    value = digitalocean_droplet.openvpn.ipv4_address
}

output "ca-ip" {
    value = digitalocean_droplet.ca.ipv4_address
}