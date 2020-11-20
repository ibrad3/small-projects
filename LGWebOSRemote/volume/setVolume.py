from pylgtv import WebOsClient

import sys
import logging

logging.basicConfig(stream=sys.stdout, level=logging.INFO)

try:
    tv = WebOsClient('192.168.0.54')
    tv.set_volume(int(sys.argv[1]))
except:
    print("Error connecting to TV")