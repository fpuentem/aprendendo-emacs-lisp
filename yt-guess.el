;;; yt-guess.el --- Jogo da adivinhacao
;;
;;; Commentary:
;;
;;; Apenas uma demostracao de conceitos.
;;
;;; Code:
(defun yt/guess-game-random-number ()
  "Gera um numero aleatorio entre 1 e 100."
  (+ 1 (random 100)))

(defun yt/guess-game-prompt (&optional PREFIX)
  "Pede a digitacao de um numero entre 1 e 100.
Opcionalmente, recebe o argumento PREFIX, que sera
utilizado antes do texto do prompt"
  (let ((prompt (concat PREFIX "Digit um numero entre 1 e 100: ")))
    (string-to-number (read-from-minibuffer prompt))))

(defun yt/guess-game ()
  "Jogo da adivinhacao."
  (interactive)
  (let ((number (yt/guess-game-random-number))
        (guess (yt/guess-game-prompt)))
    (while (null (= number guess))
      (if (> guess number)
          (set 'guess (yt/guess-game-prompt "Alto demais! "))
        (set 'guess (yt/guess-game-prompt "Baixo demais! "))))
    )
  (message "Parabens, voce acertou!"))

(provide 'yt/guess-game)
;;; yt-guess.el ends here
