Helm image for Digital Ocean
============================

Image contains `helm` executable that can connect to Digital Ocean kubernetes cluster.

## Usage

Installing a release:

```bash
docker run --rm -e "DIGITALOCEAN_ACCESS_TOKEN=<token>" -e "KUBERNETES_CLUSTER=kube-default" -v ./helm/application:/charts dimasmith/digital-ocean-helm-agent install /charts
```

## Configuration

* `DIGITALOCEAN_ACCESS_TOKEN` - access token for a kubernetes cluster
* `KUBERNETES_CLUSTER` - name/id of kubernetes cluster
* Volume `/charts` - volume where you can mount your charts

## Versions

* `doctl` - `1.26.2`
* `kubectl` - `v1.15.1`
* `helm` - `v2.14.2`
