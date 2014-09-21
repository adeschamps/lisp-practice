(defun approx-pi (digits)
  (loop for n from 0
	for y = (* 4 (/ (expt -1 n) (1+ (* 2 n))))
	while (>= y (expt 10 (- digits)))
	summing y))

(defun approx-e (digits)
  (loop for n from 0
	for y = (/ 1 (! n))
	while (>= y (expt 10 (- digits)))
	summing y))

(format t "pi to three decimals: ~a~%" (float (approx-pi 3)))
(format t " e to three decimals: ~a~%" (float (approx-e 3)))
