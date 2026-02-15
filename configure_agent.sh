#!/bin/bash

sudo apt update -y
sudo apt install -y python3-pip git docker.io net-tools
sudo usermod -aG docker ubuntu

apt install python3.12-venv -y
python3 -m venv venv
source venv/bin/activate


# install python dependencies
pip3 install fastapi uvicorn requests python-dotenv PyGithub jinja2

# install local LLM
curl -fsSL https://ollama.com/install.sh | sh
sudo sed -i '/\[Service\]/a Environment="OLLAMA_HOST=0.0.0.0"' /etc/systemd/system/ollama.service

systemctl daemon-reload
systemctl restart ollama

ollama pull gemma2:2b

mkdir ai-agent
cd ai-agent

#start server
uvicorn main:app --host 0.0.0.0 --port 8000