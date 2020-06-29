

(defun triangle (n)
(cond 
((equal n 0) (print "invalid number; please enter a positive or a negative integer"))
((and (integerp n) (< n 0))
(loop for x from 1 to (abs n)
      do (loop for y from 1 to (abs n)
                   do (progn (if(< y x) (format t " ") (format t "*") )))
      do (terpri)
))
((integerp n)
(loop for x downfrom n to 1
      do (loop for y downfrom x to 1
                   do (format t "*"))
      do (terpri)
))
(t(print "invalid number; please enter a positive or a negative integer"))
))



(write (triangle 7))
