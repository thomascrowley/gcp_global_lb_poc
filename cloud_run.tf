resource "google_cloud_run_service" "region1" {
  depends_on = [
    google_project_service.service
  ]
  name     = var.region1
  location = var.region1
  project  = var.project_id

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
      }
    }
  }
}

resource "google_cloud_run_service" "region2" {
  depends_on = [
    google_project_service.service
  ]
  name     = var.region2
  location = var.region2
  project  = var.project_id

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
      }
    }
  }
}
