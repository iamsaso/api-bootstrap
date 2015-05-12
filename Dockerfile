FROM quay.cbhq.net/infra/ruby:2.2.0

USER root
RUN mkdir -p /opt/codeflow
WORKDIR /opt/codeflow

#install docker
RUN apt-get update
RUN apt-get -y install apt-transport-https postgresql-client libpq-dev libsqlite3-dev
RUN echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Install dependencies
RUN apt-get update
RUN apt-get install -y nodejs lxc-docker-1.5.0

# install deps
ADD Gemfile Gemfile.lock /opt/codeflow/
RUN bundle install

# setup placeholders for github pems
RUN mkdir /root/.ssh
RUN echo "Host github.cbhq.net\n  IdentityFile ~/.ssh/id_rsa\n  StrictHostKeyChecking no" > /root/.ssh/config
RUN touch /root/.ssh/known_hosts && \
  chmod 644 /root/.ssh/known_hosts
RUN touch /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa
RUN chown -R root:root /root/.ssh

# add the rest of our app
ADD . /opt/codeflow

# Execute
RUN chown -R root:root /opt/codeflow
CMD bundle exec foreman start

# Runs on port 3000
EXPOSE 3000
