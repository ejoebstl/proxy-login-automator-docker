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

## Example (Standalone)

```
docker run -p 8080:8080 --env REMOTE_HOST=yourproxy.com:10000,premium.yourproxy.com:10001 --env REMOTE_USER=username --env REMOTE_PASSWORD=password --env IGNORE_CERT=true --env REMOTE_HTTPS=false -p 8081:8081 -d ejoebstl/proxy-login-automator
```

## Example (AWS ECS) (Script)

```
[{
  "name": "proxy",
  "image": "ejoebstl/proxy-login-automator",
  "logConfiguration": {
    "logDriver": "awslogs",
    "options": {
      "awslogs-group": "your-log-group",
      "awslogs-region": "us-east-1",
      "awslogs-stream-prefix": "proxy"
    },
  },
  "memoryReservation": 256,
  "environment": [
    {
      "name": "GET_REMOTE_HOST",
      "value": "for i in $(seq 10150 1 10200); do printf \"proxy%i.proxy.com:%i,\" $i; done"
    },
    {
      "name": "REMOTE_USER",
      "value": "username"
    },
    {
      "name": "REMOTE_PASSWORD",
      "value": "password"
    },
    {
      "name": "REMOTE_HTTPS",
      "value": "false"
    },
    {
      "name": "IGNORE_CERT",
      "value": "true"
    }
  ]
}]
```