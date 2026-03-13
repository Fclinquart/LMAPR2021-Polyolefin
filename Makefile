# ============================================================
#  Makefile  –  UCLouvain Beamer Presentation
#  François Clinquart  –  Master Thesis 2026
# ============================================================

MAIN        := main
OUTPUT      := Clinquart_2026-03-19_PO
BUILDDIR    := build
LATEXMK     := latexmk
PDFVIEWER   := evince   # change to 'okular', 'zathura', or 'xdg-open' if needed

# ============================================================
.PHONY: all pdf clean purge view help

# ============================================================
##  all     : compile the presentation (default target)
all: pdf

# ============================================================
##  pdf     : compile with latexmk and copy output to PO.pdf
pdf:
	@echo ">>> Compiling $(MAIN).tex ..."
	@mkdir -p $(BUILDDIR)
	$(LATEXMK) $(MAIN).tex
	@if [ -f $(MAIN).pdf ]; then \
		cp $(MAIN).pdf $(OUTPUT).pdf; \
		echo ">>> Done : $(OUTPUT).pdf"; \
	else \
		echo "!!! Compilation failed – check $(BUILDDIR)/$(MAIN).log"; \
		exit 1; \
	fi

# ============================================================
##  view    : open PO.pdf in the default PDF viewer
view: pdf
	@$(PDFVIEWER) $(OUTPUT).pdf &

# ============================================================
##  clean   : remove auxiliary build files (keep PO.pdf)
clean:
	@echo ">>> Cleaning build directory ..."
	@latexmk -c $(MAIN).tex
	@rm -rf $(BUILDDIR)
	@echo ">>> Clean done."

# ============================================================
##  purge   : remove everything including PO.pdf
purge:
	@echo ">>> Purging all generated files ..."
	@latexmk -C $(MAIN).tex
	@rm -rf $(BUILDDIR)
	@rm -f $(OUTPUT).pdf
	@echo ">>> Purge done."

# ============================================================
##  help    : show this help message
help:
	@echo ""
	@echo "  UCLouvain Beamer Presentation – available targets"
	@echo "  =================================================="
	@grep -E '^##' Makefile | sed 's/##/  make/'
	@echo ""
	@echo "  PDF viewer : $(PDFVIEWER)"
	@echo "  Build dir  : $(BUILDDIR)/"
	@echo "  Output PDF : $(OUTPUT).pdf"
	@echo ""
