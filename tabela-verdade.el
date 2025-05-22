;;
;;; Commentary:
;;
;; Exercicio da serie "Aprendendo Emacs Lisp"
;;
;;; Code:

;;; Funcoes e macros novas...

;; -----------------------------

;; Para que serve o `let*'?
;; (let ((number (read-number "Prompt: "))
;;       (times10 (* number 10)))
;;   (print number)
;;   (print times10))

;; -----------------------------

;; Funcao `number-sequence'...

;; -----------------------------

;; Expresiones lambda

;; (funcall (lambda (x) (expt 2 x)) 63)
;; (lambda (x) (expt 2 x))

;; Funciones `mapcar' e `mapconcat'

;; Retorna uma lista com as avaliacoes da funcao
;; (mapcar (lambda (x) (expt 2 (car x))) '((0 1) (2 3) (4 5)))
;; (1 4 16)

;; Retorna uma string concatenando as avaliacoes da funcao
;; (mapconcat (lambda (x) (number-to-string (expt 2 x))) '(0 1 2 3 4) "|")
;; "1|2|4|8|16"


(defun demo/insert-truth-table ()
  "Insert uma tabela de verdade no ponto do cursor"
  (interactive)
  ;; Definicao das variaveis locais.
  (let* ((start-pos nil)
         (vars (read-number "Numero de variaveis: "))
         (thead (mapconcat (lambda (c) (char-to-string (+ c ?A)))
                           (number-sequence 0 (- vars 1)) " | "))
         (head-sep (mapconcat (lambda (_) "+---")
                              (number-sequence 0 (- vars 1))))
         (nrows (expt 2 vars)))
    ;; Insert o cabecalho da tabela.
    (insert " | " thead " || S |\n")
    (insert " " head-sep "++---+\n")
    ;; Atualiza o ponto de retorno ao fim da impressao.
    (setq start-pos (+ (point) (* vars 4) 4))
    ;; Imprimir as linhas da tabela.

    ;; Volta a celula da saida da primera expressao.

    ))

(provide 'demo/insert-truth-table)
