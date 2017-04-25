#!/bin/sh

python3 /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/flybase2neo/import_all_pub_data.py $PDBSERVER $PDBuser $PDBpassword
python3 /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/flybase2neo/import_all_features.py $PDBSERVER $PDBuser $PDBpassword
python3 /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/flybase2neo/import_all_expression_data.py $PDBSERVER $PDBuser $PDBpassword

