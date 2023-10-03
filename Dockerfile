FROM openjdk:8-jre

LABEL maintainer="barthex@cocoa.email" \
	  version.ubuntu="20.04"

ENV DEBIAN_FRONTEND noninteractive

ENV TIMEZONE="Europe/Warsaw"

RUN apt-get update && \
        echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true |debconf-set-selections && \
	apt-get -y -q install \
		libreoffice \
		libreoffice-writer \
		ure \
		libreoffice-java-common \
		libreoffice-core \
		libreoffice-common \
		fonts-opensymbol \
		hyphen-fr \
		hyphen-de \
		hyphen-en-us \
		hyphen-it \
		hyphen-ru \
		fonts-dejavu \
		fonts-dejavu-core \
		fonts-dejavu-extra \
		fonts-droid-fallback \
		fonts-dustin \
		fonts-f500 \
		fonts-fanwood \
		fonts-freefont-ttf \
		fonts-liberation \
		fonts-lmodern \
		fonts-lyx \
		fonts-sil-gentium \
		fonts-texgyre \
		fonts-tlwg-purisa && \
	apt-get -y -q remove libreoffice-gnome && \
	apt -y autoremove && \
        cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo "${TIMEZONE}" > /etc/timezone && \
	echo "${TIMEZONE}" > /etc/timezone && \
	rm -rf /var/lib/apt/lists/*

RUN adduser --home=/opt/libreoffice --disabled-password --gecos "" --shell=/bin/bash libreoffice

ADD entrypoint.sh /opt/libreoffice/entrypoint.sh
RUN chmod +x /opt/libreoffice/entrypoint.sh

VOLUME ["/tmp"]
WORKDIR "/tmp"

RUN chmod ugo+rxw /tmp/


ENTRYPOINT ["/opt/libreoffice/entrypoint.sh"]
