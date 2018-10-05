#lang racket

(provide leap-year? )

(define (multiple? n m) (zero? (modulo n m)))

(define (comb r1 r2 r3) (and r3 (not (xor r1 r2))))

(define (leap-year? year)
  (let ([year-multiple-of? (lambda (n) (multiple? year n))])
    (apply comb (map year-multiple-of? '(400 100 4)))))
