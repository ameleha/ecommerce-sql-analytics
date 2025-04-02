FROM gitpod/workspace-full

USER root
RUN apt-get update && apt-get install -y postgresql postgresql-contrib curl unzip
USER gitpod
