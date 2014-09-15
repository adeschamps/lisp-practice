(defun sum-of-squares (x)
  (setq result 0)
  (loop for i from 1 to x do
	(setq result (+ result (* i i))))
  result)

(defun square-of-sum (x)
  (setq sum (/ (* x (+ x 1)) 2))
  (* sum sum))

(defun euler-6 (x)
  (- (square-of-sum x)
     (sum-of-squares x)))

(print (euler-6 10))
(print (euler-6 100))
