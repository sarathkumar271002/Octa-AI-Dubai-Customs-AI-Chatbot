#!/bin/bash

sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl status

echo "Supervisor configured"