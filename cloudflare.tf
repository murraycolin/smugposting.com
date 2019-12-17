provider "cloudflare" {
  # email pulled from $CLOUDFLARE_EMAIL
  # token pulled from $CLOUDFLARE_TOKEN
}

variable "domain" {
  default = "smugposting.com"
}

# resource "cloudflare_zone" "smugposting-com" {
#  zone       = "smugposting.com"
#  jump_start = false
#  plan       = "enterprise"
#  type       = "full"
# }

resource "cloudflare_zone_settings_override" "smugposting-com" {
  name = var.domain
  settings {
    always_online            = "off"
    always_use_https         = "on"
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
    waf                      = "on"
  }
}
resource "cloudflare_record" "Www" {
  domain = var.domain
  name = "httpbin"
  value = "35.209.9.25"
  type = "A"
  proxied = true
}
