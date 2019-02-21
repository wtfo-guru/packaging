# vim:ft=make:noet:ai:sw=4:ts=4

CODENAME =? generic

fail2ban:
	rm -fr /etc/apt/sources.list.d/*
	cp sources-list/deb-buster-src.list /etc/apt/sources.list.d
	apt update
	rm -fr $(CODENAME)
	mkdir $(CODENAME)
	cd $(CODENAME) ; apt-get source fail2ban
#	cd $(CODENAME)/fail2ban-0.10.2 ; apt-get build-dep fail2ban
#	cd $(CODENAME)/fail2ban-0.10.2 ; export DEB_BUILD_OPTIONS=nocheck ; debuild -b -uc -us


reprepo:
	rm -fr /etc/apt/sources.list.d/*
	cp sources-list/deb-buster-src.list /etc/apt/sources.list.d
	apt update
	rm -fr $(CODENAME)
	mkdir $(CODENAME)
	cd $(CODENAME) ; apt-get source reprepo

