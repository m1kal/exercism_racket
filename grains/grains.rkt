#lang racket

(provide square total)

(define (square field)
 (if
   (= field 1)
   1
   (* 2 (square (- field 1)))))

(define (total)
  (- (square 65) 1))

