#!/bin/bash

# Create necessary directory if it doesn't exist
mkdir -p GUILD-BOOST

echo "[+] Starting Guild Boost API (spam.py)..."
cd GUILD-BOOST
python3 spam.py &
API_PID=$!

sleep 2

echo "[+] Starting Web UI (index.php)..."
cd ..
# Use Render's dynamic port
php -S 0.0.0.0:$PORT

# When PHP stops, also stop Python
kill $API_PID 2>/dev/null || true
