# docker-sftp

Docker images used to create SFTP server. This image uses `alpine` to minimize size of the image.

## Usage

Just run the following command to run the container:

```sh
docker run -d --restart=always --name <CONTAINER_NAME> -p <HOST_PORT>:22 -v <SFTP_DIRECTORY_ROOT>:<SFTP_DIRECTORY_ROOT> <IMAGE_TAG>
```

## Example

```
docker run -d --restart=always --name sftp -p 2222:22 -v /home/sakti/sftp/data:/home/data sftp
```

## License

[MIT](https://github.com/thesuhu/docker-sftp/blob/master/LICENSE)