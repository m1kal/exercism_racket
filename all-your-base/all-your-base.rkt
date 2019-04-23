#lang racket

(provide rebase)

(define (check-input list-digits in-base out-base)
  (and (< 1 in-base)
       (< 1 out-base)
       (empty?
         (filter
           (lambda (digit) (or (< digit 0) (<= in-base digit))) list-digits))))

(define (calculate-value list-digits in-base)
  (or (foldl (lambda (digit acc) (+ (* in-base acc) digit)) 0 list-digits) 0))

(define (value-to-base val out-base)
  (cdr
    (foldl
      (lambda (i acc)
        (cons (quotient (car acc) out-base)
              (cons (modulo (car acc) out-base) (cdr acc))))
      (cons val '())
      (range (log (add1 val) out-base)))))

(define (rebase list-digits in-base out-base)
  (and
    (check-input list-digits in-base out-base)
    (let* ((val (calculate-value list-digits in-base))
           (out-list (value-to-base val out-base)))
      (if (empty? out-list) '(0) out-list))))
