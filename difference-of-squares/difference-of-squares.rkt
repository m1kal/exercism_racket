#lang racket

(provide sum-of-squares square-of-sum difference)

(define (square number) (* number number))
(define (sum-numbers numbers) (apply + numbers))

(define (sum-of-squares number)
  (sum-numbers (map square (range (+ number 1)))))

(define (square-of-sum number)
  (square (sum-numbers (range (+ number 1)))))

(define (difference number)
  (- (square-of-sum number) (sum-of-squares number)))

