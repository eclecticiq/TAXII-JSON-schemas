# taxii-json-schemas-draft

#### Structure

TAXII json schemas (partial coverage of the data model) are in `schemas/`. JSON blob examples are in `blobs/`


#### Using `validate.py` script to run validations:

- install [`jsonschema`](https://pypi.python.org/pypi/jsonschema) in virtualenv:

```
pip install jsonschema
```

- run `validate.py`

```bash
$ python validate.py
Usage: validate.py SCHEMA_PATH BLOB_PATH
```

#### Examples:
```bash
$ python validate.py schemas/discovery-response.json blobs/discovery-response.valid.json
Validation succeeded

$ python validate.py schemas/discovery-response.json blobs/discovery-response.invalid.json
Validation failed
Traceback (most recent call last):
  File "validate.py", line 32, in <module>
    validate(blob, schema, resolver=resolver)
  File "/Users/traut/.p/lib/python2.7/site-packages/jsonschema/validators.py", line 428, in validate
    cls(schema, *args, **kwargs).validate(instance)
  File "/Users/traut/.p/lib/python2.7/site-packages/jsonschema/validators.py", line 117, in validate
    raise error
jsonschema.exceptions.ValidationError: {u'a': u'b'} is not of type u'array'

Failed validating u'type' in schema[u'properties'][u'services'][u'items'][u'properties'][u'message_bindings']:
    {u'items': {u'type': u'string'},
     u'minItems': 1,
     u'type': u'array',
     u'uniqueItems': True}

On instance[u'services'][0][u'message_bindings']:
    {u'a': u'b'}
$
```

```bash
$ python validate.py schemas/status-message.json blobs/status-message.valid.json
Validation succeeded


$ python validate.py schemas/status-message.json blobs/status-message.invalid.json
Validation failed
Traceback (most recent call last):
  File "validate.py", line 32, in <module>
    validate(blob, schema, resolver=resolver)
  File "/Users/traut/.p/lib/python2.7/site-packages/jsonschema/validators.py", line 428, in validate
    cls(schema, *args, **kwargs).validate(instance)
  File "/Users/traut/.p/lib/python2.7/site-packages/jsonschema/validators.py", line 117, in validate
    raise error
jsonschema.exceptions.ValidationError: {u'invalid-object-key': u'invalid-object-value'} is not of type u'string'

Failed validating u'type' in schema[u'properties'][u'details'][u'properties'][u'ITEM']:
    {u'type': u'string'}

On instance[u'details'][u'ITEM']:
    {u'invalid-object-key': u'invalid-object-value'}
$
```
