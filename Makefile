
PKG = 425.gif
inkscape = inkscape --export-width=512 --export-height=512 --export-background=black

all: $(PKG)

$(PKG): 425 HTML4_Badge.png HTML5_Badge.png
	./425

HTML4_Badge.png: HTML4_Badge.svg Makefile
	$(inkscape) --export-png=$@ HTML4_Badge.svg > /dev/null

HTML5_Badge.png: HTML5_Badge.svg Makefile
	$(inkscape) --export-png=$@ HTML5_Badge.svg > /dev/null

clean:
	rm -rf *.png $(PKG)

# vim: tabstop=8 shiftwidth=8 noexpandtab
