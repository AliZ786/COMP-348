
(defun flatten (lst)
    (setq output `())
    (setq input lst)
    (loop while (not (null input)) ;loop until input list is empty
        do (progn
            (loop while (listp (car input)) ;if first element of list is a list
                do (progn
                (let ((x (car input)))  
                    (if (= (length x ) 1)   ;move first element to start of list
                        (setf (car input) (car (car input)))
                        (progn
                            (loop while (listp x)
                                do (setf x (car x))
                            )
                            (setf (car input) (cdr (car input)))
                            (setf input (append (list x) input))
                        )
                    )
                ))
            )
            ;append to output list
            (if (and (numberp (car input)) (not (find (car input) output)))
                (setf output (append output (list (car input))))
            )
            ;remove from input list
            (setf input (cdr input))
        )
    )
    output
)
