#lang racket

(provide numbers area-code pprint)

(define (numbers input)
  (let ((clean
           (regexp-replace
             #px"^1(.{10})"
             (string-replace input #rx"[-\\(\\)\\. ]" "")
              "\\1" )))
    (if (= (string-length clean) 10)
        clean
        "0000000000")))

(define (area-code number)
  (substring (numbers number) 0 3))

(define (pprint number)
  (regexp-replace #px"(.{3})(.{3})(.{4})" (numbers number) "(\\1) \\2-\\3"))
