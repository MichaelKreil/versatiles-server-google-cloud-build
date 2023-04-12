FROM versatiles/versatiles:latest-alpine

# fetch frontend
RUN curl -L "https://github.com/versatiles-org/versatiles-frontend/releases/latest/download/frontend.br.tar" > ./frontend.br.tar

# open port
EXPOSE $PORT

# Run the web service on container startup.
CMD versatiles serve -i "0.0.0.0" -p $PORT -s ./frontend.br.tar \
    "[osm]https://storage.googleapis.com/$_VERSATILES_BUCKET_PATH"
