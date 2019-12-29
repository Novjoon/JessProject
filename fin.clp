(clear)
(reset)
(watch all)

(deffunction savingad (?x, ?y)
			(printout t "부양가족" ?y "명이 있을 때" crlf)
			(printout t "저축량의 충분여부를 판단하는 기준은 " (* 5000 ?y) "이므로" crlf)
			(printout t "저축량은 충분한 것으로 판단 됩니다." crlf crlf))
			
(deffunction savingnotad (?x, ?y)
			(printout t "부양가족" ?y "명이 있을 때" crlf)
			(printout t "저축량의 충분여부를 판단하는 기준은 " (* 5000 ?y) "이므로" crlf)
			(printout t "저축량은 충분하지 않은 것으로 판단 됩니다." crlf crlf))
		 
(deffunction incomead (?x, ?y)
           (printout t "현재 연수입은 " ?x "이고" crlf)
           (printout t "부양가족 " ?y "명을 부양하기위해 필요로 하는 수입의" crlf)
           (printout t "충분여부를 판단하는 기준은 " (+ 15000 (* 4000 ?y)) "이므로" crlf)
           (printout t "수입은 충분한 것으로 판단 됩니다." crlf crlf))

(deffunction incomenotad (?x, ?y)
           (printout t "현재 연수입은 " ?x "이고" crlf)
           (printout t "부양가족 " ?y "명을 부양하기위해 필요로 하는 수입의" crlf)
           (printout t "충분여부를 판단하는 기준은 " (+ 15000 (* 4000 ?y)) "이므로" crlf)
           (printout t "수입은 충분하지 않은 것으로 판단 됩니다." crlf crlf))    
           
(deffunction investstock ()
			(printout t "고객님은 저축량이 충분하고" crlf)
			(printout t "수입도 충분하므로" crlf)
			(printout t "주식에 투자할 것을 추천드립니다." crlf crlf))		           
 
(deffunction investcombination ()
			(printout t "고객님은 저축량이 충분하고" crlf)
			(printout t "수입은 충분하지 않으므로" crlf)
			(printout t "저축과 주식에 골고루 투자할 것을 추천드립니다." crlf crlf))		 

(deffunction investsaving ()
			(printout t "고객님은 저축량이 부족하므로" crlf)
			(printout t "저축에 투자할 것을 추천드립니다." crlf crlf))
			
(defrule R1
		  (savings_account inadequate)
		  =>
		 (investsaving)
		 (assert (investment savings)))
		  
(defrule R2
		  (savings_account adequate)
		  (income adequate)
		  =>
		 (investstock)
		 (assert (investment stocks)))

(defrule R3
		  (savings_account adequate)
		  (income inadequate)
		  =>
		 (investcombination)
		 (assert (investment combination)))

(defrule R4
		  (amount_saved ?x)
		  (dependents ?y&: (>= ?x (* 5000 ?y)))
		  =>
		  (savingad ?x ?y)
		  (assert (savings_account adequate)))		
	
(defrule R5
		  (amount_saved ?x)
		  (dependents ?y&: (< ?x (* 5000 ?y)))
		  =>
		  (savingnotad ?x ?y)
		  (assert (savings_account inadequate)))	
		            
(defrule R6
          (earnings ?x steady)
          (dependents ?y&: (>= ?x (+ 15000 (* 4000 ?y))))
          =>
         (incomead ?x ?y)
         (assert (income adequate)))	
         	
(defrule R7
          (earnings ?x steady)
          (dependents ?y&: (< ?x (+ 15000 (* 4000 ?y))))
          =>
         (incomenotad ?x ?y)
         (assert (income inadequate)))         
              
(defrule R8
		  (earnings ?x unsteady)
		  =>
         (assert (income inadequate)))              	  
  