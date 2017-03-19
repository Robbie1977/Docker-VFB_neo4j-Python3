FROM python:3-slim

RUN apt-get -y update && \ 
apt-get -y install git curl

RUN cd /opt/ && \
git clone https://github.com/VirtualFlyBrain/VFB_neo4j.git

ENV PYTHONPATH=/opt/VFB_neo4j/src/

RUN pip3 install psycopg2

RUN pip3 install requests

RUN pip3 install pymysql

RUN pip3 install neo4j-driver

RUN mkdir -p /opt/VFB

COPY lmb.sh /opt/VFB/lmb.sh

RUN chmod +x /opt/VFB/lmb.sh

CMD ['python3']
