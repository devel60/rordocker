# rordocker
To configure, edit the Dockerfile to your needs. The server config syntax can be found in the [official documentation](https://github.com/RigsOfRods/ror-server?tab=readme-ov-file#config-file-parameters). If you add a new line, make sure to add \n\ to the end of it unless it's the last line in the command. Then to start, use `docker compose up -d`. Make sure that if you change the port in the Dockerfile to change all instances of it, including in docker-compose.yml

If you decide to change things after making the container, make sure to `docker compose down` and `docker rmi rordocker-server` (replace image name if it's different, you can find it with `docker images`), do whatever in the Dockerfile and then `docker compose up -d`  again
