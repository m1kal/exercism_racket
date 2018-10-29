#lang racket

(provide square total)

(define (square field)
  (expt 2 (- field 1)))

(define (total)
  (- (square 65) 1))

