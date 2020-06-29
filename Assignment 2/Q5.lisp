

(defun binary-tree-count-nodes (node)
  (if (binary-tree-empty-p node)
      0
      (+ 1
         (binary-tree-count-nodes (binary-tree-left  node))
         (binary-tree-count-nodes (binary-tree-right node)))))


(defun balancedp (node)
  (or (binary-tree-empty-p node)
      (<= (abs (- (binary-tree-count-nodes (binary-tree-left  node))
                  (binary-tree-count-nodes (binary-tree-right node))))
          1)))

(defun binary-tree-from-sexp (sexp) sexp)

(defstruct (binary-tree (:type list) :named)
  label left right)
(defun make-empty-binary-tree () 'nil)
(defun binary-tree-empty-p (node) (null node))
(defun binary-tree-p    (node)
  (or (binary-tree-empty-p node)
      (let ((nodes '()))
        (labels ((check-node (node)
                   (and (listp node)
                        (not (member node nodes)) ; check circular structures.
                        (progn (push node nodes) t)
                        (eql 3 (list-length node))
                        (or (null (second node)) (check-node (second node)))
                        (or (null (third  node)) (check-node (third  node))))))
          (check-node node)))))
          (defparameter *tree-0* 'nil)
(defparameter *tree-1* '(a nil nil))
(defparameter *tree-2* '(a (b (d nil nil) (e nil nil)) (c nil (f (g nil nil) nil))))
                   (write-line"T")
            (balancedp (binary-tree-from-sexp '(x (x nil nil) (x nil (x nil nil)))))
       (balancedp (binary-tree-from-sexp '(x nil (x (x nil nil) nil))))


(write (balancedp '(a b c)))
