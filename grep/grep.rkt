#lang racket

(provide grep)

(define (check-line out line pattern inv line-num)
  (if (xor (regexp-match pattern line) inv)
     (cons
        (if line-num (string-append (number->string line-num) ":" line) line)
        out)
   out))

(define (check-lines in out pattern lines line-num inv)
  (let ((line (read-line in)))
    (if (eof-object? line)
        out
        (let ((out (check-line out line pattern inv (and lines line-num))))
          (check-lines in out pattern lines (add1 line-num) inv)))))

(define (parse-flags flags)
  (lambda (flag) (member flag flags)))

(define (grep-single flags pattern filename add-filename)
  (let*
    ((in (open-input-file filename))
     (pattern (if (flags "-x") (string-append "^" pattern "$") pattern))
     (pattern
       (regexp (if (flags "-i") (string-append "(?i:" pattern ")") pattern)))
     (lines (reverse (check-lines in '() pattern (flags "-n") 1 (flags "-v")))))
    (if (flags "-l")
        (if (empty? lines) '() (list filename))
        (if add-filename
          (map (lambda (x) (string-append filename ":" x)) lines)
          lines))))

(define (grep flags pattern filenames)
  (foldl
    (lambda
       (filename acc)
       (append
         (grep-single
           (parse-flags flags)
           pattern
           filename
           (< 1 (length filenames)))
         acc))
    '()
    (reverse filenames)))
