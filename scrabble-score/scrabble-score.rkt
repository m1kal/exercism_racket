#lang racket

(provide score)

(define (letter-score letter)
  (cond
    ((member letter (list #\A #\E #\I #\O #\U #\L #\N #\R #\S #\T)) 1)
    ((member letter (list #\D #\G)) 2)
    ((member letter (list #\B #\C #\M #\P)) 3)
    ((member letter (list #\F #\H #\V #\W #\Y)) 4)
    ((member letter (list #\K)) 5)
    ((member letter (list #\J #\X)) 8)
    ((member letter (list #\Q #\Z)) 10)
    (else 0)))

(define (score word)
  (for/sum ((letter (in-string (string-upcase word)))) (letter-score letter)))
