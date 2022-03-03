# https://hub.docker.com/r/testim/docker-cli

FROM testim/docker-cli:latest
WORKDIR /opt/testim-runner

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/opt/testim-runner/entrypoint.sh"]
