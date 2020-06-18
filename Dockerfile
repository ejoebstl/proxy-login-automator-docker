FROM node:10-buster-slim
RUN apt-get update
RUN apt-get install bash
RUN apt-get clean
RUN npm install -g proxy-login-automator
COPY launcher.sh ./

EXPOSE 8080-9080

ENV REMOTE_HOST=
ENV REMOTE_USER=
ENV REMOTE_PASSWORD=
ENV REMOTE_HTTPS=true
ENV INGORE_CERT=false
ENV GET_REMOTE_HOST=

CMD ["bash", "launcher.sh"]
