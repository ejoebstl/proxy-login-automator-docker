# Proxy Login Automator Docker

Proxies your proxy and injects credentials. Useful for bypassing limitations some tools and browsers have with proxy authentication. 

Based on [proxy-login-automator](https://github.com/sjitech/proxy-login-automator).

## Usage

Supported configuration variables are:

* `REMOTE_HOST`, a comma seperated list of hostnames, including the ports, e.g. `proxy1.proxy.com:1234,proxy2.proxy.com:1235`. The proxies are exposed via ports `8080` up to `9080` in the order they were given. 
* `GET_REMOTE_HOST`, alternatively, a script to generate a list of proxies, e.g. `for i in \$(seq 1000 1 1100); do printf \"proxy%i.proxy.com:%i,\" $i $i; done`
* `REMOTE_USER`
* `REMOTE_PASSWORD`
* `REMOTE_HTTPS`
* `IGNORE_CERT`



