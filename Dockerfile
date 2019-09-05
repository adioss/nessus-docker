FROM debian:latest
ENV NESSUS_VERSION=8.6.0-debian6_amd64

# from https://www.tenable.com/downloads/nessus
ADD Nessus-${NESSUS_VERSION}.deb /tmp/Nessus-${NESSUS_VERSION}.deb
RUN apt-get update -y \
    && apt-get install -y apt-utils tzdata \
    && dpkg -i /tmp/Nessus-${NESSUS_VERSION}.deb \
    && rm -r /tmp/Nessus-${NESSUS_VERSION}.deb

EXPOSE 8834
CMD service nessusd start && tail -f /dev/null
