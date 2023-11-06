# syntax=docker/dockerfile:1

# Keyclaok base image version, override with --build-arg="KEYCLOAK_VERSION=..."
ARG KEYCLOAK_VERSION=22.0.4

# See "Installing additional RPM packages" https://www.keycloak.org/server/containers
FROM registry.access.redhat.com/ubi9 AS ubi-micro-build
ARG DEV_DEPENDECIES="tar gzip"
RUN mkdir -p /mnt/rootfs
RUN dnf -y update
RUN dnf install --installroot /mnt/rootfs ${DEV_DEPENDECIES} --releasever 9 --setopt install_weak_deps=false --nodocs -y && \
    dnf --installroot /mnt/rootfs clean all && \
    rpm --root /mnt/rootfs -e --nodeps setup

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION}
COPY --from=ubi-micro-build /mnt/rootfs /

# use root user https://github.com/keycloak/keycloak/blob/main/quarkus/container/Dockerfile#L28
USER 0

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
