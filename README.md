# component-filebeat

## Description
This is an example of how you can use [Filebeat](https://www.elastic.co/guide/en/beats/filebeat/current/index.html) to ship OakOS application metrics to Elastic Stack.  We start by writing JSON formatted log entries to a file from the application.  Filebeat is run in a container and is configured to watch this file and ship the metrics to Elasticsearch hosted on [logz.io](https://logz.io/) where we can make sense of the data using Kibana.

## Installation and setup

### Log to a file on the persistent volume
Begin by logging JSON structured data to `/persistent/app-metrics.log`.  You can look at the 'metrics-logfile-generator' project in the examples folder to get an idea of how to do this.  On OakOS we want this file to be persistent and more importantly shared between multiple containers.  So we place it on the `/persistent/` volume.  In your dev environment you'll want to duplicate this by creating a directory somewhere and creating a bind mount (`--mount source=YOURDIR,target=/persistent,type=bind`) to any containers that need to access it. 

### Run the filebeats container on your local workstation
The logz.io token is passed to the container with the `FILEBEATTOKEN` environment variable like so:

```
docker run -it --mount source=/persistent,target=/persistent,type=bind -e FILEBEATTOKEN='YOURTOKENHERE'  applesaucelabs:component-filebeat
```

In this example I've created a 'persistent' folder in the root of my workstation. `-it` can provide some diagnostic output.

### Run the container on OakOS
Application definition:

```
{
  "services": [
    {
      "image": "index.docker.io/applesaucelabs/component-filebeat:latest",
      "environment": {
        "NODE_ENV": "production",
        "FILEBEATTOKEN": "YOURTOKENHERE"
      }
    }
  ]
}
```
