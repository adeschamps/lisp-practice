(defun eval-int ()
  (do ((value (digit-char-p (read-char)) (+ (* 10 value) (digit-char-p (read-char)))))
	  ((not (digit-char-p (peek-char))) value)))

(defun eval-dec ()
  (if (digit-char-p (peek-char))
	  (* 0.1 (+ (digit-char-p (read-char)) (eval-dec))) 0))

(defun eval-number ()
  (+ (if (not (char= #\. (peek-char))) (eval-int) 0)
	 (if (char= #\. (peek-char)) (progn (read-char) (eval-dec)) 0)))

(defun eval-expr ()
  (let ((term (eval-term)))
	(cond
	 ((char= #\+ (peek-char)) (progn (read-char) (+ term (eval-expr))))
	 ((char= #\- (peek-char)) (progn (read-char) (- term (eval-expr))))
	 (t                                             term))))

(defun eval-term ()
  (let ((factor (eval-factor)))
	(cond
	 ((char= #\* (peek-char)) (progn (read-char) (* factor (eval-term))))
	 ((char= #\/ (peek-char)) (progn (read-char) (/ factor (eval-term))))
	 (t                                             factor))))

(defun eval-factor ()
  (cond
   ((digit-char-p (peek-char))                       (eval-number))
   ((char= #\.    (peek-char))                       (eval-number))
   ((char= #\+    (peek-char)) (progn (read-char)    (eval-number)))
   ((char= #\-    (peek-char)) (progn (read-char) (- (eval-number))))
   ((char= #\(    (peek-char)) (progn (read-char) (let ((expr (eval-expr))) (read-char) expr)))))

(print (eval-expr))
