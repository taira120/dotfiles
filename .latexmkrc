#!/usr/bin/env perl
$latex='platex -kanji=utf8 -guess-input-enc -synctex=1 -interaction=nonstopmode %S';
$dvipdf='dvipdfmx %O -o %D %S';
$bibtex='pbibtex -kanji=utf8 %B';
$max_repeat       = 5;
$pdf_mode         = 3;
