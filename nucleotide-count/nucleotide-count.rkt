#lang racket

(provide
  (contract-out
    (nucleotide-counts (-> valid-strand list?))))

(define (valid-strand input)
  (regexp-match #rx"^[ACGT]*$" input))

(define (count nucleotide strand)
  (for/sum ((n (in-string strand)) #:when (equal? n nucleotide)) 1))

(define (nucleotide-counts strand)
  (for/list ((val (in-string "ACGT"))) (cons val (count val strand))))
