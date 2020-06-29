(defun collatz (n)
    (setq output `())
    (if (= (car n) 1)
        (setf output `(1))
    )
    
    (let ((x (car n)))
        (loop while (/= x 1)
        do (progn 
            (cond
                ((evenp x)(setf x (/ x 2)))
                ((oddp x)(setf x (+ (* x 3) 1)))
            )
            (setf output (append output (list x)))
        ))
    )
    output
)

(defun collatz_n (n)
    (setq x 1)
    (loop while (<= x n)
        do (progn
            (format t "~d~C:" x #\tab)
            (write (collatz (list x)))
            (terpri)
            (setf x (+ x 1))
        )
    )
)

(collatz_n 20)
