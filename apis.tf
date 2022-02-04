resource "google_project_service" "service" {
  for_each = toset(["compute", "run", "networkservices"])

  service                    = "${each.key}.googleapis.com"
  project                    = var.project_id
  disable_on_destroy         = true
  disable_dependent_services = true
}
