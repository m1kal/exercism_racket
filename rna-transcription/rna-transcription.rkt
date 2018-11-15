#lang racket

(provide to-rna)

(define rna-dna (hash #\T "A" #\G "C" #\A "U" #\C "G"))

(define (to-rna dna)
  (for/fold ((rna "")) ((element (in-string dna)))
    (string-append rna (hash-ref rna-dna element))))
