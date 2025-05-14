FROM ruby:3.4.3-slim AS base

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    libpq-dev \
    git \
    cmake \
    libgit2-dev \
    cmake \
    pkg-config \
    curl \
    wget \
    nano \
    vim \
    shared-mime-info \
    libmagic-dev \
    zlib1g-dev \
    libssl-dev \
    libreadline-dev \
    ca-certificates \
    libz-dev \
    libffi-dev \
    libyaml-dev \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y postgresql-client

RUN echo 'IRB.conf[:USE_AUTOCOMPLETE] = false' >> ~/.irbrc
RUN echo 'IRB.conf[:SAVE_HISTORY] = 10000' >> ~/.irbrc
RUN echo 'IRB.conf[:HISTORY_FILE] = "/usr/src/app/log/.irb_history"' >> ~/.irbrc

ENV LANG=C.UTF-8 \
  BUNDLE_RETRY=3

RUN gem update --system && gem install --no-user-install bundler

FROM base AS mono
ARG WORKDIR
WORKDIR ${WORKDIR}

FROM base AS core
ARG WORKDIR
WORKDIR ${WORKDIR}
