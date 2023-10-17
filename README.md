# Dev-Optimized Container Images For Keycloak Extension and Theme Development

Like https://github.com/loft-sh/devspace-containers, but for Keycloak.

## Flavor

- `-base`, with only `tar` and `gzip`, nothing more
- `-full`, wiht `jdk`/`maven` and `node/npm`


## Devspace

To use with `devspace`

The `-base` image allows `devspace dev`/`kubectl cp`, and `-full` has all the dev tools you need.
```
version: v2beta1
name: keycloak
deployments:
  keycloak:
    helm:
      chart:
        name: keycloakx
        repo: https://codecentric.github.io/helm-charts
      values:
        image:
          repository: ghcr.io/chenhunghan/keycloak
          tag: 22.0.4-base
dev:
  keycloak:
    devImage: ghcr.io/chenhunghan/keycloak:22.0.4-ful
```
