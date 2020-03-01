FROM jenkins/jnlp-slave:3.27-1

USER root
RUN apt-get update
RUN apt-get install -y \
        python3 \
        python3-pip \
        jq \
        git \
        zip
USER jenkins