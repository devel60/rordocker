# rordocker
rigs of rods server in docker

to configure, edit the Dockerfile to your needs. the syntax can be found in the official documentation. if you. add a new line, make sure to add \n\ to the end of it unless it's the last line in the command

if you change the ports in the dockerfile, you also need to change the ports in the compose file

also if you decide to change things after making the container, make sure to `docker compose down` and `docker rmi rordocker-server-1` (replace image name if it's different), do whatever in the Dockerfile and then `docker compose up -d` 
