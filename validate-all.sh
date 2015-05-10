

BLOBS_DIR=./blobs
SCHEMAS_DIR=./schemas

for file in $SCHEMAS_DIR/*
do
    if [[ -f $file ]]; then
        filename=$(basename "$file")
        name="${filename%.*}"
        blob_filename="$BLOBS_DIR/$name.valid.json"
        if [[ -f $blob_filename ]]; then
            python ./validate.py $file $BLOBS_DIR/$name.valid.json
        else
            echo "Skipping $file: no valid blob found"
        fi
    fi
done
