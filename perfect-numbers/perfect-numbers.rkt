#lang racket

(provide perfect-numbers)

(define (perfect-numbers limit)
  (for/list ([number (range-base1 limit)]
             #:when (perfect? number))
    number))

(define (perfect? number)
  (= number (divisors number)))

(define (divisors number)
  (for/sum ([value (range-base1 (/ (sub1 number) 2))]
            #:when ((divisor? number) value))
    value))

(define (divisor? number)
  (lambda (val) (zero? (modulo number val))))

(define (range-base1 number)
  (in-range 1 (add1 number)))
