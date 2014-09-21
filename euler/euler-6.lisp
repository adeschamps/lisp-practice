(defun sum-of-squares (x)
  (loop for i from 1 to x summing (* i i)))

(defun square-of-sum (x)
  (expt
   (setq sum (/ (* x (+ x 1)) 2))
   2))

(defun euler-6 (x)
  (- (square-of-sum x)
     (sum-of-squares x)))

(print (euler-6 10))
(print (euler-6 100))
