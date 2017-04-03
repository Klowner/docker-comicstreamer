FROM greyltc/archlinux-aur
MAINTAINER Mark Riedesel <mark@klowner.com>

RUN pacman -Sy && su docker -c 'pacaur -S --noprogressbar --noedit --noconfirm \
	libunrar \
	python2 \
	python2-dateutil \
	python2-pillow \
	python2-pip \
	python2-pybonjour \
	python2-sqlalchemy \
	python2-tornado'


RUN git clone --depth 1 https://github.com/Tristan79/ComicStreamer.git /app \
	&& rm -rf /app/.git \
	&& cd /app \
	&& pip2 install -r requirements.txt \
	&& rm -f /app/libunrar/libunrar.so \
	&& ln -s /usr/lib/libunrar.so /app/libunrar/libunrar.so

# sqlite3 database and config goes here
RUN mkdir -p /app/config

WORKDIR /app
VOLUME /comics
EXPOSE 32500

CMD ["/usr/bin/python2", "/app/comicstreamer", "--user-dir /app/config"]


