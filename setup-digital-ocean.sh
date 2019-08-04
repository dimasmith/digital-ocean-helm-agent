#!/bin/bash

./doctl kubernetes cluster kubeconfig save $KUBERNETES_CLUSTER

./helm $@