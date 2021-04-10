FROM fishondor/pentests:base

RUN apt-get update -y

RUN apt-get install wpscan -y --no-install-recommends