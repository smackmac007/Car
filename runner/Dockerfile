FROM ubuntu:22.04
ARG RUNNER_VERSION=2.321.0
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
      curl ca-certificates git jq sudo libicu70 \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m runner
USER runner
WORKDIR /home/runner
RUN curl -fsSL -o r.tgz https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf r.tgz && rm r.tgz
COPY --chown=runner start.sh .
RUN chmod +x start.sh
CMD ["./start.sh"]
