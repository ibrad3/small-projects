from pylgtv import WebOsClient

import sys
import logging

logging.basicConfig(stream=sys.stdout, level=logging.INFO)

try:
    tv = WebOsClient('192.168.0.54')
    tv.volume_up()
    tv.volume_up()
except:
    print("Error connecting to TV")