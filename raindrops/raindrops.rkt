#lang racket

(provide convert)

(define conversions (hash 3 "Pling" 5 "Plang" 7 "Plong"))

(define (pling number)
  (lambda
    (base)
    (and (zero? (modulo number base))
         (dict-ref conversions base #f))))

(define (convert number)
  (let
    ([response
      (string-join
        (filter
          identity
          (map (pling number) '(3 5 7)))
        "")])
    (if (non-empty-string? response)
        response
        (number->string number))))

