#lang racket

(provide anagrams-for)

(define (string->values input)
  (sort (map char->integer (string->list (string-downcase input))) <))

(define (anagram? word)
  (lambda (candidate)
    (and (not (equal? word candidate))
         (equal? (string->values word) (string->values candidate)))))

(define (anagrams-for word candidates)
  (filter (anagram? word) candidates))
