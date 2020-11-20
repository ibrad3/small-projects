from pylgtv import WebOsClient

import sys
import logging

logging.basicConfig(stream=sys.stdout, level=logging.INFO)

try:
    tv = WebOsClient('192.168.0.54')
    tv.set_input(tv.get_inputs()[int(sys.argv[1])-1]['id'])
except:
    print("Error connecting to TV")