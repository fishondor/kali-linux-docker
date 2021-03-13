FROM kalilinux/kali-rolling

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y

RUN apt-get install preload \
                    proxychains \
                    git \
                    ftp \
                    bleachbit \
                    apt-file \
                    scrub \
                    figlet \
                    ssh \
                    net-tools \
                    tor \
                    curl \
                    vim \
                    whois \
                    -y

RUN echo 'figlet hello wisestampers!!' >> /root/.bashrc

WORKDIR /etc/ssh
RUN mkdir keys_backup_ssh && \
    mv ssh_host_* keys_backup_ssh && \
    dpkg-reconfigure openssh-server
WORKDIR /

WORKDIR /etc
RUN sed -i 's/strict_chain/#strict_chain/' proxychains.conf && \
    sed -i 's/#dynamic_chain/dynamic_chain/' proxychains.conf && \
    echo 'socks5 127.0.0.1 9050' >> proxychains.conf
WORKDIR /

WORKDIR /usr/bin
COPY config/get-seclists .
RUN chmod +x get-seclists
WORKDIR /

RUN apt-get install wafw00f -y --no-install-recommends
RUN apt-get install wpscan -y --no-install-recommends