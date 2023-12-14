PICS_DIR := レシート20231209
HEIC_FILES := $(shell find $(PICS_DIR) -name "*.HEIC")
JPG_FILES := $(patsubst %.HEIC,%.jpg,$(HEIC_FILES))


.PHONY: all
all: $(JPG_FILES)
	@echo $^


%.jpg: %.HEIC
	convert $< $@
