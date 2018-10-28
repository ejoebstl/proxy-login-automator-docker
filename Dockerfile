FROM node:8-alpine
RUN apk update
RUN apk add bash
RUN rm -rf /var/cache/apk?*
RUN npm install -g proxy-login-automator
COPY launcher.sh ./

EXPOSE 8080-9080

ENV REMOTE_HOST=
ENV REMOTE_USER=
ENV REMOTE_PASSWORD=
ENV REMOTE_HTTPS=true
ENV INGORE_CERT=false

CMD ["bash", "launcher.sh"]
