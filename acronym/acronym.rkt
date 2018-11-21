#lang racket

(provide acronym)

(define (acronym input)
  (let ((matches
           (regexp-match*
              #rx"([a-z][A-Z])|([^a-zA-Z][a-zA-Z])|(^[a-zA-Z])"
              input)))
    (string-upcase
      (list->string (map (lambda (str) (last (string->list str))) matches)))))
