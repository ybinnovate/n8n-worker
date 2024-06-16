# Use the n8n image as the base
FROM docker.n8n.io/n8nio/n8n:latest

USER root

RUN npm install -g youtube-captions-scraper pdf-parse mammoth csv-parser

USER node

ARG PGPASSWORD
ARG PGHOST
ARG PGPORT
ARG PGDATABASE
ARG PGUSER



ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=$PGDATABASE
ENV DB_POSTGRESDB_HOST=$PGHOST
ENV DB_POSTGRESDB_PORT=$PGPORT
ENV DB_POSTGRESDB_USER=$PGUSER
ENV DB_POSTGRESDB_PASSWORD=$PGPASSWORD
ENV N8N_LOG_LEVEL=debug



ENV N8N_ENCRYPTION_KEY=W0rAjnjtd6

WORKDIR /home/nodes/
RUN npm install n8n-nodes-browserless
RUN npm install n8n-nodes-yaml
RUN npm install n8n-nodes-youtube-transcript


CMD ["n8n worker"]
