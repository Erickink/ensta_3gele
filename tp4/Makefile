COLOUR_BLACK=\033[0;31m
COLOUR_RED=\033[0;31m
COLOUR_GREEN=\033[0;32m
COLOUR_YELLOW=\033[0;33m
COLOUR_BLUE=\033[0;34m
COLOUR_PURPLE=\033[0;35m
COLOUR_CYAN=\033[0;36m
COLOUR_WHITE=\033[0;37m
COLOUR_END=\033[0m

.PHONY: help

help:
	@echo  ""
	@echo  " $(COLOUR_PURPLE)Makefile Usage:$(COLOUR_END)"
	@echo  "$(COLOUR_GREEN)"
	@echo  "================================================================"
	@echo  "  UTILS:"
	@echo  "================================================================"
	@echo  "$(COLOUR_END)"
	@echo  "$(COLOUR_GREEN)"
	@echo  "================================================================"
	@echo  "  ALL:"
	@echo  "================================================================"
	@echo  "$(COLOUR_END)"
	@echo  "$(COLOUR_GREEN)"
	@echo  "================================================================"
	@echo  "  CLEAN:"
	@echo  "================================================================"
	@echo  "$(COLOUR_END)"
	@echo  "$(COLOUR_GREEN)"
	@echo  "================================================================"
	@echo  "  OPTIONS:"
	@echo  "================================================================"
	@echo  "$(COLOUR_END)"
	@echo  "$(COLOUR_GREEN)"
	@echo  "================================================================"
	@echo  "  INFORMATIONS:"
	@echo  "================================================================"
	@echo  "$(COLOUR_END)"
	@echo  ""

PROJECT_DIR := "$(CURDIR)"
GHDL := $(HOME)/workspace/ghdl-0.37-ubuntu16-mcode/bin/ghdl

# =========================================================
# NAME
# =========================================================

DATE := $(shell date +%Y_%m_%d_%H_%M)

# =========================================================
# DIRECTORY
# =========================================================

RTL_SRC_DIR := $(PROJECT_DIR)/rtl_src

BUILD_DIR := $(PROJECT_DIR)/build

# =========================================================
# FILE
# =========================================================

# =========================================================
# OPTIONS
# =========================================================

# =========================================================
# FLAGS
# =========================================================

# =========================================================
# COMMAND
# =========================================================

half_adder:
	mkdir -p $(BUILD_DIR)/half_adder
	cd $(BUILD_DIR)/half_adder && \
	$(GHDL) -a $(RTL_SRC_DIR)/half_adder/half_adder.vhdl && \
	$(GHDL) -a $(RTL_SRC_DIR)/half_adder/test_bench.vhdl && \
	$(GHDL) -e test_bench && \
	$(GHDL) -r test_bench --wave=waveform.ghw

half_adder_simulation:
	mkdir -p $(BUILD_DIR)/half_adder
	cd $(BUILD_DIR)/half_adder && \
	gtkwave waveform.ghw

full_adder:
	mkdir -p $(BUILD_DIR)/full_adder
	cd $(BUILD_DIR)/full_adder && \
	$(GHDL) -a $(RTL_SRC_DIR)/half_adder/half_adder.vhdl && \
	$(GHDL) -a $(RTL_SRC_DIR)/full_adder/full_adder.vhdl && \
	$(GHDL) -a $(RTL_SRC_DIR)/full_adder/test_bench.vhdl && \
	$(GHDL) -e test_bench && \
	$(GHDL) -r test_bench --wave=waveform.ghw

full_adder_simulation:
	mkdir -p $(BUILD_DIR)/full_adder
	cd $(BUILD_DIR)/full_adder && \
	gtkwave waveform.ghw

adder_8bit:
	mkdir -p $(BUILD_DIR)/adder_8bit
	cd $(BUILD_DIR)/adder_8bit && \
	$(GHDL) -a $(RTL_SRC_DIR)/half_adder/half_adder.vhdl && \
	$(GHDL) -a $(RTL_SRC_DIR)/full_adder/full_adder.vhdl && \
	$(GHDL) -a $(RTL_SRC_DIR)/adder_8bit/adder_8bit.vhdl && \
	$(GHDL) -a $(RTL_SRC_DIR)/adder_8bit/test_bench.vhdl && \
	$(GHDL) -e test_bench && \
	$(GHDL) -r test_bench --wave=waveform.ghw

adder_8bit_simulation:
	mkdir -p $(BUILD_DIR)/adder_8bit
	cd $(BUILD_DIR)/adder_8bit && \
	gtkwave waveform.ghw

adder_4bit:
	mkdir -p $(BUILD_DIR)/adder_4bit
	cd $(BUILD_DIR)/adder_4bit && \
	$(GHDL) -a $(RTL_SRC_DIR)/half_adder/half_adder.vhdl && \
	$(GHDL) -a $(RTL_SRC_DIR)/full_adder/full_adder.vhdl && \
	$(GHDL) -a $(RTL_SRC_DIR)/adder_4bit/adder_4bit.vhdl && \
	$(GHDL) -a $(RTL_SRC_DIR)/adder_4bit/test_bench.vhdl && \
	$(GHDL) -e test_bench && \
	$(GHDL) -r test_bench --wave=waveform.ghw

adder_4bit_simulation:
	mkdir -p $(BUILD_DIR)/adder_4bit
	cd $(BUILD_DIR)/adder_4bit && \
	gtkwave waveform.ghw

clean:
	rm -rf $(BUILD_DIR)
