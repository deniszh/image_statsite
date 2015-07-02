# Statsite Docker image
What is Statsite?

[Statsite](https://github.com/armon/statsite) is a metrics aggregation server. Statsite is based heavily on Etsy's StatsD <https://github.com/etsy/statsd>, and is wire compatible.

## How to use this image

```
docker run -p "8125:8125" -it kpettijohn/statsite
```

Send a key value metric.

```
echo "cpu:13.333|kv\n" | telnet docker-host-ip 8125
```

### Custom sinks

Override the default sink with the SINK environment variable.

```
docker run -p "8125:8125" -it -e SINK="/path/to/sink --flags" kpettijohn/statsite
```
