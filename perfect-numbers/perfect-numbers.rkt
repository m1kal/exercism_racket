#lang racket

(provide perfect-numbers)

(define (perfect-numbers limit)
  (filter perfect? (range-base1 limit)))

(define (perfect? number)
  (= number (apply + (divisors number))))

(define (divisors number)
  (filter (divisor? number) (range-base1 (/ (sub1 number) 2))))

(define (divisor? number)
  (lambda (val) (zero? (modulo number val))))

(define (range-base1 number)
  (map add1 (range number)))
