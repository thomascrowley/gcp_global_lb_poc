resource "google_compute_url_map" "this" {
  name            = local.load_balancer_name
  default_service = module.global_lb.backend_services["default"].self_link
  project         = var.project_id
  host_rule {
    hosts        = ["*"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = module.global_lb.backend_services["default"].self_link

    path_rule {
      paths = [
        "/region1",
        "/region1/*"
      ]
      service = module.global_lb.backend_services["region1"].self_link
    }

    path_rule {
      paths = [
        "/region2",
        "/region2/*"
      ]
      service = module.global_lb.backend_services["region2"].self_link
    }
  }
}
