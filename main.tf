// google provider

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

// creating my-vpc

resource "google_compute_network" "vpc_network" {
  name                    = "my-vpc"
  auto_create_subnetworks = false
}

// creating public subnet

resource "google_compute_subnetwork" "public_subnet" {
  name          = "my-public"
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
}

// creating private subnet

resource "google_compute_subnetwork" "private_subnet" {
  name          = "my-private"
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region
}

// creating instance

resource "google_compute_instance" "web_server" {
  name         = "nginx-server"
  machine_type = "e2-micro" // machine type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" // image type
    }
  }

  network_interface {
    network       = google_compute_network.vpc_network.name
    subnetwork    = google_compute_subnetwork.public_subnet.name
    access_config {
    }
  }

// installing nginx server

  metadata_startup_script = <<-EOF
    #! /bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx
  EOF

  tags = ["http-server", "https-server"]
}

// opening ports

resource "google_compute_firewall" "default-allow-http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "default-allow-https" {
  name    = "allow-https"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https-server"]
}
