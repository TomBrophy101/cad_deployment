#!/bin/bash

# Install your Python environment
apt-get update -y
apt-get install -y python3.14-venv
python3.14 -m venv venv
source venv/bin/activate

# Clon the latest app directly onto the server
git clone https://github.com/gestrada3/CAD_backend_app.git
cd CAD_backend_app
pip install -r requirements.txt

# Connection string
export DATABASE_URL="postgresql+psycopg2://${db_user}:${db_pwd}@${db_host}:${db_port}"

# Run Uvicorn on given port and bound to all interfaces
uvicorn app.main:app --host 0.0.0.0 --port ${app_port} > uvicorn.log 2>&1 &
