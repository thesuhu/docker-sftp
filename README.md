# docker-sftp

Docker images used to create SFTP server. This image uses `alpine` to minimize size of the image.

## Usage

Just run the following command to run the container:

```sh
docker run -d --restart=always --name <CONTAINER_NAME> -p <HOST_PORT>:22 -v <SFTP_DIRECTORY_ROOT>:<SFTP_DIRECTORY_ROOT> thesuhu/docker-sftp
```

Example:

```sh
docker run -d --restart=always --name sftp -p 2222:22 -v /home/sftp/data:/home/data thesuhu/docker-sftp
```

Once the container is running, open a terminal inside the container to change some configuration.

```sh
docker exec -it <CONTAINER_NAME> /bin/sh
```

Example:

```sh
docker exec -it sftp /bin/sh
```

Inside the container, chown directory `data` to `root` and chmod to `755`

```sh
chown root:root /home/data
chmod 755 /home/data
```

Still in the container, add a new user account and password. Remember, pick IDs higher than 2000 to avoid if the IDs is already exist on host system.

```sh
addgroup --gid <GID> <GROUP_NAME>
adduser -h <CHROOT_DIRECTORY> -H -u <UID> -G <GROUP_NAME> <USER_NAME>
```

Example:

```sh
addgroup --gid 2000 sftpusers
adduser -h /home/data -H -u 2001 -G sftpusers test
```

Create directory inside `/home/data` directory in the container. And then chown to new user we just created and chmod to 700.

```sh
mkdir /home/data/uploads
chown test:sftpusers /home/data/uploads
chmod 700 /home/data/uploads
```

Once everything is done, exit the container and try to connect using the sftp client.

## License

[MIT](https://github.com/thesuhu/docker-sftp/blob/master/LICENSE)