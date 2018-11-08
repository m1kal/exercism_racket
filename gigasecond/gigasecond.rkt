#lang racket

(provide add-gigasecond)

(require racket/date)

(define (add-gigasecond input)
  (seconds->date (+ 1000000000 (date->seconds input))))
