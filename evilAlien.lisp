;; compile with 
;; (sb-ext:save-lisp-and-die "alien.exe" :executable t :toplevel 'main)


;5 cls
;10 print "evil alien"
;20 let s = 10   ;;size of grid
;30 let g = 4    ;; amount of goes
;40 let x = int (rnd*S)
;50 let y = int(rnd*s)
;60 let d = int(rnd*s)  ;;distance
;70 for i=1 to 6
;80 print "x position (0 to 9)? "
;85 input x1
;90 print "y position (0 to 9)? "
;100 input y1
;110 print "Distance position (0 to 9)? "
;120 input d1
;130 if X=x1 and y=y1 and d = d1 then goto 300
;140 print "shot was ";
;150 if y1 > y then print "North":
;160 if y1 < y then print "South":
;170 if x1 > x then print "East":
;180 if x1 < x then print "West":
;190 print
;200 if d1 > d then print "Too Far"
;210 if d1 < d then print "Too close"
;220 next i
;230 print "Your time has run out!"
;240 stop
;300 print "BOOM!!! You got him!"
;310 stop


(defvar *grid* 10)
(defvar *goes* 5)

(defun main ()
  "this is the starting point for the game "
  (format t "~%Evil Alien!~%~%")
  (format t "~%a common lisp port of the Osbourne BAISC computer space game of the same title.~%")
  (if (y-or-n-p "Do you need instructions? ") (print-inst) )
  (let ((x (random *grid*))
	(y (random *grid*))
	(z (random *grid*)))
    (main-loop x y z *goes*)))
 



(defun print-inst ()
  "this function prints the game instructions"
  (format t "~%INSTRUCTIONS ~%")
  (format t "~%Somewhere beneath you,in deepest, blackest space, lurks Elron, the evil alien. You have managed to deactivate all but his short-range weapons but he can still make his ship invisible. You know he is somewhere within the three-dimential grid you can see on your ships screen, but where? ~%")
  (format t "~%You have ~A space bombs. Each one can be exploded at a positition in the grid specified by three numbers between 0 and 9, which your computer will ask you for. ~%" *goes*)
    (format t "~%Can you blast the evil Elron out of space before he creeps up on you? ~%"))

(defun get-user-input (prompt)
  "Ask the user for input with a given prompt, and ensure it is an integer between 1 and *grid*."
  (let ((input nil))
    (loop
      (format t "~%~A (1 to ~A): " prompt *grid*)
      (finish-output)  ;; Ensure that the prompt is printed before reading input
      (setq input (read))
      (if (and (integerp input) (>= input 1) (<= input *grid*))
          (return input)
        (format t "Invalid input. Please enter an integer between 1 and ~a.~%" *grid*)))))


(defun check-shot (x y z x1 y1 z1)
  "Check the shot anz print the result."
  (if (and (= x x1) (= y y1) (= z z1))
      (progn
        (format t "BOOM!!! You got him!~%")
        t)
      (progn
	(format t "Shot was ")
	(cond
	  ((< y1 y) (format t "North"))
	  ((> y1 y) (format t "South")))
	(cond
	  ((> x1 x) (format t "East"))
	  ((< x1 x) (format t "West")))
	(format t "~%")
	(cond
	  ((> z1 z) (format t "Too Far"))
	  ((< z1 z) (format t "Too Close")))
	nil)))

(defun main-loop (x y z bombs)
  "Loop through the game get-user-input then testing user input with check-shot"
  (format t "~%")
  (if (zerop bombs) 
      (format t "~%The evil alien escaped !")
    (let* ((x1 (get-user-input "Enter X position (East/West) "))
          (y1 (get-user-input "Enter Y position (North/South) "))
          (z1 (get-user-input "Enter Z position (far/close) ")))
      (format t "~%You have ~A bombs left.~%~%" (1- bombs))
      (when (check-shot x y z x1 y1 z1)
        (return-from main-loop t))  ;; Exit the function when check-shot returns true
      (main-loop x y z (1- bombs)))))


	       
	       
