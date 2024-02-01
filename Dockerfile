FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y fortune-mod cowsay

COPY wisecow.sh /app/wisecow.sh

WORKDIR /app

CMD ["./wisecow.sh"]
