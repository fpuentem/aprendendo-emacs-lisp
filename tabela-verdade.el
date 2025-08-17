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

;; --------------------------------------

;; AND bit-a-bit  (AND logico): `logand'

;; 10 = 1010 -> | 1 | 0 | 1 | 0 ||   |
;; (logand 1 2)

;; 0001 & 0000 = 0
;; (logand 1 0)
;; 0001 & 0001 = 1
;; (logand 1 1)
;; 0001 & 0010 = 0
;; (logand 1 2)
;; 0001 & 0011 = 1
;; (logand 1 3)

;; --------------------------------------
;; Deslocamento (shift) aritmetico: `ash'

;; (dotimes (x 4)
;;   (insert "\n" (number-to-string (ash 1 x))))

;; (progn
;;   (insert "\n\n")
;;   (dotimes (x 8)
;;     (dotimes (y 3)
;;       (let ((rev (- 3  y 1)))
;;         (insert (number-to-string rev) (if (= (logand x (ash 1 rev)) 0) ": 0 | " ": 1 | "))))
;;     (insert "\n")))

;; 2: 0 | 1: 0 | 0: 0 |
;; 2: 0 | 1: 0 | 0: 1 |
;; 2: 0 | 1: 1 | 0: 0 |
;; 2: 0 | 1: 1 | 0: 1 |
;; 2: 1 | 1: 0 | 0: 0 |
;; 2: 1 | 1: 0 | 0: 1 |
;; 2: 1 | 1: 1 | 0: 0 |
;; 2: 1 | 1: 1 | 0: 1 |

;; --------------------------------------

;; Loop `dolist'

;; (progn
;;   (insert "\n\n")
;;   (dotimes (x 8)
;;     (dolist (y (number-sequence 2 0 -1))
;;       (insert (if (= (logand x (ash 1 y)) 0) " 0 " " 1 ")))
;;     (insert "\n")))


;; 0  0  0
;; 0  0  1
;; 0  1  0
;; 0  1  1
;; 1  0  0
;; 1  0  1
;; 1  1  0
;; 1  1  1


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
    (dotimes (i nrows)
      (insert " |")
      (dolist (j (number-sequence (- vars 1) 0 -1))
        (insert (if (= (logand i (ash 1 j)) 0) " 0 |" " 1 |")))
      (insert "|   |\n"))
    ;; Volta a celula da saida da primera expressao.
    (goto-char start-pos)))

(provide 'demo/insert-truth-table)
;; | A | B | C || S |
;; +---+---+---++---+
;; | 0 | 0 | 0 ||   |
;; | 0 | 0 | 1 ||   |
;; | 0 | 1 | 0 ||   |
;; | 0 | 1 | 1 ||   |
;; | 1 | 0 | 0 ||   |
;; | 1 | 0 | 1 ||   |
;; | 1 | 1 | 0 ||   |
;; | 1 | 1 | 1 ||   |
