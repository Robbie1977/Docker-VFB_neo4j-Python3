#!/bin/sh

cd /opt/ && \
git clone https://github.com/VirtualFlyBrain/VFB_owl.git


echo ''
echo '** Side loading from vfb owl: add_annonymous types **'

export PYTHONPATH=${WORKSPACE}/VFB_owl/src/code/mod/:${WORKSPACE}/VFB_owl/src/code/owl2neo/:${WORKSPACE}/VFB_owl/src/code/db_maintenance/:${WORKSPACE}/VFB_owl/src/code/entity_checks/:${WORKSPACE}/VFB_owl/src/code/export/:${WORKSPACE}/VFB_owl/src/code/owl_gen/:${WORKSPACE}/VFB_owl/src/code/unit_tests/

sleep 10

java -cp ${WORKSPACE}/VFB_owl/lib/*:${WORKSPACE}/jython/jython.jar org.python.util.jython -Dpython.path=$PYTHONPATH ${WORKSPACE}/VFB_owl/src/code/owl2neo/add_anonymous_types.py $PDBSERVER $PDBuser $PDBpassword ${WORKSPACE}/VFB_owl/src/owl/vfb.owl

sleep 10


echo ''
echo '** Side loading from vfb owl: add refs **'

java -cp ${WORKSPACE}/VFB_owl/lib/*:${WORKSPACE}/jython/jython.jar org.python.util.jython -Dpython.path=$PYTHONPATH ${WORKSPACE}/VFB_owl/src/code/owl2neo/add_refs_for_anat.py $PDBSERVER $PDBuser $PDBpassword ${WORKSPACE}/VFB_owl/src/owl/vfb.owl

sleep 10

export PYTHONPATH=${WORKSPACE}/VFB_neo4j/src/

echo ''
echo '** Loading from FB : import pub data **'

# docker run -e PYTHONPATH="$PYTHONPATH"  -e KBuser=$KBuser -e KBpassword=$KBpassword -e LMBuser=$LMBuser -e FILESERVER=$FILESERVER -e KBSERVER=$KBSERVER rcourt/docker-vfb_neo4j-python3 python3 ${WORKSPACE}/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/flybase2neo/import_pub_data.py
python3 ${WORKSPACE}/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/flybase2neo/import_pub_data.py $PDBSERVER $PDBuser $PDBpassword

sleep 10


echo ''
echo '** Denormalization: Make named edges **'

# docker run -e PYTHONPATH="$PYTHONPATH"  -e PDBuser=$PDBuser -e PDBpassword=$PDBpassword -e FILESERVER=$FILESERVER -e PDBSERVER=$PDBSERVER rcourt/docker-vfb_neo4j-python3 python3 ${WORKSPACE}/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/neo2neo/make_named_edges.py $PDBSERVER $PDBuser $PDBpassword
python3 ${WORKSPACE}/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/neo2neo/make_named_edges.py $PDBSERVER $PDBuser $PDBpassword

sleep 10
