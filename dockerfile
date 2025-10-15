USER root
RUN mkdir -p /home/node/data \
    && chown -R node:node /home/node/data \
    && chmod -R 700 /home/node/data
USER node