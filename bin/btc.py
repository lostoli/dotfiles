#!/usr/bin/python

import sys
import json

parsed_json = json.loads(sys.argv[0])
print(parsed_json['id'])
