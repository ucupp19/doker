FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y && apt install -y \
tmate unzip

CMD ["tmate", "-F"]
