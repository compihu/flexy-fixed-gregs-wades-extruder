TARGETS= \
  flexy-fixed-gregs-wades-complete-1.75.stl \
	flexy-fixed-gregs-wades-guidler-1.75.stl \
	flexy-fixed-gregs-wades-extruder-1.75.stl \
	flexy-fixed-gregs-wades-complete-3.00.stl \
	flexy-fixed-gregs-wades-guidler-3.00.stl \
	flexy-fixed-gregs-wades-extruder-3.00.stl

all: $(TARGETS)

%.stl: %.scad
	openscad $(EX_FLAGS) -m make -o $@ -d $@.deps $<

default: flexy-fixed-gregs-wades-3mm.stl flexy-fixed-gregs-wades-1.75mm.stl

flexy-fixed-gregs-wades-%-3.00.stl: EX_FLAGS += -D filament_diameter=3.00
flexy-fixed-gregs-wades-%-1.75.stl: EX_FLAGS += -D filament_diameter=1.85
flexy-fixed-gregs-wades-extruder-%.stl: EX_FLAGS += -D make_parts=1
flexy-fixed-gregs-wades-guidler-%.stl: EX_FLAGS += -D make_parts=2
flexy-fixed-gregs-wades-complete-%.stl: EX_FLAGS += -D make_parts=7

$(TARGETS): flexy-fixed-gregs-wades.scad Makefile
	openscad $(EX_FLAGS) -m make -o $@ -d $@.deps $<

-include $(wildcard *.deps)
