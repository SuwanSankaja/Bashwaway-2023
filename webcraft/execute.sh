# Define the port you want to use
port=8085

# Navigate to the directory containing your HTML file (src folder)
cd src

# Start a Python HTTP server on the specified port and serve the page.html file
python3 -m http.server $port --bind localhost --directory . &
xdg-open "http://localhost:$port/page.html"