# Create a persistent volume
$ docker volume create wakapi-data

$ SALT="$(cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1)"

# Run the container
$ docker run -d \
  --init \
  -p 3000:3000 \
  -e "WAKAPI_PASSWORD_SALT=$SALT" \
  -v wakapi-data:/data \
  --name wakapi \
  ghcr.io/muety/wakapi:latest
