#lang racket

(provide meetup-day)

(define (gauss year)
  (modulo (+ 1 (* 5 (modulo (sub1 year) 4)) (* 4 (modulo (sub1 year) 100))
             (* 6 (modulo (sub1 year) 400)))
          7))

(define (leap? year)
  (or (zero? (modulo year 400))
      (and (positive? (modulo year 100)) (zero? (modulo year 4)))))

(define (month-lengths year)
  (list 31 (if (leap? year) 29 28) 31 30 31 30 31 31 30 31 30))

(define (days-to-month-start year month)
 (foldl + 0 (take (month-lengths year) (sub1 month))))

(define (start-of year month)
  (modulo (+ (gauss year) (days-to-month-start year month)) 7))

(define weeks (hash 'first 0 'second 7 'third 14 'fourth 21
                    'teenth 12 'last 24))

(define (week-start year month week)
  (+ (start-of year month) (hash-ref weeks week)))

(define days (hash 'Sunday 0 'Monday 1 'Tuesday 2 'Wednesday 3
                   'Thursday 4 'Friday 5 'Saturday 6))

(define (get-day-of-month start day week)
  (add1 (+ (hash-ref weeks week) (modulo (- (hash-ref days day) start) 7))))

(define (meetup-day year month day week)
  (let* ((day-of-month (get-day-of-month (week-start year month week) day week))
         (day-of-year (sub1 (+ day-of-month (days-to-month-start year month)))))
    (date* 0 0 0  day-of-month month year
           (hash-ref days day) day-of-year #f 0 0 "UTC")))
