;;; yt-guess-buffer.el -- Jogo da adivinhacao em buffer
;;
;;; Commentary:
;;
;;; Apenas uma demostracao da escrita em buffers.
;;
;;; Code:

;; Define um numero aleatorio...
(defun yt/guess-game-random-number ()
  "Gera um numero aleatorio."
  (+ 1 (random 100)))

;; Prompt de entrada de palpites...
(defun yt/guess-game-prompt (BUFFER)
  "Pede a entrada de un numero entre 1 e 100.
A entrada sera avaliada a partir do buffer BUFFER."
  (with-current-buffer BUFFER
    (let ((prompt "Digite um numero de 1 a 100: "))
      (insert prompt)
      (string-to-number (read-from-minibuffer prompt)))))


;; Resposta da avaliacao do palpite...
(defun yt/guess-game-replay (BUFFER RESULT)
  "Imprime a avaliacao do palpite no buffer BUFFER.
O texto do resultado da avalicao e recebido no argumento RESULT."
  (with-current-buffer BUFFER
    (insert "\n" RESULT "\n")
    (yt/guess-game-prompt BUFFER)))


;; Loop principal do jogo...
(defun yt/guess-game-buffer ()
  "Jogo da adivinacao com saida no buffer."
  (interactive)
  (let ((buffer (get-buffer-create "*guess-game*")))
    (with-current-buffer buffer
      (erase-buffer)
      (insert "JOGO DA ADIVINHACAO\n")
      (insert "===================\n\n")
      (goto-char (point-max))
      (switch-to-buffer buffer)
      (let ((number (yt/guess-game-random-number))
            (guess (yt/guess-game-prompt buffer)))
        (print number)
        (print guess)
        (while (null (= number guess))
          (insert (number-to-string guess) "\n")
          (if (> guess number)
              (setq guess (yt/guess-game-replay buffer "Alto demais!"))
            (setq guess (yt/guess-game-replay buffer "Baixo demais!"))))
        (insert (number-to-string guess) "\n\n"))
      (insert "Parabens, voce acertou!"))))

(provide 'yt/guess-buffer)
;;; yt-guess-buffer.el ends here
