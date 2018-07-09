; modpowers

(define (orbit k n)
  (let ((k (remainder k n)))
    (define (aux i els)
      (cond ((< i 2)
	     (let ((els  (cons i els)))
	       (list (list 'size (length els)) els)))
	    ((member i els)
	     (list (list 'size (length els))
		   (list 'rpt i)
		   els))
	    (else (aux (remainder (* k i) n) (cons i els)))))
    (cond ((= k 0) (list (list 'size 1) '(0)))
	  ((= k 1) (list (list 'size 1) '(1)))
	  (else (aux k '())))))

(define (summary-lengths n)
  (define (aux i orblnths)
    (if (< i n)
	(let ((olnth (cadar (orbit i n))))
	  (aux (+ i 1)
	       (if (member olnth orblnths)
		   orblnths
		   (cons olnth orblnths))))
	(list (list `mod n 'orbit-lengths) orblnths)))
  (aux 0 '()))

(define (summary-orbits n)
  (define (aux i orblist)
    (if (< i n)
	(aux (+ i 1)
	     (cons (orbit i n) orblist))
	(cons `mod (cons n (cons 'orbits orblist)))))
  (aux 2 '()))

(define (olnths n)
  (define (aux k ss)
    (if (> k n)
	ss
	(aux (+ k 1) (cons (summary k) ss))))
  (if (< n 2)
      'arg<2
      (aux 2 '())))
#|
(orbit 1 2)
(orbit 2 3)
(orbit 2 4)
(orbit 3 5)
(orbit 4 5)
(orbit 6 15)
(orbit 8 15)

(summary 15)
|#