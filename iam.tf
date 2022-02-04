resource "google_cloud_run_service_iam_member" "public_access_region1" {
  location = google_cloud_run_service.region1.location
  project  = google_cloud_run_service.region1.project
  service  = google_cloud_run_service.region1.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_cloud_run_service_iam_member" "public_access_region2" {
  location = google_cloud_run_service.region2.location
  project  = google_cloud_run_service.region2.project
  service  = google_cloud_run_service.region2.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
