# Dev-Optimized container images For Keycloak SPI and theme development
The image is built with `tar`/`gzip`/`util-linux`, thus allows `devspace dev`/`kubectl cp` and allow devspace restart helper scripts work.

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
          tag: 22.0.5
# with tar and gzip, `devspace dev` works without issues
dev:
  keycloak:
    sync:
      - path: ./:/
        # with `util-linux` allow reject restart helper scripts
        onUpload:
          restartContainer: true
```
