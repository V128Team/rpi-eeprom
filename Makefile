DESTDIR ?=

SCRIPTS := \
	rpi-eeprom-config \
	rpi-eeprom-update

DOCS := \
	README.md \
	LICENSE \
	releases.md

build:

install:
	install -d -m 755 -o root -g root $(DESTDIR)/usr/sbin
	install -m 755 -o root -g root $(SCRIPTS) $(DESTDIR)/usr/sbin
	install -d -m 755 -o root -g root $(DESTDIR)/lib/firmware/raspberrypi/bootloader
	cp -r firmware/ $(DESTDIR)/lib/firmware/raspberrypi/bootloader/
	install -d -m 755 -o root -g root $(DESTDIR)/var/lib/raspberrypi/bootloader/backup
	install -d -m 755 -o root -g root $(DESTDIR)/etc/default
	install -m 755 -o root -g root rpi-eeprom-update-default $(DESTDIR)/etc/default
	install -d -m 755 -o root -g root $(DESTDIR)/usr/share/doc/rpi-eeprom
	install -m 755 -o root -g root $(DOCS) $(DESTDIR)/usr/share/doc/rpi-eeprom
