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
                    wget \
                    -y

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

RUN apt-get install wafw00f -y --no-install-recommends
RUN apt-get install wpscan -y --no-install-recommends
RUN apt-get install dirb -y --no-install-recommends

RUN wget https://github.com/Arachni/arachni/releases/download/v1.5.1/arachni-1.5.1-0.5.12-linux-x86_64.tar.gz && \
    tar -xvf arachni-1.5.1-0.5.12-linux-x86_64.tar.gz && \
    echo "alias arachni-start='arachni-1.5.1-0.5.12/bin/arachni_web'" >> /root/.bashrc

ENTRYPOINT /wrapper-scripts.sh && /bin/bash