PICS_DIR := レシート20231209
HEIC_FILES := $(shell find $(PICS_DIR) -name "*.HEIC" -o -name "*.heic")
JPG_FILES := $(patsubst %.heic,%.jpg,$(patsubst %.HEIC,%.jpg,$(HEIC_FILES)))


.PHONY: all
all: $(JPG_FILES)
	@echo $^


%.HEIC: %.heic
	mv $< $@


%.jpg: %.HEIC
	convert $< -resize "1200x1200>" $@


.PHONY: clean
clean:
	rm -f $(JPG_FILES)
