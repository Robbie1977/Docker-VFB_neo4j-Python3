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

ENV FILESERVER=tftp://vfbds0.inf.ed.ac.uk

ENV KBSERVER=http://kb.virtualflybrain.org:7474

ENV PDBSERVER=http://pdb.virtualflybrain.org:7474

ENV PDBuser=user

ENV PDBpassword=password

ENV KBuser=user

ENV KBpassword=password

ENV LMBuser=flycircuit

ENV WORKSPACE=/opt

COPY connectToLMB.sh /opt/VFB/connectToLMB.sh

COPY loadFBtoProduction.sh /opt/VFB/loadFBtoProduction.sh

RUN mkdir -p $HOME/.ssh

RUN echo '    ServerAliveInterval 120' >> /etc/ssh/ssh_config

COPY initialiseKBfromLMB.sh /opt/VFB/initialiseKBfromLMB.sh

RUN chmod +x /opt/VFB/*.sh

CMD ['/bin/bash']
