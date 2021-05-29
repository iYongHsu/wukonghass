FROM debian:buster-slim
RUN rm -rf /var/lib/apt/lists/*
RUN set -xe && echo '#!/bin/sh' > /usr/sbin/policy-rc.d && echo 'exit 101' >> /usr/sbin/policy-rc.d && chmod +x /usr/sbin/policy-rc.d && dpkg-divert --local --rename --add /sbin/initctl && cp -a /usr/sbin/policy-rc.d /sbin/initctl && sed -i 's/^exit.*/exit 0/' /sbin/initctl && echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup && echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean && echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean && echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean && echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages && echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes && echo 'Apt::AutoRemove::SuggestsImportant "false";' > /etc/apt/apt.conf.d/docker-autoremove-suggests
RUN mkdir -p /run/systemd && echo 'docker' > /run/systemd/container
CMD ["/bin/bash"]
MAINTAINER wzpan
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget git python-pyaudio python3-pyaudio sox && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install -y build-essential python3-dev procps
WORKDIR /root/
RUN wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
RUN python3 get-pip.py
RUN git clone https://github.com/wzpan/wukong-robot.git
RUN mkdir /root/.wukong
WORKDIR /root/.wukong
RUN git clone https://github.com/wzpan/wukong-contrib.git contrib
RUN wget http://192.168.1.120:8899/share/wukongdata/_snowboydetect.so
RUN apt-get install -y portaudio19-dev pulseaudio libsox-fmt-all ffmpeg emacs libatlas-base-dev
WORKDIR /root/wukong-robot/snowboy/
WORKDIR /root/wukong-robot
RUN pip3 install -r requirements.txt
WORKDIR /root/.wukong/contrib
RUN pip3 install -r requirements.txt
WORKDIR /root/wukong-robot
EXPOSE 5000
RUN mv /root/.wukong/_snowboydetect.so /root/wukong-robot/snowboy/
RUN apt-get install -y alsa-utils
RUN export LANG=C.UTF-8
MAINTAINER wzpan
WORKDIR /root/wukong-robot
RUN git pull -f
RUN pip3 install -r requirements.txt
RUN pip3 install spidev
WORKDIR /root/.wukong/contrib
RUN git pull -f
RUN pip3 install -r requirements.txt
WORKDIR /root/wukong-robot
EXPOSE 5000
MAINTAINER wzpan
WORKDIR /root/wukong-robot
RUN git pull -f
RUN pip3 install -r requirements.txt
WORKDIR /root/.wukong/contrib
RUN git pull -f
RUN pip3 install -r requirements.txt
WORKDIR /root/wukong-robot
EXPOSE 5000

COPY run.sh /
RUN rm -rf /root/wukong-robot/robot/ConfigMonitor.py
COPY ConfigMonitor.py /root/wukong-robot/robot/ConfigMonitor.py

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
