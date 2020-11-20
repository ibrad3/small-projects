from pylgtv import WebOsClient

import sys
import logging

logging.basicConfig(stream=sys.stdout, level=logging.INFO)

try:
    tv = WebOsClient('192.168.0.54')
    for x in tv.get_apps():
        if x['title'] == 'Disney+':
            tv.launch_app(x['id'])

except:
    print("Error connecting to TV")