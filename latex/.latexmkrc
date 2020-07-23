$recorder = 1;
$pdf_mode = 1;
$pdflatex = 'pdflatex --shell-escape %O %S';
$pdf_previewer = 'zathura %S 2> /dev/null';
$view = 'pdf';
$success_cmd = 'cpdf -squeeze -o %D %D';
