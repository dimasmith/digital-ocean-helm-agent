echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push dimasmith/digital-ocean-helm-agent

if [ ! -z "$TRAVIS_TAG" ] then
    docker push dimasmith/digital-ocean-helm-agent:$TRAVIS_TAG
fi