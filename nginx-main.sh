#!/bin/bash

sudo systemctl daemon-reload
sudo systemctl reload nginx
sudo systemctl restart nginx
sudo supervisorctl restart ai-training-main_group: