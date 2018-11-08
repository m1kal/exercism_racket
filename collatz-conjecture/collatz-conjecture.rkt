#lang racket

(provide collatz)

(define (collatz number (cnt 0))
  (cond
    ((> 1 number) (raise-argument-error 'collatz "positive?"))
    ((= 1 number) cnt)
    ((zero? (modulo number 2)) (collatz (/ number 2) (add1 cnt)))
    (else (collatz (add1 (* 3 number)) (add1 cnt)))))

