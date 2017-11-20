FROM centos:7

# Install EPEL repo
RUN yum install epel-release wget curl -y

# Install Google Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
RUN yum install ./google-chrome-stable_current_*.rpm -y
RUN rm google-chrome-stable_current_*.rpm

# Setup NodeJS repo
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -

# Add yarn Repo
RUN wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo

# Install Node & Yarn!
RUN yum -y install nodejs yarn

WORKDIR /lighthouse-testcase