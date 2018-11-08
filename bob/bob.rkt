#lang racket

(provide response-for)

(define matches '(("^[^a-zA-Z0-9]*$" "Fine. Be that way!")
                  ("^[^a-z]*[A-Z][^a-z]*$" "Whoa, chill out!")
                  ("\\?$" "Sure.")
                  ("" "Whatever.")))

(define (match input)
  (lambda (pair) (and (regexp-match (first pair) input) (last pair))))

(define (response-for input)
  (ormap (match input) matches))
