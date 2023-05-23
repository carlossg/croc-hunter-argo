# Croc Hunter - The game!

For those that have dreamt to hunt crocs

# Usage

Basic [Quarkus](https://quarkus.io/) app to demonstrate example Canary rollout using Kubernetes

# Local Development

Quarkus comes with a [built-in development mode](https://quarkus.io/guides/maven-tooling). Run your application with:

```bash
mvn compile quarkus:dev
```

`mvn package` will do the build.

`docker build .` will create a docker image.

# Deploy using Helm

```bash
helm upgrade -i croc-hunter ./charts/croc-hunter-argo
```

Watch the rollout

```bash
kubectl argo rollouts get rollout croc-hunter --watch
```

Upgrade the image

```bash
kubectl argo rollouts set image \
    croc-hunter \
    croc-hunter-argo=gcr.io/api-project-642841493686/croc-hunter-argo:v2
```

Manually promote the canary

```bash
kubectl argo rollouts promote croc-hunter
```


# Acknowledgements

Original work by [Lachlan Evenson](https://github.com/lachie83/croc-hunter)
Continuation of the awesome work by everett-toews.
* https://gist.github.com/everett-toews/ed56adcfd525ce65b178d2e5a5eb06aa
