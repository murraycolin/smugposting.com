provider "cloudflare" {
  version = "~> 2.0"
  email   = "${var.cloudflare_email}"
  api_key = "${var.cloudflare_api_key}"
}

# resource "cloudflare_zone" "smugposting-com" {
#  zone       = "smugposting.com"
#  jump_start = false
#  plan       = "enterprise"
#  type       = "full"
# }

resource "cloudflare_zone_settings_override" "smugposting-com" {
  zone_id = "0dd19e161132372b7086a432579d640b"
  settings {
    always_online            = "off"
    always_use_https         = "on"
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
    waf                      = "on"
  }
}

resource "cloudflare_record" "www" {
  zone_id = "0dd19e161132372b7086a432579d640b"
  name = "httpbin"
  value = "35.209.9.25"
  type = "A"
  proxied = true
}
