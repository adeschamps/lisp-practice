(defun euler-3 (x)
  (loop for i from 2 to (- x 1) do
	(if (= (mod x i) 0)
	    (return-from euler-3 (euler-3 (/ x i)))))
  x)

(print (euler-3 13195))
(print (euler-3 600851475143))
