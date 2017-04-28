ID = $(shell git rev-parse --short HEAD)
TARGET = $(shell date +%d.%m.%Y)-$(ID)-cv
SRC = src/cv.md
TARGETDIR = build
PDFOPTIONS = -s \
			--latex-engine=xelatex \
			--template template.tex

all: pdf
	@echo "Done!"

pdf: $(TARGETDIR)
	pandoc $(SRC) -o $(TARGETDIR)/$(TARGET).pdf $(PDFOPTIONS)

.PHONY: clean
clean:
	rm -f $(TARGETDIR)/*.pdf

rebuild: clean all
