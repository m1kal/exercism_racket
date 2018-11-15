#lang racket

(provide hamming-distance)

(define (hamming-distance s1 s2)
  (when (not (apply = (map string-length (list s1 s2))))
        (raise-argument-error 'hamming-distance "Equal string length"))
  (for/sum [[char1 s1] [char2 s2] #:when (not (char=? char1 char2))] 1))

