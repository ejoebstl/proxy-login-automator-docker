# Proxy Login Automator Docker

Proxies your proxy and injects credentials. Useful for bypassing limitations some tools and browsers have with proxy authentication. 

Based on (https://github.com/sjitech/proxy-login-automator)[proxy-login-automator].

## Usage

The container is listening at `0.0.0.0:8080`. Supported configuration variables are:

* `REMOTE_HOST`
* `REMOTE_PORT`
* `REMOTE_USER`
* `REMOTE_PASSWORD`
* `REMOTE_HTTPS`
* `IGNORE_CERT`


