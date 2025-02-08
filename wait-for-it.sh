open-webui:
  image: ghcr.io/open-webui/open-webui:main
  network_mode: "host"
  environment:
    - OLLAMA_BASE_URL=http://127.0.0.1:11434
    - PORT=9090
    - DATABASE_URL=postgresql://dbuser:dbpassword@db:5432/openwebui
  volumes:
    - open-webui:/app/backend/data
  ports:
    - 9090:9090
  restart: always
  depends_on:
    - db
  command: ["./wait-for-it.sh", "db:5432", "--", "npm", "start"]
