#lang racket

(provide to-roman)

(define digits (hash 1000 (list "M" "D" "C")
                      100 (list "C" "L" "X")
                       10 (list "X" "V" "I")
                        1 (list "I")))

(define (find-digit number digit)
  (let ((roman (hash-ref digits digit)))
    (cond
     ((>= number digit)
      (cons digit (first roman)))
     ((>= number (* digit 0.9))
      (cons (/ (* digit 9) 10) (string-append (last roman) (first roman))))
     ((>= number (* digit 0.5))
      (cons (/ digit 2) (second roman)))
     ((>= number (* digit 0.4))
      (cons (/ (* digit 4) 10) (string-append (last roman) (second roman))))
     (#t (cons 0 "")))))


(define (sort-by-car n1 n2)
  (> (car n1) (car n2)))

(define (car-positive? n)
  (< 0 (car n)))

(define (to-roman number (str ""))
  (if
    (zero? number)
    str
    (let
      ((digit (first
                (sort
                  (filter car-positive?
                    (map (lambda (k) (find-digit number k)) (hash-keys digits)))
                  sort-by-car))))
      (to-roman (- number (car digit)) (string-append str (cdr digit))))))
