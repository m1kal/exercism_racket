#lang racket

(provide leap-year? )

(define (multiple? n m) (zero? (modulo n m)))

(define (leap-year? year)
  (let ([year-multiple-of? (lambda (n) (multiple? year n))])
    (or
      (and (year-multiple-of? 4) (not (year-multiple-of? 100)))
      (year-multiple-of? 400))))
