resource "digitalocean_droplet" "openvpn" {
  image  = "ubuntu-18-04-x64"
  name   = "openvpn"
  region = "lon1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.saspc.id]
}

resource "digitalocean_droplet" "ca" {
  image  = "ubuntu-18-04-x64"
  name   = "ca"
  region = "lon1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.saspc.id] 
}

resource "cloudflare_record" "openvpn" {
  zone_id = var.cloudflare_zone_id
  name    = "openvpn"
  value   = digitalocean_droplet.openvpn.ipv4_address
  type    = "A"
  ttl     = 60
}

resource "cloudflare_record" "ca" {
  zone_id = var.cloudflare_zone_id
  name    = "ca"
  value   = digitalocean_droplet.ca.ipv4_address
  type    = "A"
  ttl     = 60
}

data "digitalocean_ssh_key" "saspc" {
  name = "Sas PC"
}