#lang racket

(provide my-length
         my-reverse
         my-map
         my-filter
         my-fold
         my-append
         my-concatenate)

(define (my-length input)
  (cond
    ((empty? input) 0)
    (else (add1 (my-length (cdr input))))))

(define (my-map f input)
  (cond
    ((empty? input) '())
    (else (cons (f (car input)) (my-map f (cdr input))))))

(define (my-filter f input)
  (cond
    ((empty? input) '())
    ((f (car input)) (cons (car input) (my-filter f (rest input))))
    (else (my-filter f (rest input)))))
        
(define (my-fold op init input)
  (cond
    ((empty? input) init)
    (else (my-fold op (op (car input) init) (cdr input)))))

(define (my-reverse input)
  (my-fold cons '() input))

(define (my-append list1 list2)
  (my-fold cons list2 (my-reverse list1)))

(define (my-concatenate input )
  (my-fold my-append '() (my-reverse input)))

