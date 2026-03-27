# Go to Settings > Secrets and variables > Actions

# Docker Hub credentials
DOCKER_USERNAME=your_dockerhub_username
DOCKER_PASSWORD=your_dockerhub_token

# Development server
DEV_HOST=192.168.1.100
DEV_USER=ubuntu
DEV_SSH_PRIVATE_KEY=-----BEGIN RSA PRIVATE KEY-----
...
-----END RSA PRIVATE KEY-----

# Production (Kubernetes)
KUBE_CONFIG=<base64_encoded_kubeconfig>

# Monitoring
SLACK_BOT_TOKEN=xoxb-...
CODECOV_TOKEN=...

# Database (optional)
DB_PASSWORD=production_db_password
REDIS_PASSWORD=redis_password