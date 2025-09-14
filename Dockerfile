FROM debian

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y zip unzip curl && \
    apt-get clean
RUN curl --output rorserver.zip https://forum.rigsofrods.org/resources/rigs-of-rods-server.208/version/1815/download?file=24726
RUN unzip rorserver.zip
RUN mv ./ror-server-linux/* .
RUN chmod +x ./RunRoR.sh
RUN echo $'slots = 16 \n\
name = My Docker Server \n\
terrain = any \n\
port = 12000 \n\
mode = inet \n\
vehiclelimit = 4 \n\
verbosity = 1 \n\
logverbosity = 1 \n\
resdir = ./resources/ \n\
motdfile = ./server.motd \n\
authfile = ./server.auth \n\
rulesfile = ./server.rules \n\
blacklistfile = ./banned-players.json \n\
logfilename = ./server.log' > server.cfg

RUN echo $'message of the day' > server.motd
RUN echo $'these are rules' > server.rules
RUN echo $'; This files defines who is an admin, moderator etc on your server \n\
; the syntax is as follows: <authorization> <token> <username (optional)> \n\
;  - where authorization is a number between 1 and 13: \n\
;               1: administrator (red name, has access to all admin functions) \n\
;               4: moderator (red name, has access to all admin functions) \n\
;               8: bot, robot (blue name, no special privileges) \n\
; EXAMPLE ADMIN (uncomment and replace these with your username and encoded token) \n\
;1 9b3c463506f128319a0f16ef08d39d876ca25c68 admin_user' > server.auth

EXPOSE 12000

CMD ["sh", "RunRoR.sh"]
