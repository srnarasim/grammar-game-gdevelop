#!/bin/bash

echo "Starting King's quest to save the princess with sentences"
echo "Opening preview in your browser..."
echo "Note: To play the full game, you need to open the game.json file with GDevelop."
echo ""

# Start a simple HTTP server
python -m http.server 54253 --bind 0.0.0.0 &
SERVER_PID=$!

# Wait for server to start
sleep 2

# Open the preview in the default browser
if command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:54253/preview.html
elif command -v open &> /dev/null; then
    open http://localhost:54253/preview.html
elif command -v start &> /dev/null; then
    start http://localhost:54253/preview.html
else
    echo "Please open http://localhost:54253/preview.html in your browser"
fi

echo "Press Ctrl+C to stop the server when you're done"

# Wait for user to press Ctrl+C
trap "kill $SERVER_PID; echo 'Server stopped'; exit 0" INT
wait $SERVER_PID