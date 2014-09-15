;; Checks if num is divisible by all numbers from 1 to max
;; Starts halfway for efficiency
;; (if num is divisible by 10, then it must be divisible by 5)
(defun divisible-by-all (num max)
  (loop for i from (round (/ max 2)) to max do
	;;(format t "Testing ~a divided by ~a~%" num i)
	(if (> (mod num i) 0)
	    (return-from divisible-by-all nil)))
  t)

;; A naive prime checker
;; That's okay. It's only needed for small numbers
(defun prime (n)
  (loop for i from 2 to (- n 1) do
	(if (= (mod n i) 0)
	    (return-from prime nil)))
  t)

;; Finds a number, n, which is divisible by all numbers from 1 to x
;; Goes in increments of the product of the primes less than or equal to x
(defun euler-5 (x)
  (setq inc 1)
  (loop for i from 1 to x do
	(if (prime i) (setq inc (* inc i))))

  (setq n inc)
  (loop while (not (divisible-by-all n x)) do
	(setq n (+ n inc)))
  n)

(print (euler-5 10))
(print (euler-5 20))
