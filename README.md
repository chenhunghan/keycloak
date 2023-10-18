# Dev-Optimized Container Images For Keycloak Extension and Theme Development
The image is built with `tar` and `gzip`, thus allows `devspace dev`/`kubectl cp` 

Like https://github.com/loft-sh/devspace-containers, but for Keycloak.


## Devspace

To use with `devspace`

```yaml
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
          tag: 22.0.4
# with tar and gzip, `devspace dev` works without issues
dev:
  keycloak:
```
