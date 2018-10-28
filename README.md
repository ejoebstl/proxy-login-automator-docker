# Proxy Login Automator Docker

Proxies your proxy and injects credentials. Useful for bypassing limitations some tools and browsers have with proxy authentication. 

Based on [https://github.com/sjitech/proxy-login-automator](proxy-login-automator).

## Usage

The container is listening at `0.0.0.0:8080` and following ports up to `9080`. Supported configuration variables are:

* `REMOTE_HOST`, a comma seperated list of hostnames, including the ports, e.g. `proxy1.proxy.com:1234,proxy2.proxy.com:1235`. The proxies are exposed via ports `8080` up to `9080` in the order they were given. 
* `REMOTE_USER`
* `REMOTE_PASSWORD`
* `REMOTE_HTTPS`
* `IGNORE_CERT`



