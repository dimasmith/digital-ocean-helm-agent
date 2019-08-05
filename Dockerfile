FROM digitalocean/doctl:1.26.2

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.1/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl

# install helm
RUN curl https://get.helm.sh/helm-v2.14.2-linux-amd64.tar.gz | tar xz && \
    mv linux-amd64/helm ./

RUN mkdir -p ~/.kube && \
    ln -s $(pwd)/doctl /usr/local/bin/ && \
    ln -s $(pwd)/doctl ~/.kube/ && \
    ln -s $(pwd)/kubectl /usr/local/bin/ && \
    ln -s $(pwd)/helm /usr/local/bin/

COPY ./setup-digital-ocean.sh ./

ENV DIGITALOCEAN_ACCESS_TOKEN=
ENV KUBERNETES_CLUSTER=kube-default
VOLUME [ "/charts" ]


ENTRYPOINT [ "./setup-digital-ocean.sh" ]
CMD [ "list" ]
