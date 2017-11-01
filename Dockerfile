FROM evarga/jenkins-slave

# install docker and chefdk
ARG CHANNEL=stable
ARG VERSION=2.3.3
ARG USER=jenkins
ARG USER_ID=1000
ARG GROUP_ID=1000
ENV DEBIAN_FRONTEND=noninteractive \
    PATH=PATH=/opt/chefdk/bin:/opt/chefdk/embedded/bin:/root/.chefdk/gem/ruby/2.4.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get update && \
    apt-get install -y wget ssh docker && \
    wget --content-disposition "http://packages.chef.io/files/${CHANNEL}/chefdk/${VERSION}/ubuntu/16.04/chefdk_${VERSION}-1_amd64.deb" -O /tmp/chefdk.deb && \
    dpkg -i /tmp/chefdk.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    groupmod -g ${GROUP_ID} jenkins && \
    usermod -u ${USER_ID} -g ${GROUP_ID} ${USER} && \
    groupadd docker && \
    adduser ${USER} docker

USER jenkins
VOLUME /var/run/docker.sock