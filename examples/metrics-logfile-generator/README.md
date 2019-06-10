# metrics-cannon

## Description
A quick and dirty project to generate JSON logs in order to test filebeat.  It creates JSON object log entries, one per line in the following format:

```
{"time":1560200365638,"hostname":"hopeless","msg":{"hearbeat":"Bump."}}
```

## Run locally
Run on your local workstation:
```
docker run -it --mount source=/persistent,target=/persistent,type=bind applesaucelabs:metrics-cannon
```

## Run on OakOS
Application definition:

```
    {
      "image": "index.docker.io/applesaucelabs/metrics-canon:latest",
    }
```

Add `NODE_ENV=production` to your environment to silence the verbose logging.