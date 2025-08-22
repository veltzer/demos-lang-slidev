##############
# parameters #
##############
# do you want to see the commands executed ?
DO_MKDBG:=0
# do you want dependency on the Makefile itself ?
DO_ALLDEP:=1
# do you want to convert marp to PDF?
DO_SLIDEV_PDF:=1

########
# code #
########
ALL:=

# silent stuff
ifeq ($(DO_MKDBG),1)
Q:=
# we are not silent in this branch
else # DO_MKDBG
Q:=@
#.SILENT:
endif # DO_MKDBG

SLIDEV_SRC:=$(shell find slidev -type f -and -name "*.md")
SLIDEV_BAS:=$(basename $(SLIDEV_SRC))
SLIDEV_PDF:=$(addprefix out/,$(addsuffix .pdf,$(SLIDEV_BAS)))

ifeq ($(DO_SLIDEV_PDF),1)
ALL+=$(SLIDEV_PDF)
endif # DO_SLIDEV_PDF

SLIDEV_DEPENDS=
SLIDEV_FLAGS=

#########
# rules #
#########
.PHONY: all
all: $(ALL)
	@true

.PHONY: debug
debug:
	$(info doing [$@])
	$(info SLIDEV_SRC is $(SLIDEV_SRC))
	$(info SLIDEV_BAS is $(SLIDEV_BAS))
	$(info SLIDEV_PDF is $(SLIDEV_PDF))

.PHONY: clean
clean:
	$(info doing [$@])
	$(Q)rm -f $(ALL)

.PHONY: clean_hard
clean_hard:
	$(info doing [$@])
	$(Q)git clean -qffxd

############
# patterns #
############
$(SLIDEV_PDF): out/%.pdf: %.md $(SLIDEV_DEPENDS)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)node_modules/.bin/slidev export $(SLIDEV_FLAGS) $< $@

##########
# alldep #
##########
ifeq ($(DO_ALLDEP),1)
.EXTRA_PREREQS+=$(foreach mk, ${MAKEFILE_LIST},$(abspath ${mk}))
endif # DO_ALLDEP
