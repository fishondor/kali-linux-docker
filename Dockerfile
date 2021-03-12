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

#RUN apt -y update && apt -y upgrade && apt -y autoremove && apt clean

#RUN apt install curl \
 #               figlet \
  #              php \
   #             python-impacket \
    #            python-pip \
     #           python2 \
      #          python3 \
       #         samba \
        #        samdump2 \
         #       smbclient \
          #      socat \
           #     ssh \
            #    vim \
             #   -y --no-install-recommends

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

RUN apt-get install wafw00f -y --no-install-recommends
RUN apt-get install wpscan -y --no-install-recommends
RUN apt-get install seclists -y --no-install-recommends

#RUN apt install aircrack-ng -y --no-install-recommends
#RUN apt install crackmapexec -y --no-install-recommends
#RUN apt install crunch -y --no-install-recommends
#RUN apt install dirb -y --no-install-recommends
#RUN apt install dnsenum -y --no-install-recommends
#RUN apt install dnsrecon -y --no-install-recommends
#RUN apt install dnsutils -y --no-install-recommends
#RUN apt install dos2unix -y --no-install-recommends
#RUN apt install enum4linux -y --no-install-recommends
#RUN apt install exploitdb -y --no-install-recommends
#RUN apt install gobuster -y --no-install-recommends
#RUN apt install hashcat -y --no-install-recommends
#RUN apt install hping3 -y --no-install-recommends
#RUN apt install hydra -y --no-install-recommends
#RUN apt install impacket-scripts -y --no-install-recommends
#RUN apt install john -y --no-install-recommends
#RUN apt install joomscan -y --no-install-recommends
#RUN apt install masscan -y --no-install-recommends
#RUN apt install metasploit-framework -y --no-install-recommends
#RUN apt install mimikatz -y --no-install-recommends
#RUN apt install nasm -y --no-install-recommends
#RUN apt install ncat -y --no-install-recommends
#RUN apt install netcat-traditional -y --no-install-recommends
#RUN apt install nikto -y --no-install-recommends
#RUN apt install nmap -y --no-install-recommends
#RUN apt install patator -y --no-install-recommends
#RUN apt install powersploit -y --no-install-recommends
#RUN apt install recon-ng -y --no-install-recommends
#RUN apt install responder -y --no-install-recommends
#RUN apt install smbmap -y --no-install-recommends
#RUN apt install snmp -y --no-install-recommends
#RUN apt install sqlmap -y --no-install-recommends
#RUN apt install sslscan -y --no-install-recommends
#RUN apt install sslstrip -y --no-install-recommends
#RUN apt install theharvester -y --no-install-recommends
#RUN apt install weevely -y --no-install-recommends
#RUN apt install wfuzz -y --no-install-recommends
#RUN apt install wordlists -y --no-install-recommends


#RUN apt-get install preload \
 #                   bleachbit \
  #                  apt-file \
   #                 scrub \
    #                figlet \
     #               ssh \
      #              net-tools \
       #             tor \
        #            curl \
         #           vim \
          #          -y



