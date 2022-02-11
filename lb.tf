module "global_lb" {
  depends_on = [
    google_project_service.service
  ]
  source  = "GoogleCloudPlatform/lb-http/google//modules/serverless_negs"
  version = "~> 5.1"
  name    = local.load_balancer_name
  project = var.project_id

  ssl                             = var.ssl
  managed_ssl_certificate_domains = [var.domain]
  https_redirect                  = var.ssl
  create_url_map                  = false
  url_map                         = google_compute_url_map.this.self_link

  backends = {
    default = {
      description = null
      groups = [
        {
          group = google_compute_region_network_endpoint_group.region1.id
        },
        {
          group = google_compute_region_network_endpoint_group.region2.id
        }
      ]
      enable_cdn              = false
      security_policy         = null
      custom_request_headers  = null
      custom_response_headers = null

      iap_config = {
        enable               = false
        oauth2_client_id     = ""
        oauth2_client_secret = ""
      }
      log_config = {
        enable      = false
        sample_rate = null
      }
    },
    region1 = {
      description = null
      groups = [
        {
          group = google_compute_region_network_endpoint_group.region1.id
        },

      ]
      enable_cdn              = false
      security_policy         = null
      custom_request_headers  = null
      custom_response_headers = null

      iap_config = {
        enable               = false
        oauth2_client_id     = ""
        oauth2_client_secret = ""
      }
      log_config = {
        enable      = false
        sample_rate = null
      }
    },
    region2 = {
      description = null
      groups = [
        {
          group = google_compute_region_network_endpoint_group.region2.id
        },

      ]
      enable_cdn              = false
      security_policy         = null
      custom_request_headers  = null
      custom_response_headers = null

      iap_config = {
        enable               = false
        oauth2_client_id     = ""
        oauth2_client_secret = ""
      }
      log_config = {
        enable      = false
        sample_rate = null
      }
    },
  }
}

resource "google_compute_region_network_endpoint_group" "region1" {
  depends_on = [
    google_project_service.service
  ]
  project               = var.project_id
  provider              = google-beta
  name                  = "region1-${var.region1}-serverless-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region1
  cloud_run {
    service = google_cloud_run_service.region1.name
  }
}

resource "google_compute_region_network_endpoint_group" "region2" {
  depends_on = [
    google_project_service.service
  ]
  project               = var.project_id
  provider              = google-beta
  name                  = "region2-${var.region2}-serverless-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region2
  cloud_run {
    service = google_cloud_run_service.region2.name
  }
}
