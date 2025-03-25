#!/bin/bash

# Update system and install Python 3
yum update -y
yum install -y python3

# Create directory for website
mkdir -p /home/ec2-user/website

# Copy the HTML file from S3
aws s3 cp s3://${bucket_name}/index.html /home/ec2-user/website/index.html

# Create a systemd service to run the Python HTTP server
cat << EOF > /etc/systemd/system/webserver.service
[Unit]
Description=Python HTTP Server
After=network.target

[Service]
Type=simple
User=ec2-user
WorkingDirectory=/home/ec2-user/website
ExecStart=/usr/bin/python3 -m http.server 80
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Set proper permissions
chown -R ec2-user:ec2-user /home/ec2-user/website

# Start and enable the service
systemctl daemon-reload
systemctl start webserver
systemctl enable webserver