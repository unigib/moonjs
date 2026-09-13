#!/bin/bash

# 1. Start the Python web server in the background
# Source - https://stackoverflow.com/a/55053143
# Posted by eddyizm, modified by community. See post 'Timeline' for change history
# Retrieved 2026-09-13, License - CC BY-SA 4.0

python3 -m http.server 8000 --bind 127.0.0.1 &


# 2. Wait 3 seconds for the server to spin up and bind to the port
sleep 3

# 3. Launch Chromium in kiosk mode pointing to localhost
chromium --kiosk --password-store=basic --noerrdialogs --disable-infobars --check-for-update-interval=31536000 http://localhost:8000/kiosk.html

