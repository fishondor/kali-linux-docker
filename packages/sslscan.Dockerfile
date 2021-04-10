FROM fishondor/pentests:base

RUN apt-get update -y

RUN apt-get install sslscan -y