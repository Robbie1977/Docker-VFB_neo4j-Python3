
#!/bin/bash

#only run once!!!!

/opt/VFB/connectToLMB.sh

cd /opt/VFB_neo4j/src/

if [ -n "$CHUNKSIZE" ]
then 
  sed -i s/'chunk_length = 2000'/'chunk_length = '$CHUNKSIZE/ /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/lmb2neoKB/add_voxel_overlap.py
fi

if [ -n "$STARTNUM" ]
then
  if [ -n "$ENDNUM" ]
  then
    sed -i s/neuron_neuropil_overlaps:/neuron_neuropil_overlaps[$STARTNUM:$ENDNUM]:/ /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/lmb2neoKB/add_voxel_overlap.py
  else
    sed -i s/neuron_neuropil_overlaps:/neuron_neuropil_overlaps[$STARTNUM:]:/ /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/lmb2neoKB/add_voxel_overlap.py
  fi
fi

python3 /opt/VFB_neo4j/src/uk/ac/ebi/vfb/neo4j/lmb2neoKB/add_voxel_overlap.py $KBSERVER $KBuser $KBpassword $LMBuser
