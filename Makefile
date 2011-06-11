
IMG1 = 425.gif
IMG2 = doc/425.gif
PKG = $(IMG1) $(IMG2)
SIZE = 768
inkscape = inkscape --export-width=$(SIZE) --export-height=$(SIZE) --export-background=black

all: $(PKG)

$(IMG1): 425 rotate HTML4_Badge.png HTML5_Badge.png Makefile
	./425

$(IMG2): $(IMG1)
	cp -fp $(IMG1) $@

HTML4_Badge.png: HTML4_Badge.svg Makefile
	$(inkscape) --export-png=$@ HTML4_Badge.svg > /dev/null

HTML5_Badge.png: HTML5_Badge.svg Makefile
	$(inkscape) --export-png=$@ HTML5_Badge.svg > /dev/null

clean:
	rm -rf *.png $(PKG)

# vim: tabstop=8 shiftwidth=8 noexpandtab
