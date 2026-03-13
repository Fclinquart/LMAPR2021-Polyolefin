# ============================================================
#  .latexmkrc  –  UCLouvain Beamer Presentation
#  François Clinquart  –  Master Thesis 2026
# ============================================================

# --- Engine : pdflatex (change to 'xelatex' or 'lualatex' if needed) ---
$pdf_mode        = 1;        # 1 = pdflatex, 4 = lualatex, 5 = xelatex
$pdflatex        = 'pdflatex -interaction=nonstopmode -shell-escape -synctex=1 %O %S';

# --- Bibliography : Biber (matches packages.sty biblatex setup) ---
$biber           = 'biber %O --input-directory=%R.bcf-blx %B';
$bibtex_use      = 2;        # 2 = use biber

# --- Output directory : all auxiliary files go to build/ ---
$out_dir         = 'build';

# --- Keep the final PDF next to main.tex for easy access ---
# (Makefile will then copy it to PO.pdf)
$move_pdf        = 1;
$pdf_dest        = '.';      # move compiled PDF back to root

# --- Number of compilation passes latexmk is allowed to run ---
$max_repeat      = 5;

# --- Extra extensions to clean with latexmk -c / -C ---
$clean_ext  = 'aux bbl bcf blg fdb_latexmk fls log nav out run.xml snm synctex.gz toc vrb idx ilg ind';
$clean_full_ext = 'pdf';

# --- SyncTeX : keep .synctex.gz locally for VSCode navigation ---
# (already included in pdflatex flags above via -synctex=1)

# --- Silence most of latexmk's own output (set to 0 for verbose) ---
$silent          = 0;
