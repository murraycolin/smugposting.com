resource "cloudflare_record" "Www" {
  domain = var.domain
  name = "httpbin"
  value = "35.209.9.25"
  type = "A"
  proxied = true
}
