# vim:ft=make:noet:ai:sw=4:ts=4

fail2ban:
	rm -fr /etc/apt/sources.list.d/*
	cp sources-list/deb-buster-src.list /etc/apt/sources.list.d
	apt update
	rm -fr work
	mkdir work
	cd work ; apt-get source fail2ban
	cd work/fail2ban-0.10.2 ; apt-get build-dep fail2ban
	cd work/fail2ban-0.10.2 ; export DEB_BUILD_OPTIONS=nocheck ; debuild -b -uc -us

