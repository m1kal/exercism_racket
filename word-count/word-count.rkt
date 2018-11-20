#lang racket

(provide word-count)

(define (word-count str)
  (foldl (lambda (x acc) (hash-update acc x add1 0)) (hash) (string-split str)))
