

BLOBS_DIR=./blobs
SCHEMAS_DIR=./schemas

for file in $SCHEMAS_DIR/*
do
    if [[ -f $file ]]; then
        filename=$(basename "$file")
        name="${filename%.*}"
        blob_filename="$BLOBS_DIR/$name.valid.json"
        if [[ -f $blob_filename ]]; then
            echo "Validating $blob_filename against $file:"
            python ./validate.py $file $BLOBS_DIR/$name.valid.json
            echo
        else
            echo "No blob found for $file, skipping"
            echo
        fi
    fi
done
