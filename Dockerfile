FROM centos:centos7
MAINTAINER Ying Lv (ying.lv2@hp.com) Jun Li (jun.li7@hp.com)

# Upgrade...
RUN yum upgrade -y

#64 bit

RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm

RUN yum -y update
RUN yum install -y expect redis-server ansible java-1.8.0-openjdk wget unzip openssh-clients gcc-c++ make ruby ruby-rdoc ruby-devel jq
#RUN yum install -y expect redis-server ansible  wget unzip openssh-clients gcc-c++ make ruby ruby-rdoc ruby-devel jq

RUN yum install -y gcc-c++ make
#RUN yum install -y java-1.8.0-openjdk-devel
#RUN yum clean all


RUN yum -y install python-pip && \
		pip install --upgrade pip && \
    pip install awscli && \
		#pip install selenium==3.8.1 && \
		pip install selenium==2.45.0 && \
		#pip install selenium==2.53.6 && \
		#pip install selenium && \
    pip install boto && \
		pip install boto3 && \
		pip install botocore==1.10.47 && \
    gem install rspec && \
    gem install selenium-webdriver && \
		pip install pyvirtualdisplay 
		#pip install Xvfb 
RUN yum install -y firefox
#RUN yum install -y gtk3
#RUN yum install -y gtk2
#RUN yum update

RUN yum install -y Xvfb
# sudo docker run -t -i 1247ebb81cfd
RUN yum install -y libXfont

RUN yum install  -y xorg-x11-fonts*
RUN yum install -y xorg-x11-server-Xvfb bzip gtk3
ADD ./geckodriver-v0.16.1-linux64/geckodriver ./geckodriver
RUN chmod 777 ./geckodriver
RUN chmod +x ./geckodriver

ADD ./geckodriver /usr/bin/geckodriver
#RUN yum install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
ADD ./1.py ./1.py
ADD ./2.py ./2.py
#RUN wget http://ftp.mozilla.org/pub/firefox/releases/52.0/linux-x86_64/en-US/firefox-52.0.tar.bz2
RUN wget http://ftp.mozilla.org/pub/firefox/releases/24.0/linux-x86_64/en-US/firefox-24.0.tar.bz2
#display.stop()[root@f0419eeefec9 /]# firefox -v
#Mozilla Firefox 52.8.0

RUN yum install -y bzip2
RUN tar -xjvf ./firefox-24.0.tar.bz2
RUN rm -rf /usr/lib64/firefox
RUN mv firefox /usr/lib64

RUN cd /usr/bin;rm -rf firefox
RUN cd ~
RUN ln -s /usr/lib64/firefox/firefox /usr/bin/firefox
#ADD ./chromedriver ./chromedriver
#RUN chmod 777 ./chromedriver
#RUN chmod +x ./chromedriver
#ADD ./chromedriver /usr/local/bin/chromedriver
#python 2.py