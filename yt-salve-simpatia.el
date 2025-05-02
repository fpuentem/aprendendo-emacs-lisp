;; Happy hacking, fabricio - Emacs ♥ you!

(defun salve ()
  "Um simples salve, simpatia."
  (interactive)
  (insert "Salve, simpatia"))

(salve)
;; Salve, simpatia
;; Salve, simpatia
;; "Salve, simpatia"
;; Salve, simpatia
(defun meu/falae ()
  "Um simples cumprimento da minha parte."
  (interactive)
  (message "Falae, %s" (read t)))

(defun meu/ifalae ()
  "Um simples cumprimento da minha parte."
  (interactive)
  (insert (format "Falae, %s" (read t))))

Falae, Fab

(read-from-minibuffer "Qual e a sua graca? ")

(defun meu/ifalae ()
  "Um simples cumprimento da minha parte."
  (interactive)
  (insert (format "Falae, %s" (read-from-minibuffer "Qual e a sua graca? "))))

Falae, Fabricio Puente
