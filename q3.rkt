;Alexander Kuhn
;ID 101023154
#lang racket
(define (abs x)
  (if (< x 0) (* -1 x) x))

(define (digits n)
  (define (all_digits m)
    (if (< (/ m 10) 1) 1
      (+ 1 (all_digits (/ m 10)))))
  (all_digits (abs n)))

(define (digits-iter n)
  (define (digits-step num count)
    (if (< (/ num 10) 1) count
        (digits-step (/ num 10) (+ count 1))))
  (digits-step (abs n) 1))

;Testing digits
;Builds up operations, but they're just additions, so it's not too much slower than iterative
;Trivial cases
(display "(digits 0)=> ")(newline)
   (display "Expected: 1")(newline)
   (display "Actual: ")(digits 0)(newline)

(display "(digits -100000 )=> ")(newline)
   (display "Expected: 6")(newline)
   (display "Actual: ")(digits -100000)(newline)

(display "(digits 12334567890 )=> ")(newline)
   (display "Expected: 11")(newline)
   (display "Actual: ")(digits 12334567890)(newline)

;Bigger tests
(display "(digits -74841796748417967484179674841796748417967484179674841796748417967484179674841796748417967484179674841796)=> ")(newline)
   (display "Expected: 104")(newline)
   (display "Actual: ")(digits -74841796748417967484179674841796748417967484179674841796748417967484179674841796748417967484179674841796)(newline)

(display "(digits 31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989")(newline)
   (display "Expected: 1001")(newline)
   (display "Actual: ")(digits 31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989)(newline)


;Testing digits-iter
;Marginally faster than recursive version
;Trivial cases
(display "(digits 0)=> ")(newline)
   (display "Expected: 1")(newline)
   (display "Actual: ")(digits-iter 0)(newline)

(display "(digits -100000 )=> ")(newline)
   (display "Expected: 6")(newline)
   (display "Actual: ")(digits-iter -100000)(newline)

(display "(digits 12334567890 )=> ")(newline)
   (display "Expected: 11")(newline)
   (display "Actual: ")(digits-iter 12334567890)(newline)

;Bigger tests
(display "(digits -74841796748417967484179674841796748417967484179674841796748417967484179674841796748417967484179674841796)=> ")(newline)
   (display "Expected: 104")(newline)
   (display "Actual: ")(digits-iter -74841796748417967484179674841796748417967484179674841796748417967484179674841796748417967484179674841796)(newline)

(display "(digits 31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989")(newline)
   (display "Expected: 1001")(newline)
   (display "Actual: ")(digits-iter 31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989)(newline)