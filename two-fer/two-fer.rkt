#lang racket

(provide two-fer)

(define (two-fer [person "you"])
  (~a "One for " person ", one for me."))
