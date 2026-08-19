resource "aws_instance" "web" {
  count = var.web_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.web_security_group_id]
  key_name               = var.key_name

  user_data = <<-EOT
    #!/bin/bash
    dnf install -y httpd
    systemctl enable httpd
    systemctl start httpd

    cat > /var/www/html/index.html <<HTML
    <html>
      <head><title>Experiment 2</title></head>
      <body>
        <h1>Experiment 2 - Web Server ${count.index + 1}</h1>
        <p>Advanced Infrastructure as Code</p>
      </body>
    </html>
    HTML
  EOT

  tags = {
    Name = "exp2-web-${count.index + 1}"
    Tier = "web"
  }
}

resource "aws_instance" "db" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.db_security_group_id]
  key_name               = var.key_name

  user_data = <<-EOT
    #!/bin/bash
    dnf install -y mariadb105-server
    systemctl enable mariadb
    systemctl start mariadb
  EOT

  tags = {
    Name = "exp2-database"
    Tier = "database"
  }
}
