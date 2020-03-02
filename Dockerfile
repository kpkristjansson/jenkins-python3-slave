FROM jenkins/jnlp-slave:3.27-1

USER root
RUN apt-get update
RUN apt-get install -y \
        software-properties-common \
        build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
RUN wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
RUN tar -xf Python-3.7.4.tgz
RUN cd Python-3.7.4 && \
        ./configure --enable-optimizations && \
        make altinstall
RUN apt-get update
RUN apt-get install -y \
        python3-pip \
        jq \
        git \
        zip \
        python3-venv
USER jenkins