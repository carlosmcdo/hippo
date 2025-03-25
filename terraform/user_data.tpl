#!/bin/bash

yum update -y
yum install -y python3

mkdir -p /home/ec2-user/website

aws s3 cp s3://${bucket_name}/index.html /home/ec2-user/website/index.html

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

chown -R ec2-user:ec2-user /home/ec2-user/website

systemctl daemon-reload
systemctl start webserver
systemctl enable webserver
