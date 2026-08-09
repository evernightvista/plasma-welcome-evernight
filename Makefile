# Makefile for processing QML pages (translations only)

# Configuration used in translation files
DOMAIN = plasma-welcome-evernight
MSGID_BUGS_ADDRESS = https://github.com/evernightvista/plasma-welcome-evernight/issue

# Source file
QML_FILE = 01-evernight.qml

# Installation paths (overridable)
DESTDIR =
PREFIX  = $(DESTDIR)/usr
DATADIR = $(PREFIX)/share

# Files generated/updated
POT_FILE  = po/${DOMAIN}.pot
LANGUAGES = $(shell cat po/LINGUAS | sed '/^#/d')
PO_FILES  = $(foreach lang, $(LANGUAGES), po/$(lang).po)
MO_FILES  = $(subst .po,.mo,$(PO_FILES))

INSTALL = $(shell which install)

# Default target: clean, regenerate pot, update po, compile
build_all: clean pot update_po compile

# Extract strings from QML only
pot:
	xgettext \
	    --keyword=xi18nc:1c,2 \
	    --keyword=i18nc:1c,2 \
	    --keyword=xi18ndc:2c,3 \
	    --keyword=i18ndc:2c,3 \
	    --keyword=i18n:1 \
	    --keyword=i18nd:2 \
	    --language=JavaScript \
	    --from-code=UTF-8 \
	    --msgid-bugs-address=$(MSGID_BUGS_ADDRESS) \
	    $(QML_FILE) \
	    --output=$(POT_FILE)
	sed -i $(POT_FILE) \
	    -e "/# Copyright/s/PACKAGE/$(DOMAIN)/" \
            -e "/# This file/s/PACKAGE/$(DOMAIN)/" \
            -e "/\"Project-Id-Version:/s/PACKAGE VERSION/$(DOMAIN)/" \
            -e "/\"Content-Type:/s/CHARSET/UTF-8/"
	echo "Generated $(POT_FILE)"

# Update PO files from POT
update_po:
	for po in $(PO_FILES); do \
	    echo -n "$$po "; \
	    msgmerge --update --previous $$po $(POT_FILE); \
	done

# Compile MO files
compile: $(MO_FILES)

%.mo: %.po
	msgfmt -c $< -o $@

# Install translations, QML page, and desktop entry
install: $(DOMAIN).mo install-qml install-desktop

# Install MO files
$(DOMAIN).mo: $(MO_FILES)
	for mo in $?; do \
		lang=`echo $$mo | sed 's|po/||;s|\.mo||'`; \
		$(INSTALL) -D -m644 $$mo $(DATADIR)/locale/$$lang/LC_MESSAGES/$@; \
	done

# Install QML page
install-qml: $(QML_FILE)
	$(INSTALL) -D -m644 $< $(DATADIR)/plasma/plasma-welcome/extra-pages/$(<F)

# Install desktop entry
install-desktop: data/intro-customization.desktop
	$(INSTALL) -D -m644 $< $(DATADIR)/plasma/plasma-welcome/$(<F)

# Clean temporary files
clean:
	rm -f po/*.po~
	rm -f po/*.mo
