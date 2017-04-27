#!/bin/bash

#only run once!!!!

/opt/VFB/connectToLMB.sh

python3 /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/lmb2neoKB/import_data_source.py $KBSERVER $KBuser $KBpassword $LMBuser

python3 /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/ontologies_2_KB.py $KBSERVER $KBuser $KBpassword

python3 /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/lmb2neoKB/load_features_from_lmb.py $KBSERVER $KBuser $KBpassword $LMBuser

python3 /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/lmb2neoKB/import_individuals_lmb2KB.py $KBSERVER $KBuser $KBpassword $LMBuser

python3 /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/lmb2neoKB/add_clusters.py $KBSERVER $KBuser $KBpassword $LMBuser

python3 /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/lmb2neoKB/add_annotations.py $KBSERVER $KBuser $KBpassword $LMBuser

