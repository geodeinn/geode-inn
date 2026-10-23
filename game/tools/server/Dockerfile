# The Geode Inn server in a container.
#   docker build -t geode-inn-server .            (with geode-inn-server.x86_64 in this folder)
#   docker run -d --name geode-inn --restart unless-stopped \
#     -p 24770:24770/udp -v geode-inn-data:/data geode-inn-server
FROM debian:bookworm-slim
RUN useradd --system --home-dir /data --create-home geodeinn
COPY --chmod=0755 geode-inn-server.x86_64 /opt/geode-inn/geode-inn-server.x86_64
USER geodeinn
ENV HOME=/data
WORKDIR /opt/geode-inn
EXPOSE 24770/udp
VOLUME ["/data"]
STOPSIGNAL SIGINT
CMD ["/opt/geode-inn/geode-inn-server.x86_64", "--headless", "--", "--server", "--port", "24770"]
