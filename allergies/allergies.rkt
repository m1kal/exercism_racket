#lang racket

(provide list-allergies allergic-to?)

(define allergies '("eggs" "peanuts" "shellfish" "strawberries"
                    "tomatoes" "chocolate" "pollen" "cats"))

(define (allergic-to? allergen code)
  (and (member allergen (list-allergies code)) #t))

(define (list-allergies code)
  (for/list ((position (in-range (length allergies)))
             #:when (bitwise-bit-set? code position))
    (list-ref allergies position)))
