FROM fishondor/pentests:base

RUN apt-get update -y

RUN apt-get install wafw00f -y --no-install-recommends
RUN apt-get install wpscan -y --no-install-recommends
RUN apt-get install dirb -y --no-install-recommends
RUN apt-get install sslscan -y --no-install-recommends
RUN apt-get install sqlmap -y --no-install-recommends
RUN apt-get install weevely -y --no-install-recommends
RUN apt-get install nmap -y --no-install-recommends