FROM python:3-slim

RUN apt-get -y update && \ 
apt-get -y install git

RUN cd /opt/ && \
git clone https://github.com/VirtualFlyBrain/VFB_neo4j.git

ENV PYTHONPATH=/opt/VFB_neo4j/src/

CMD['python3']
