#lang racket

(require racket/contract)

(provide (contract-out
  [step1 (-> (and natural? (lambda (x) (< x 100))) string?)]

  [step2 (-> number? (listof number?))]

  [step3 (-> number? (listof (cons/c number? symbol?)))]

  [step4 (-> number? string?)]
))

;; =============================================================================

(define digits (list "zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"))

(define teens (list "ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen"))

(define tens (list "" "" "twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eihgty" "ninety"))

(define powers-of-1000 (list 'END 'thousand 'million 'billion 'trillion))

(define (step1 n)
  (string-replace
    (cond
      ((< n 10) (list-ref digits n))
      ((< n 20) (list-ref teens (- n 10)))
      ((< n 100)
        (string-append
          (list-ref tens (quotient n 10))
          "-"
          (step1 (modulo n 10)))))
    #rx"[- ]zero" ""))

(define (step1a n)
 (if (< n 100)
   (step1 n)
   (string-append (step1 (quotient n 100)) " hundred " (step1 (modulo n 100)))))

(define (divide N)
  (if (>= 3 (length N)) (list N) (cons (take N 3) (divide (drop N 3)))))

(define (divide-number N)
  (reverse (map reverse (divide (reverse (string->list (number->string N)))))))

(define (step2 N)
  (map (compose string->number list->string) (divide-number N)))

(define (make-pair x y)
  (cons x (list-ref powers-of-1000 y)))

(define (step3 n)
  (map make-pair (step2 n) (reverse (range (length (step2 n))))))

(define (process-pair x)
  (if (and (zero? (car x)) (not (equal? (cdr x) 'END)))
    ""
    (string-append
      (step1a (car x))
      (string-append " " (symbol->string (cdr x))))))

(define (step4 N)
  (if (< N 0)
      (string-append "negative " (step4 (- N)))
      (string-trim
        (string-replace
          (string-join (map process-pair (step3 N)))
           #rx"( zero)|(END)" ""))))

