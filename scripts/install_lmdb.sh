#! /bin/bash

if [[ ! -e  openldap ]]; then
	curl ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-2.4.39.tgz -o /tmp/openldap.tgz
	mkdir -p openldap
	tar -C openldap -xzvf /tmp/openldap.tgz
	cd openldap/openldap*/libraries/liblmdb/
	make
	sudo make install
	rm -f /tmp/openldap.tgz
else
	cd openldap/openldap*/libraries/liblmdb/
	sudo make install
fi

if [[ ! -L /usr/lib/liblmdb.so ]]; then
	sudo ln -s /usr/local/lib/liblmdb.so /usr/lib
fi

