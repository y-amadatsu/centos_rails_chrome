FROM centos:7.7.1908
COPY ./google-chrome.repo /etc/yum.repos.d/google-chrome.repo

RUN yum -y update && yum -y install \
  git \
  bzip2 \
  gcc \
  openssl-devel \
  readline-devel \
  zlib-devel \
  gcc-c++ \
  libcurl-devel \
  apr-devel \
  apr-util-devel \
  ipa-gothic-fonts \
  vim \
  make \
  mariadb-devel \
  mariadb-server \
  google-chrome-stable

RUN curl -sL https://rpm.nodesource.com/setup_10.x | sh - \
  && yum -y install nodejs \
  && curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo \
  && yum -y install yarn

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

RUN echo 'eval "$(rbenv init -)"' >> /root/.bash_profile
ENV PATH /root/.rbenv/bin:$PATH
ENV PATH /root/.rbenv/shims:$PATH

RUN rbenv install 2.6.3
RUN rbenv global 2.6.3
