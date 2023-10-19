#!/bin/bash

# Pull the latest MongoDB Docker image
docker pull mongo:latest

# Check if the MongoDB container is running
if [ ! "$(docker ps -a | grep bashaway-2k23-cluttered)" ]; then
    # Run the MongoDB container if it's not already running
    docker run -d --name bashaway-2k23-cluttered -p 27207:27017 mongo
fi

# Wait for MongoDB to start (adjust the sleep duration as needed)
sleep 10

# Connect to the MongoDB container and remove all collections except "settings"
docker exec -i bashaway-2k23-cluttered mongo <<EOF
use bashaway-2k23-cluttered
db.getCollectionNames().forEach(function(collection) {
    if (collection !== 'settings') {
        db[collection].drop();
    }
});
EOF

# Optionally, display a message indicating the cleanup is complete
echo "Cleanup completed. All collections except 'settings' have been removed."
