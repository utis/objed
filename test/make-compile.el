;; emacs -Q -batch -L . -f batch-byte-compile file.el

;;  bail out on compilation warnings and errors
(setq byte-compile-error-on-warn t)
(setq byte-compile--use-old-handlers nil)

;; compile *.el files
(dolist (file (file-expand-wildcards "*.el"))
  (unless (byte-compile-file file)
    (kill-emacs 1)))

(let ((default-directory (expand-file-name "test" default-directory)))
  (dolist (file (file-expand-wildcards "*.el"))
    (unless (byte-compile-file file)
      (kill-emacs 1))))
