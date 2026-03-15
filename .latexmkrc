# ============================================================
#  .latexmkrc  –  UCLouvain Beamer Presentation
#  François Clinquart  –  Master Thesis 2026
# ============================================================



$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape -synctex=1 %O %S';
$bibtex_use = 2;
$out_dir = 'build';
$move_pdf = 1;
$pdf_dest = '.';
$max_repeat = 5;
$clean_ext = 'aux bbl bcf blg fdb_latexmk fls log nav out run.xml snm synctex.gz toc vrb';

# Ne pas traiter les Overfull hbox comme des erreurs fatales
$warnings_as_errors = 0;
