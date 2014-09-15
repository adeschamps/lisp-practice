(defun euler-1 (x)
  (setq sum 0)
  (loop for i from 1 to (- x 1) do
	(when (or (= (mod i 3) 0)
		  (= (mod i 5) 0))
	  (setq sum (+ sum i))))
  sum)

(print (euler-1 1000))
