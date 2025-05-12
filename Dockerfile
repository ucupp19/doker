FROM debian
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y && apt install -y \
tmate unzip

COPY start_tmate.sh /usr/local/bin/start_tmate.sh
RUN chmod +x /usr/local/bin/start_tmate.sh

CMD ["/usr/local/bin/start_tmate.sh"]
