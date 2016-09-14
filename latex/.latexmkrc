$recorder = 1;
$pdf_mode = 1;
$pdflatex = "pdflatex --shell-escape %O %S";
$pdf_previewer = "zathura %S 2> /dev/null";
$view = "pdf";
$clean_ext = "%R-blx.bib bbl nav run.xml snm";
$success_cmd = "smpdf %D -o %D";
