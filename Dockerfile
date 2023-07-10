# Build with
#
#      --build-arg GIT_COMMIT=$(git rev-parse -q --verify HEAD)
#      --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

FROM cgr.dev/chainguard/wolfi-base

LABEL maintainer="Bob Van Zant <bob@veznat.com>" \
      org.opencontainers.image.authors="Bob Van Zant <bob@veznat.com>" \
      org.opencontainers.image.url="https://github.com/cloudtools/ssh-cert-authority.git" \
      org.opencontainers.image.vendor="Cloudtools" \
      org.opencontainers.image.licenses="BSD-2-Clause license" \
      org.opencontainers.image.title="SSH Certificate Authority"

ARG GIT_COMMIT
LABEL org.opencontainers.image.revision "${GIT_COMMIT}"

ARG BUILD_DATE
LABEL org.opencontainers.image.created "${BUILD_DATE}"

RUN adduser -D nonroot
RUN apk add openssh-client

COPY ssh-cert-authority-linux-amd64 /usr/local/bin/ssh-cert-authority

USER nonroot
ENTRYPOINT ["ssh-agent", "/usr/local/bin/ssh-cert-authority", "runserver"]