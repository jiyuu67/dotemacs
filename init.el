;; Do NOT run garbage collection during startup
(setq gc-cons-threshold 999999999)

;; Ignore default regex checks of filenames during startup
(let ((file-name-handler-alist nil))
  (load-file "~/.emacs.d/setup-package.el")
  (org-babel-load-file "~/.emacs.d/conf.org")
  (org-babel-load-file "~/.emacs.d/.private.org" :noerror))

;; Revert garbage collection behavior
(run-with-idle-timer
 5 nil
 (lambda ()
   (setq gc-cons-threshold 1000000)))
