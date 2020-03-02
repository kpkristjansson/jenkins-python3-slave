FROM jenkins/jnlp-slave:3.27-1

USER root
RUN apt update
RUN apt install -y \
        software-properties-common \
        build-essential \
        zlib1g-dev \
        libncurses5-dev \
        libgdbm-dev \
        libnss3-dev \
        libssl-dev \
        libreadline-dev \
        libffi-dev \
        wget
RUN wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
RUN tar -xf Python-3.7.4.tgz
RUN cd Python-3.7.4 && \
        ./configure --enable-optimizations && \
        make altinstall
RUN apt update
RUN apt install -y \
        python3-pip \
        jq \
        git \
        zip \
        python3-venv
RUN apt update
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
RUN apt update
RUN apt install -y \
        ansible \
        python-jinja2 \
        python-yaml \
        python-paramiko \
        python-httplib2 \
        python-crypto \
        python-setuptools \
        python-psutil \
        sshpass
USER jenkins