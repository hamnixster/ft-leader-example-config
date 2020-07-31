(setq debug-on-error t)

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))
(defvar ft-base-dir user-emacs-directory)
(defvar ft-leader-dir (expand-file-name "ft-leader" ft-base-dir))
(add-to-list 'load-path ft-leader-dir)

(require 'package)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(custom-set-variables '(package-selected-packages '(which-key)))

(package-refresh-contents)
(dolist (pkg package-selected-packages)
  (package-installed-p pkg)
  (ignore-errors
    (package-install pkg)))

;; require and configure ft-leader
(require 'ft-leader-mode)
(setq ft-leader-special-map      '(?f))
(setq ft-leader-special-command  '(?o))
(setq ft-leader-mod-alist        '((nil . "C-") ("SPC" . "") ("m" . "M-")))

;; enable and setup ft-leader
(ft-leader-mode)
(ft-leader-setup-special-maps)
(ft-leader-bind-special-maps)

;; bind leader exec
(global-set-key (kbd "C-z") 'ft-leader-mode-exec)
;; bind special commands
(global-set-key (kbd "C-c o") 'move-end-of-line)
;; bind in nested maps
(ft-leader-define-key ?f "C-f" 'find-file)

;; optionally enable which-key
(setq ft-leader-which-key t)
(require 'which-key)
(setq which-key-idle-delay 0.1)
(which-key-mode +1)
