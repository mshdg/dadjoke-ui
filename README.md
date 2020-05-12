# Dad Jokes Web UI #

![Build Status](https://github.com/jaysgrant/dadjoke-ui/workflows/dadjoke_ui/badge.svg)
![GitHub release (https://github.com/jaysgrant/dadjoke-ui/releases)](https://img.shields.io/github/v/release/jaysgrant/dadjoke-ui?include_prereleases)
![LGTM Grade](https://img.shields.io/lgtm/grade/python/github/jaysgrant/dadjoke-ui)
![GitHub](https://img.shields.io/github/license/jaysgrant/dadjoke-ui)
![Docker Pulls](https://img.shields.io/docker/pulls/nhjay/dadjoke-ui)

A simple Python 3 Flask based web UI for the [Dad Jokes microservice](https://github.com/yesinteractive/dad-jokes_microservice) project. The project is built around the idea of deployment hosted on Docker, and Kubernetes.

## Getting Started ##

See the deployment examples within the [examples](./examples) folder.

### Kubernetes ###

The Kubernetes example deployes two services, and two deployments.

#### DadJokes Microservice ####

* Creation of a service, and deployment of the DadJokes Microservice to generate the jokes.
* Service creation with a type of NodePort.

#### DadJokes Web UI ####

* Creation of a service, and deployment of the DadJokes UI, providing a web view of the output of the DadJokes Microservice.
* Service creation with a type of NodePort.

#### Installation on Kubernetes ####

Installation can be performed by running the following command.
```bash
kubectl apply -f examples/kubernetes/dadjokes.yaml
```

### Docker ###

* Todo: Docker instructions

### Observability ###

The Kubernetes/loadbalancer example has the UWSGI stats server enabled. The deployment will include a sidecar container for the [UWSGI Exporter](https://github.com/timonwong/uwsgi_exporter) to allow exporting metrics to Prometheus on the performance of UWSGI.

The service created for the load balancer includes exposing the UWSGI stats over port 9117 via http. This configuration can be used to allow Prometheus to scrape metrics. A simple example of a Prometheus scrape job setup would be as follows:
```yaml
  - job_name: 'uwsgi'
    static_configs:
         - targets:
           - '192.168.1.53:9117'
```

This is a very simple configuration, with a static job, that scrapes the metrics from the loadbalancer located at IP 192.168.1.53 via port 9117.
