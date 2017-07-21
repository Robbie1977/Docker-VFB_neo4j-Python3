FROM python:3

RUN apt-get -y update && \ 
apt-get -y install git curl wget default-jdk

RUN cd /opt/ && \
git clone https://github.com/VirtualFlyBrain/VFB_neo4j.git

ENV PYTHONPATH=/opt/VFB_neo4j/src/

RUN pip3 install psycopg2

RUN pip3 install requests

RUN pip3 install pymysql

RUN pip3 install neo4j-driver

RUN pip install site

RUN mkdir -p /opt/VFB/jython

RUN cd /opt/VFB/jython && wget -rv -nH --cut-dirs=2 -np -R index.html* http://data.virtualflybrain.org/archive/jython/jython.jar 

ENV FILESERVER=tftp://vfbds0.inf.ed.ac.uk

ENV KBSERVER=http://kbw.virtualflybrain.org:7474

ENV PDBSERVER=http://pdl.virtualflybrain.org:7474

ENV PDBuser=user

ENV PDBpassword=password

ENV KBuser=user

ENV KBpassword=password

ENV LMBuser=flycircuit

ENV WORKSPACE=/opt/VFB

COPY connectToLMB.sh /opt/VFB/connectToLMB.sh

COPY loadFBtoProduction.sh /opt/VFB/loadFBtoProduction.sh

COPY once-only-voxel-overlay-to-kb.sh /opt/VFB/once-only-voxel-overlay-to-kb.sh

RUN mkdir -p $HOME/.ssh

RUN echo '    ServerAliveInterval 120' >> /etc/ssh/ssh_config

COPY initialiseKBfromLMB.sh /opt/VFB/initialiseKBfromLMB.sh

COPY PDB-sideloading.sh /opt/VFB/PDB-sideloading.sh

RUN chmod +x /opt/VFB/*.sh

CMD ['/bin/bash']
