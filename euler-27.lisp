(defun prime (n)
  ;; (format t "testing ~a for primeness~%" n)
  (loop for i from 2 to (- n 1) do
	(if (= (mod n i) 0)
	    (return-from prime nil)))
  t)

(defun count-primes (a b)
  (loop for n from 0 do
	;;(format t "testing ~a~%" n)
	(unless (prime (+ (* n n) (* a n) b))
	  (return-from count-primes n))))

(defun euler-27 (&optional (max-a 100) (max-b max-a))
  (setq max-count 0)
  (loop for a from (- 1 max-a) to (- max-a 1) do
	(format t "testing a = ~a~%" a)
	(loop for b from (- 1 max-b) to (- max-b 1) do
	      (setq count (count-primes a b))
	      (if (> count max-count)
		  (progn
		    (setq max-count count)
		    (setq best-coeffs (list a b))))))
  (* (first best-coeffs) (second best-coeffs)))

(print (euler-27 1000))
