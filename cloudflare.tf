provider "cloudflare" {
  version = "~> 2.0"
  account_id = "var.cloudflare_account_id"
}

resource "cloudflare_zone_settings_override" "domain" {
  zone_id = "var.cloudflare_zone_id"
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
  zone_id = "var.cloudflare_zone_id"
  name = "httpbin"
  value = "35.209.9.25"
  type = "A"
  proxied = true
}
