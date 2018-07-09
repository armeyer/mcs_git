
(load (t:expand-ps-file-name "infix.scm"))

;; problem 4
(define-problem
  '(
    (type short-answer)
    (title "Addition rule")
    (intro
     "<strong>What is the probability that you roll a total of 7 or 11
     when you roll two dice?</strong>")
;      (boxsize 5)
      (box-width 5)
;      (compare equal?)
      (questions
       (! ""  (answer "2/9"
          (compare 
	      (lambda (ans response)
               (test-infix-numerical-expressions ans response '() '() 1 '()))
                 )
		      (rationale "The events of rolling a 7 and
rolling a 11 are disjoint so we can add the probabilities of each to
get the answer.  First, there are 6&middot;6=36 total outcomes for
rolling two dice, and each outcome is equally likely to occur.  The
event of the dice totalling 7 consists of the 6 outcomes (1,6), (2,5), (3,4), (4,3), (5,2), and (6,1).  The probability of this event is
therefore 6/36 = 1/6.  The event of the dice totalling 11 consists of
the 2 outcomes (5,6) and (6,5).  The probability of this event is 2/36
= 1/18.  Adding the two up, 1/6 + 1/18 = 2/9."  ))) );questions
;      (extro "")
      );'
);define-problem
