;; Expresiones lambda
(funcall (lambda (x) (expt 2 x)) 63)
(lambda (x) (expt 2 x))

;; Funciones `mapcar' e `mapconcat'
(mapcar (lambda (x) (expt 2 (car x))) '((0 1) (2 3) (4 5)))
;; (1 4 16)
