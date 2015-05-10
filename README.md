# TAXII-JSON-schemas

[JSON Schemas](http://json-schema.org/) for TAXII JSON Bindings specification.

Version of the specification supported: 1.02

#### Structure

TAXII JSON schemas are in `schemas/`. TAXII message examples are in `blobs/`


#### Using `validate.py` script to run validations:

- install required packages in virtual environment

```
$ virtualenv venv
$ source venv/bin/activate
(venv) $ pip install -r ./requirements.txt
```

- To validate all valid TAXII messages (useful to test schemas), run:
```
(venv) $ ./validate-all.sh
```

- To validate a specific blob, run `validate.py` with arguments:

```bash
(venv) $ validate.py
Usage: validate.py SCHEMA_PATH BLOB_PATH
```
