FROM python:3-slim

RUN apt-get -update --quiet && \ 
apt-get install --quiet git

RUN cd /opt/ && \
git clone https://github.com/VirtualFlyBrain/VFB_neo4j.git && \

ENV PYTHONPATH=/opt/VFB_neo4j/src/

CMD['python3']
