FROM centos:centos6
RUN yum -y update && yum clean all && yum -y install epel-release && yum -y update && \
        yum -y install perl-Net-DBus dbus; yum clean all;
WORKDIR /usr/local/src
