import sys
import os
import json
from jsonschema import validate, RefResolver

def read_json(path):
    with open(path, 'r') as f:
        return json.loads(f.read())


if __name__ == '__main__':

    if len(sys.argv) != 3:
        print "Usage: %s SCHEMA_PATH BLOB_PATH" % __file__
        sys.exit(1)

    
    schema_path = sys.argv[1]
    blob_path = sys.argv[2]

    schema = read_json(schema_path)
    blob = read_json(blob_path)

    schemas_dir = os.path.dirname(os.path.realpath(schema_path))


    # python-jsonschema needs base_uri (it needs to be with trailing /)
    # to be able to resolve local files references
    resolver = RefResolver(referrer=schema, base_uri='file://' + schemas_dir + '/')

    try:
        validate(blob, schema, resolver=resolver)
        print "Validation succeeded"
    except:
        print "Validation failed"
        raise


