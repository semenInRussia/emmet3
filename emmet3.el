;;; emmet3.el --- The third (that I know) implementation of emmet for Emacs  -*- lexical-binding: t; -*

;; Copyright (C) 2023 semenInRussia

;; Author: semenInRussia <hrams205@gmail.com>
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.3"))
;; Homepage: https://github.com/semenInRussia/emmet3

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Refactoring for `org-mode' headings.

;;; Code:

(require 'emmet-mode)

(defun emmet3-capf ()
  "The completion at point function for Emmet expansion.

Show the result in auto-completion popup."
  (interactive)
  (save-excursion
    (if (nth 3 (syntax-ppss))  ; inside string
        nil
      (let ((end (point))
            (beg (emmet-find-left-bound))
            (collection (list (emmet3--at-point))))
        (and
         collection
         (list beg end
               collection
               :company-kind (lambda (_) 'string)
               ;; :exit-function (lambda (_ st) (and (eq st 'finished)
               ;;                                    (emmet-expand-line 0)))
               ))))))

(defun emmet3--at-point ()
  "Return a string which is an expansion of an Emmet markup at the cursor."
  (emmet-transform (buffer-substring-no-properties (point) (emmet-find-left-bound))))

(provide 'emmet3)
;;; emmet3.el ends here
