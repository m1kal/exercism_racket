#lang racket

(provide perfect-numbers)

(define (perfect-numbers limit)
  (for/list ([number  (in-range 1 (add1 limit))]
             #:when (perfect? number))
    number))

(define (perfect? number)
  (= number
    (for/sum ([value (in-range 1 (add1 (/ (sub1 number) 2)))]
              #:when (zero? (modulo number value)))
      value)))
