provider "cloudflare" {
  version = "~> 2.0"
  email   = "var.cloudflare_email"
  api_key = "var.cloudflare_api_key"
  account_id = "var.cloudflare_account_id"
}

resource "cloudflare_zone_settings_override" "smugposting-com" {
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
