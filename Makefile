PANDOC := pandoc
PANDOC_ARGS := \
  --pdf-engine=xelatex \
  -H head.tex \
  -V subparagraph \
  -V geometry:"top=3cm, bottom=3cm, left=3cm, right=3cm" \
  -V fontfamily:times \
  -V monofont:"Comic Code Ligatures" \
  -V fontsize=11pt

PDF_FILES := $(patsubst %.md,out/%.pdf,$(wildcard *.md))

.PHONY: clean

all: $(PDF_FILES)

out/%.pdf: %.md head.tex out
	$(PANDOC) $(PANDOC_ARGS) $< -o $@

clean:
	rm -rf out

out:
	@mkdir -p out
