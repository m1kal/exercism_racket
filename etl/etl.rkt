#lang racket

(provide etl)

(define (reverse-pairs h)
  (lambda (k)
    (when (< k 0) (raise-argument-error 'etl "positive?"))
    (map (lambda (v) (cons (string-downcase v) k)) (hash-ref h k))))

(define (etl input)
  (if
    (hash-empty? input)
    input
    (apply hash (flatten (map (reverse-pairs input) (hash-keys input))))))
