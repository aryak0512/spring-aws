# Test project

A brief description of what this project does and who it's for

## Datadog commands for MacOS

Restart the agent (MacOS)

```bash
sudo launchctl kickstart -k system/com.datadoghq.agent
```

Launch the UI (MacOS)

```bash
sudo datadog-agent launch-gui
```

## Enabling process metrics

It is disabled by default. To enable edit config file: datadog.yaml

```bash
process_config:
  process_collection:
    enabled: true
```

### Installing the docker agent for container metrics:

```
docker run -d --name dd-agent \
-e DD_API_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX \
-e DD_SITE="ap1.datadoghq.com" \
-e DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
-v /proc/:/host/proc/:ro \
-v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
-v /var/lib/docker/containers:/var/lib/docker/containers:ro \
registry.datadoghq.com/agent:7
```

### Metrics

6 Submission Metric types are supported by Datadog: count, set, rate, histogram, gauge and distribution

Points to note

- DogstatsD or datadog agent automatically aggregates the metrics before sending to backend
- If custom metrics instrumented from app are being sent directly to backend (e.g. no of products sold in last one 1
  minute) then NO aggregation will occur (performance impact)

### Sending custom metrics to datadog

Can be done in 3 ways

- Datadog agent check (python style checks and scripts)
- DogstatsD (app pushes to port 8125 of agent via UDP )
- Native datadog API


