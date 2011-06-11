
IMG = 425.gif
IMG16 = 425-16x16.gif
IMG32 = 425-32x32.gif
IMG64 = 425-64x64.gif
DOC_DIR = doc
DOC_IMG = $(DOC_DIR)/$(IMG)
DOC_IMG16 = $(DOC_DIR)/$(IMG16)
DOC_IMG32 = $(DOC_DIR)/$(IMG32)
DOC_IMG64 = $(DOC_DIR)/$(IMG64)
PKG = $(IMG) $(IMG16) $(IMG32) $(IMG64) $(DOC_IMG) $(DOC_IMG16) $(DOC_IMG32) \
      $(DOC_IMG64)
SIZE = 768
inkscape = inkscape --export-width=$(SIZE) --export-height=$(SIZE) \
	   --export-background=black
cp = cp -fp

all: $(PKG)

$(IMG): 425 rotate HTML4_Badge.png HTML5_Badge.png Makefile
	./425

$(IMG16): $(IMG)
	convert -resize 16x16 $(IMG) $@

$(IMG32): $(IMG)
	convert -resize 32x32 $(IMG) $@

$(IMG64): $(IMG)
	convert -resize 64x64 $(IMG) $@

$(DOC_IMG): $(IMG)
	$(cp) $(IMG) $@

$(DOC_IMG16): $(IMG16)
	$(cp) $(IMG16) $@

$(DOC_IMG32): $(IMG32)
	$(cp) $(IMG32) $@

$(DOC_IMG64): $(IMG64)
	$(cp) $(IMG64) $@

HTML4_Badge.png: HTML4_Badge.svg Makefile
	$(inkscape) --export-png=$@ HTML4_Badge.svg > /dev/null

HTML5_Badge.png: HTML5_Badge.svg Makefile
	$(inkscape) --export-png=$@ HTML5_Badge.svg > /dev/null

clean:
	rm -rf *.png $(PKG)

# vim: tabstop=8 shiftwidth=8 noexpandtab
