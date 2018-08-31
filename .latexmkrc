#!/usr/bin/env perl
$latex='platex -synctex=1 -interaction=nonstopmode';
$dvipdf='dvipdfmx %O -o %D %S';
$bibtex='pbibtex -kanji=utf8 %B';
$max_repeat=5;
$pdf_mode=3;
$out_dir='./compiled_tex/'
