FROM debian:bookworm-slim AS base
RUN apt-get update && apt-get install -y --no-install-recommends tini && rm -rf /var/lib/apt/lists/*

FROM rustdesk/rustdesk-server:latest AS rustdesk

FROM base
COPY --from=rustdesk /usr/bin/hbbs /usr/bin/hbbs
COPY --from=rustdesk /usr/bin/hbbr /usr/bin/hbbr
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 21115/tcp 21116/tcp 21116/udp 21117/tcp 21118/tcp 21119/tcp

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/entrypoint.sh"]
