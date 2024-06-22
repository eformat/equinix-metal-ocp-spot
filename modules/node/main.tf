resource "equinix_metal_spot_market_request" "spot_request" {
  count = var.node_count

  project_id    = var.project_id
  metro         = var.metro
  max_bid_price = var.max_bid_price
  devices_min   = 1
  devices_max   = 1
  wait_for_devices = true

  instance_parameters {
    hostname         = format("%s-%01d.%s.%s", var.node_type, count.index, var.cluster_name, var.cluster_basedomain)
    operating_system = "custom_ipxe"
    ipxe_script_url  = "http://${var.bastion_ip}:8080/${var.node_type}.ipxe"
    plan             = var.plan
    billing_cycle    = "hourly"
    tags             = ["cluster_name=${var.cluster_name}", "node_type=${var.node_type}"]
  }
}

resource "equinix_metal_device" "node" {
  count = var.node_count

  depends_on       = [var.depends, equinix_metal_spot_market_request.spot_request]
  hostname         = format("%s-%01d.%s.%s", var.node_type, count.index, var.cluster_name, var.cluster_basedomain)
  operating_system = "custom_ipxe"
  ipxe_script_url  = "http://${var.bastion_ip}:8080/${var.node_type}.ipxe"
  plan             = var.plan
  metro            = var.metro
  billing_cycle    = "hourly"
  project_id       = var.project_id
}

