;; -*- lexical-binding: t -*-

(require 'ert)
(require 'emmet3)

(ert-deftest emmet3-test-at-point
    ()
  (with-temp-buffer
    (insert ".p3")
    (should (equal (emmet3--at-point)
                   "<div class=\"p3\"></div>"))))

(ert-deftest emmet3-test-at-point-not-at-bob
    ()
  (with-temp-buffer
    (insert "a thing a lorem classic .p3")
    (should (equal (emmet3--at-point)
                   "<div class=\"p3\"></div>"))))
