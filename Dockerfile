FROM node:8
RUN apt-get update && \
    apt-get -y install python-dev python-pip
RUN pip install awscli
RUN pip --help && \
    aws --version
