FROM debian:latest
ENV CF_CLI_VERSION="6.47.1"
ENV PACKAGES "musl awscli unzip curl openssl ca-certificates git jq util-linux gzip bash uuid-runtime coreutils vim tzdata openssh-client gnupg rsync make zip"
RUN apt-get update && apt-get install -y --no-install-recommends ${PACKAGES} && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    curl -L "https://s3-us-west-1.amazonaws.com/cf-cli-releases/releases/v${CF_CLI_VERSION}/cf-cli_${CF_CLI_VERSION}_linux_x86-64.tgz" | tar -zx -C /usr/local/bin