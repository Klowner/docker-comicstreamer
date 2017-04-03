[![Docker Repository on Quay](https://quay.io/repository/klowner/comicstreamer/status "Docker Repository on Quay")](https://quay.io/repository/klowner/comicstreamer)

```
docker run \
  -v /your/comics:/comics:ro \
  -v /var/comicstreamer/config:/app/config \
  -p 32500:32500 \
  quay.io/klowner/comicstreamer:latest
  ```
