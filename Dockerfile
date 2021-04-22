FROM kalilinux/kali-rolling

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y

RUN apt-get install preload \
                    git \
                    ftp \
                    bleachbit \
                    apt-file \
                    scrub \
                    figlet \
                    ssh \
                    net-tools \
                    curl \
                    vim \
                    whois \
                    wget \
                    python3-distutils \
                    jq \
                    iputils-ping \
                    man \
                    -y

RUN apt-get install proxychains tor -y

RUN echo 'figlet hello wisestampers!!' >> /root/.bashrc

WORKDIR /etc/ssh
RUN mkdir keys_backup_ssh && \
    mv ssh_host_* keys_backup_ssh && \
    dpkg-reconfigure openssh-server

WORKDIR /etc
RUN sed -i 's/strict_chain/#strict_chain/' proxychains.conf && \
    sed -i 's/#dynamic_chain/dynamic_chain/' proxychains.conf && \
    echo 'socks5 127.0.0.1 9050' >> proxychains.conf

WORKDIR /usr/bin
COPY config/get-list .
RUN chmod +x get-list

WORKDIR /
COPY config/wrapper-scripts.sh /

ENTRYPOINT /wrapper-scripts.sh && /bin/bash