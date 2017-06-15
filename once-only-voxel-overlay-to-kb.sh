
#!/bin/bash

#only run once!!!!

/opt/VFB/connectToLMB.sh

python3 /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/lmb2neoKB/add_voxel_overlap.py $KBSERVER $KBuser $KBpassword $LMBuser
