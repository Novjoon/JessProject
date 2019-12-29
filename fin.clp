(clear)
(reset)
(watch all)

(deffunction savingad (?x, ?y)
			(printout t "�ξ簡��" ?y "���� ���� ��" crlf)
			(printout t "���෮�� ��п��θ� �Ǵ��ϴ� ������ " (* 5000 ?y) "�̹Ƿ�" crlf)
			(printout t "���෮�� ����� ������ �Ǵ� �˴ϴ�." crlf crlf))
			
(deffunction savingnotad (?x, ?y)
			(printout t "�ξ簡��" ?y "���� ���� ��" crlf)
			(printout t "���෮�� ��п��θ� �Ǵ��ϴ� ������ " (* 5000 ?y) "�̹Ƿ�" crlf)
			(printout t "���෮�� ������� ���� ������ �Ǵ� �˴ϴ�." crlf crlf))
		 
(deffunction incomead (?x, ?y)
           (printout t "���� �������� " ?x "�̰�" crlf)
           (printout t "�ξ簡�� " ?y "���� �ξ��ϱ����� �ʿ�� �ϴ� ������" crlf)
           (printout t "��п��θ� �Ǵ��ϴ� ������ " (+ 15000 (* 4000 ?y)) "�̹Ƿ�" crlf)
           (printout t "������ ����� ������ �Ǵ� �˴ϴ�." crlf crlf))

(deffunction incomenotad (?x, ?y)
           (printout t "���� �������� " ?x "�̰�" crlf)
           (printout t "�ξ簡�� " ?y "���� �ξ��ϱ����� �ʿ�� �ϴ� ������" crlf)
           (printout t "��п��θ� �Ǵ��ϴ� ������ " (+ 15000 (* 4000 ?y)) "�̹Ƿ�" crlf)
           (printout t "������ ������� ���� ������ �Ǵ� �˴ϴ�." crlf crlf))    
           
(deffunction investstock ()
			(printout t "������ ���෮�� ����ϰ�" crlf)
			(printout t "���Ե� ����ϹǷ�" crlf)
			(printout t "�ֽĿ� ������ ���� ��õ�帳�ϴ�." crlf crlf))		           
 
(deffunction investcombination ()
			(printout t "������ ���෮�� ����ϰ�" crlf)
			(printout t "������ ������� �����Ƿ�" crlf)
			(printout t "����� �ֽĿ� ���� ������ ���� ��õ�帳�ϴ�." crlf crlf))		 

(deffunction investsaving ()
			(printout t "������ ���෮�� �����ϹǷ�" crlf)
			(printout t "���࿡ ������ ���� ��õ�帳�ϴ�." crlf crlf))
			
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
  