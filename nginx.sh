#!/bin/bash

sudo supervisorctl restart ai-training_group:
sudo systemctl restart nginx
