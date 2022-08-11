# Check Whether Port is Open

Suppose that the name of a service is `rabbit` and there is a need to test port `5672`.

``` bash
telnet rabbit 5672
```

Output

```
Trying 172.24.0.3...
Connected to rabbit.
Escape character is '^]'.
```

The "Connected to" message indicates that the server is listening on the port.


See https://linuxtect.com/linux-telnet-command-tutorial/.


# Check RabbitMQ with curl

See https://www.dba-ninja.com/2019/09/how-to-use-curl-for-a-rabbitmq-connection.html 

``` bash
curl -u guest:guest -i -H "content-type:application/json" -X POST http://127.0.0.1:15672/api/queues/%2F/foo/get -d'{"count":5,"requeue":true,"encoding":"auto","truncate":50000}'
```

In Docker, instead of an IP address, it should be possible to specify a host such as `rabbit`.

