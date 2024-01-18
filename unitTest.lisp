(load "path/to/your/main.lisp")

(ql:quickload "fiveam")  ;; Load the FiveAM library
(use-package :fiveam)    ;; Use the FiveAM package

(def-suite *test-suite* :description "Test suite for the Evil Alien game")

(in-suite *test-suite*)

(test check-shot
  "Test the check-shot function"
  (is (equal (check-shot 1 1 1 1 1 1) t))
  (is (equal (check-shot 1 1 1 2 2 2) nil)))

(test get-user-input
  "Test the get-user-input function"
  ;; Mock the read function to return a fixed value
  (let ((read (lambda () 5)))
    (is (equal (get-user-input "Test") 5))))

(test main-loop
  "Test the main-loop function"
  ;; Mock the get-user-input and check-shot functions to return fixed values
  (let ((get-user-input (lambda (prompt) 1))
        (check-shot (lambda (x y z x1 y1 z1) t)))
    (is (equal (main-loop 1 1 1 1) t))))

(test print-inst
  "Test the print-inst function"
  ;; Mock the format function to return a fixed value
  (let ((format (lambda (&rest args) t)))
    (is (equal (print-inst) t))))

(test main
  "Test the main function"
  ;; Mock the y-or-n-p, format, random, and main-loop functions to return fixed values
  (let ((y-or-n-p (lambda (prompt) nil))
        (format (lambda (&rest args) nil))
        (random (lambda (n) 1))
        (main-loop (lambda (x y z bombs) t)))
    (is (equal (main) t))))

(fiveam:run!)
