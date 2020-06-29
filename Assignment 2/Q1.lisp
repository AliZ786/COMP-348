(defun take-n (lst n)
    (cond 
        ((>= n (list-length lst)) lst)
        ((< n 1) `())
        (t (take-n (cdr lst) n))
    )
)
